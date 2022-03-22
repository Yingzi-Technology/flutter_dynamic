/*
 * @Description: stack
 * @Author: chenlijiao
 * @Date: 2021-03-15 15:37:07
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-18 17:50:41
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZStackHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Stack';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    //Deal with props / 处理控件属性
    YZStackConfig props = YZStackConfig.fromJson(super.config.props) ?? {};

    AlignmentGeometry _alignment =
        YZDynamicWidgetUtils.alignmentAdapter(props?.alignment);
    TextDirection _textDirection =
        YZDynamicWidgetUtils.textDirectionAdapter(props.textDirection);
    StackFit _fit = YZDynamicWidgetUtils.stackFitAdapter(props.fit);
    Overflow _overflow = YZDynamicWidgetUtils.overflowAdapter(props.overflow);
    List<Widget> _children;
    if (props?.children != null) {
      _children = [];
      props?.children?.forEach((e) {
        Widget _child = YZDynamicCommon.buildWidget(e, context: context);
        if (_child == null) return;
        _children.add(_child);
      });
    }

    Stack _subwidget = Stack(
      alignment: _alignment ?? AlignmentDirectional.topStart,
      textDirection: _textDirection,
      fit: _fit ?? StackFit.loose,
      overflow: _overflow ?? Overflow.clip,
      clipBehavior: Clip.hardEdge,
      children: _children,
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

/// The props of Stack config
class YZStackConfig {
  String alignment;
  String textDirection;
  String fit;
  String overflow;
  List<Map> children;

  YZStackConfig(
      {this.alignment,
      this.textDirection,
      this.fit,
      this.overflow,
      this.children});

  YZStackConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    alignment = json['alignment'];
    textDirection = json['textDirection'];
    fit = json['fit'];
    overflow = json['overflow'];
    if (json['children'] != null) {
      children = new List<Map>();
      json['children'].forEach((v) {
        children.add(v);
      });
    }
  }
}
