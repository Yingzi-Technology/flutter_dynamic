/*
 * @Description: Positioned
 * @Author: chenlijiao
 * @Date: 2021-03-15 16:02:24
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-19 11:25:20
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZPositionedHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Positioned';

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
  YZPositionedConfig props;

  double _left;
  double _top;
  double _right;
  double _bottom;
  double _width;
  double _height;
  Widget _child;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZPositionedConfig.fromJson(super.config.props) ?? {};

    _left = YZDynamicWidgetUtils.doubleAdapter(props.left);
    _top = YZDynamicWidgetUtils.doubleAdapter(props.top);
    _right = YZDynamicWidgetUtils.doubleAdapter(props.right);
    _bottom = YZDynamicWidgetUtils.doubleAdapter(props.bottom);
    _width = YZDynamicWidgetUtils.doubleAdapter(props.width);
    _height = YZDynamicWidgetUtils.doubleAdapter(props.height);

    _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    Positioned _subwidget = Positioned(
      left: _left,
      top: _top,
      right: _right,
      bottom: _bottom,
      width: _width,
      height: _height,
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

/// The props of Positioned config
class YZPositionedConfig {
  String left;
  String top;
  String right;
  String bottom;
  String width;
  String height;
  Map child;

  YZPositionedConfig(
      {this.left,
      this.top,
      this.bottom,
      this.right,
      this.width,
      this.height,
      this.child});

  YZPositionedConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    left = json['left'];
    right = json['right'];
    top = json['top'];
    bottom = json['bottom'];
    width = json['width'];
    height = json['height'];
    child = json['child'];
  }
}
