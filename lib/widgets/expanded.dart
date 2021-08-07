/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-03 11:32:15 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-03 11:38:13
 */

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Expanded handler
class YZExpandedHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Expanded';

  @override
  Widget build(Map json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget {

  final Map json;

  _Builder(this.json, {Key key}): super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    //Deal with props / 处理控件属性
    YZExpandedConfig props = YZExpandedConfig.fromJson(super.config.props) ?? {};
    int _flex = YZDynamicWidgetUtils.intAdapter(props?.flex);
    Widget _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: context);

    Expanded _subwidget = Expanded(
      flex: _flex ?? 1,
      child: _child
    );  

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config.xEvents);

    return _widget;
  }

  @override
  void registerActions() {

  }

}

/// The props of Expanded config
class YZExpandedConfig {
  String flex;
  Map child;

  YZExpandedConfig(
      {this.flex,
      this.child});

  YZExpandedConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    flex = json['flex'];
    child = json['child'];
  }
}
