/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-01 21:36:18     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-03 14:52:59
**/

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/page.dart';
import 'model/page_config.dart';

/// 用户自定义页面
/// User customize page
class YZDynamicCustomPage extends YZDynamicBasePage {
  final YZDynamicPageTemplateConfig? pageConfig;
  final YZDynamicPagePreConfig? preConfig;

  YZDynamicCustomPage(this.pageConfig, {this.preConfig})
      : super(pageConfig: pageConfig, preConfig: preConfig);

  @override
  _YZDynamicCustomPageState createState() => _YZDynamicCustomPageState();
}

class _YZDynamicCustomPageState
    extends YZDynamicBaseState<YZDynamicCustomPage> {
  Map? _rootWidgetJson;

  @override
  void initState() {
    super.initState();

    _rootWidgetJson = widget.pageConfig?.rootWidget;
    if (_rootWidgetJson != null &&
        _rootWidgetJson!['widgetName'] == 'Scaffold') {
      Map? props = _rootWidgetJson!['props'];
      if (props != null) {
        Map appBar = props['appBar'];
        dealWidgetKey(appBar);
        Map body = props['body'];
        dealWidgetKey(body);
      }
    } else {
      dealWidgetKey(_rootWidgetJson);
    }
  }

  @override
  void registerActions() {
    super.registerActions();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget? _rootWidget =
        YZDynamicCommon.buildWidget(_rootWidgetJson, context: context);

    assert(_rootWidget != null, 'Error: rootWidget can not be null! Do you mean formwidget?');
    if (_rootWidget == null) return Text('rootWidget is null! Do you specify custompage?');

    return Container(
      key: UniqueKey(),
      child: _rootWidget,
    );
  }
}
