/*
 * @Description: Align
 * @Author: chenlijiao
 * @Date: 2021-03-16 15:02:31
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-16 16:49:06
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZAlignHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Align';

  @override
  Widget build(Map json,
      {Key key, BuildContext buildContext}) {
    return _Builder(json, key: key);
  }
}

class _Builder extends YZDynamicBaseWidget {
  final Map json;

  _Builder(this.json, {Key key}) : super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {
  //Deal with props / 处理控件属性
  YZAlignConfig props;
  AlignmentGeometry _alignment;
  double _widthFactor;
  double _heightFactor;
  Widget _child;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZAlignConfig.fromJson(super.config.props) ?? {};
    _alignment = YZDynamicWidgetUtils.alignmentAdapter(props.alignment);
    _widthFactor = YZDynamicWidgetUtils.doubleAdapter(props.widthFactor);
    _heightFactor = YZDynamicWidgetUtils.doubleAdapter(props.heightFactor);
    _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    Align _subwidget = Align(
      alignment: _alignment ?? Alignment.center,
      widthFactor: _widthFactor,
      heightFactor: _heightFactor,
      child: _child,
    );

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
  }

}

/// The props of Align config
class YZAlignConfig {
  String alignment;
  String widthFactor;
  String heightFactor;
  Map child;

  YZAlignConfig(
      {this.alignment, this.heightFactor, this.widthFactor, this.child});

  YZAlignConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    alignment = json['alignment'];
    widthFactor = json['widthFactor'];
    heightFactor = json['heightFactor'];
    child = json['child'];
  }
}
