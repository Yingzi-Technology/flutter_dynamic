/*
 * @Description: Wrap
 * @Author: chenlijiao
 * @Date: 2021-03-15 11:27:51
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-18 17:53:22
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZWrapHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Wrap';

  @override
  Widget build(Map json,
      {Key? key, BuildContext? buildContext}) {
    return _Builder(json, key: key);
  }
}

class _Builder extends YZDynamicBaseWidget {
  final Map json;

  _Builder(this.json, {Key? key}) : super(json, key: key);

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
    YZWrapConfig props = YZWrapConfig.fromJson(super.config?.props ?? {});
    Axis? _direction = YZDynamicWidgetUtils.axisAdapter(props.direction);
    WrapAlignment? _alignment =
        YZDynamicWidgetUtils.wrapAlignmentAdapter(props.alignment);
    double? _spacing = YZDynamicWidgetUtils.doubleAdapter(props.spacing);
    WrapAlignment? _runAlignment =
        YZDynamicWidgetUtils.wrapAlignmentAdapter(props.runAlignment);
    double? _runSpacing =
        YZDynamicWidgetUtils.doubleAdapter(props.runAlignment);
    WrapCrossAlignment? _crossAxisAlignment =
        YZDynamicWidgetUtils.wrapCrossAlignmentAdapter(
            props.crossAxisAlignment);
    TextDirection? _textDirection =
        YZDynamicWidgetUtils.textDirectionAdapter(props.textDirection);
    VerticalDirection? _verticalDirection =
        YZDynamicWidgetUtils.verticalDirectionAdapter(props.verticalDirection);
    late List<Widget> _children;
    if (props.children != null) {
      _children = [];
      props.children?.forEach((e) {
        Widget? _child = YZDynamicCommon.buildWidget(e, context: context);
        if (_child == null) return;
        _children.add(_child);
      });
    }

    Wrap _subwidget = Wrap(
      direction: _direction ?? Axis.horizontal,
      alignment: _alignment ?? WrapAlignment.start,
      spacing: _spacing ?? 0,
      runAlignment: _runAlignment ?? WrapAlignment.start,
      runSpacing: _runSpacing ?? 0,
      crossAxisAlignment: _crossAxisAlignment ?? WrapCrossAlignment.center,
      textDirection: _textDirection,
      verticalDirection: _verticalDirection ?? VerticalDirection.down,
      clipBehavior: Clip.hardEdge,
      children: _children,
    );

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
  }

}

/// The props of Wrap config
class YZWrapConfig {
  String? direction;
  String? alignment;
  String? spacing;
  String? runAlignment;
  String? runSpacing;
  String? crossAxisAlignment;
  String? textDirection;
  String? verticalDirection;
  List<Map>? children;

  YZWrapConfig(
      {this.direction,
      this.alignment,
      this.spacing,
      this.runAlignment,
      this.runSpacing,
      this.crossAxisAlignment,
      this.textDirection,
      this.verticalDirection,
      this.children});

  YZWrapConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    alignment = json['alignment'];
    spacing = json['spacing'];
    runAlignment = json['runAlignment'];
    runSpacing = json['runSpacing'];
    crossAxisAlignment = json['crossAxisAlignment'];
    textDirection = json['textDirection'];
    verticalDirection = json['verticalDirection'];
    if (json['children'] != null) {
      children = <Map>[];
      json['children'].forEach((v) {
        children!.add(v);
      });
    }
  }
}
