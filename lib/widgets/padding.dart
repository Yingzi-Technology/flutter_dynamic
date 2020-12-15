/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-03 11:25:41 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-19 10:11:28
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Padding handler
class YZPaddingHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Padding';

  @override
  Widget build(Map<String, dynamic> json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget {

  final Map<String, dynamic> json;

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
    YZPaddingConfig props = YZPaddingConfig.fromJson(super.config.props) ?? {};
    EdgeInsets _padding = YZDinamicWidgetUtils.edgeInsetAdapter(props.padding);
    Widget _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: context);

    Padding _subwidget = Padding(
      padding: _padding,
      child: _child,
    );  

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
    actionFunctions['setState'] = stateSetter; 
  }

  void stateSetter({
      Map params, 
      YZDynamicRequest request,
      List<YZDynamicActionRule> rules,
      Map localVariables,
      State state,
    }) {
    print('Execute xAction: ${this.runtimeType} stateSetter');
    if (mounted) {
      setState(() {});
    }
  }

}

/// The props of Padding config
class YZPaddingConfig {
  List padding;
  Map child;

  YZPaddingConfig(
      {this.padding,
      this.child});

  YZPaddingConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    padding = json['padding'] == null ? null : jsonDecode(json['padding']);
    child = json['child'];
  }
}