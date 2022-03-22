/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-01 21:36:18     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-01-27 14:59:37
**/

import 'package:flutter/material.dart';

import '../tools/common.dart';
import 'basic/page.dart';
import 'model/page_config.dart';

/// 应用了表单 (formpage )数据模型的Widget，不包含nav和submit
class YZDynamicFormWidget extends YZDynamicBasePage {
  final YZDynamicPageTemplateConfig? pageConfig;
  final List<Map>? childrenJson;
  final YZDynamicPagePreConfig? preConfig;

  YZDynamicFormWidget(this.childrenJson,
      {this.pageConfig, this.preConfig})
      : super(pageConfig: pageConfig, preConfig: preConfig);

  @override
  _YZDynamicFormWidgetState createState() => _YZDynamicFormWidgetState();
}

class _YZDynamicFormWidgetState extends YZDynamicBaseState<YZDynamicFormWidget> {
  @override
  void initState() {
    super.initState();

    assert(widget.childrenJson != null,
        'The children should not be null for formpage type.');
    // for (Map json in widget.childrenJson) {
    //   dealWidgetKey(json);
    // }
  }

  @override
  void registerActions() {
    super.registerActions();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget.childrenJson?.length == 1) {
      return YZDynamicCommon.buildWidget(widget.childrenJson![0], context: context)!;
    } else {
      List<Widget> children = [];
      for (Map json in widget.childrenJson!) {
        String xKey = json['xKey'];
        Widget? widget = YZDynamicCommon.buildWidget(json, context: context);
        if ((widget is Column) || (widget is PreferredSizeWidget)) {
          print('Error: Form widget can not be Column or PreferredSizeWidget');
          continue;
        }
        if (widget == null) {
          String widgetName = json['widgetName'];
          children.add(Text('Not found widget of "$widgetName" for xKey "$xKey"'));
        } else {
          children.add(widget);
        }
      }

      if (children.isEmpty) {
        children = [Text('No widgets')];
      }

      return Column(children: children);
    }
  }
}
