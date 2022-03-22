/*
 * @Description: GestureDetector
 * @Author: chenlijiao
 * @Date: 2021-03-19 11:30:46
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-19 14:40:45
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'package:yz_flutter_dynamic/widgets/basic/utils.dart';

import 'basic/event.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

class YZGestureDetectorHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'GestureDetector';

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
    YZGestureDetectorConfig props =
        YZGestureDetectorConfig.fromJson(super.config?.props ?? {});
    HitTestBehavior? _behavior =
        YZDynamicWidgetUtils.hitTestBehaviorSizeAdapter(props.behavior);
    Widget? _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);

    GestureDetector _subwidget = GestureDetector(
      child: _child,
      onTap: () {
        super.triggerEvent(YZDynamicWidgetEventType.onClick);
      },
      onLongPress: () {
        super.triggerEvent(YZDynamicWidgetEventType.onLongPress);
      },
      behavior: _behavior,
      onTapDown: null,
      onTapUp: null,
      onTapCancel: null,
      onSecondaryTap: null,
      onSecondaryTapDown: null,
      onSecondaryTapUp: null,
      onSecondaryTapCancel: null,
      onTertiaryTapDown: null,
      onTertiaryTapUp: null,
      onTertiaryTapCancel: null,
      onDoubleTapDown: null,
      onDoubleTap: null,
      onDoubleTapCancel: null,
      onLongPressStart: null,
      onLongPressMoveUpdate: null,
      onLongPressUp: null,
      onLongPressEnd: null,
      onSecondaryLongPress: null,
      onSecondaryLongPressStart: null,
      onSecondaryLongPressMoveUpdate: null,
      onSecondaryLongPressUp: null,
      onSecondaryLongPressEnd: null,
      onVerticalDragDown: null,
      onVerticalDragStart: null,
      onVerticalDragUpdate: null,
      onVerticalDragEnd: null,
      onVerticalDragCancel: null,
      onHorizontalDragDown: null,
      onHorizontalDragStart: null,
      onHorizontalDragUpdate: null,
      onHorizontalDragEnd: null,
      onHorizontalDragCancel: null,
      onForcePressStart: null,
      onForcePressPeak: null,
      onForcePressUpdate: null,
      onForcePressEnd: null,
      onPanDown: null,
      onPanStart: null,
      onPanUpdate: null,
      onPanEnd: null,
      onPanCancel: null,
      onScaleStart: null,
      onScaleUpdate: null,
      onScaleEnd: null,
      excludeFromSemantics: false,
      dragStartBehavior: DragStartBehavior.start,
    );

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {}
}

/// The props of GestureDetector config
class YZGestureDetectorConfig {
  Map? child;
  String? behavior;

  YZGestureDetectorConfig({this.child, this.behavior});

  YZGestureDetectorConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    child = json['child'];
    behavior = json['behavior'];
  }
}
