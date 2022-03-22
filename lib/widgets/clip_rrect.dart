/*
 * @Descripttion: 
 * @version: ClipRRect
 * @Author: dingjian
 * @Date: 2021-05-14 15:21:52
 * @LastEditors: dingjian
 * @LastEditTime: 2021-05-14 18:52:07
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'package:yz_flutter_dynamic/widgets/basic/handler.dart';
import 'package:yz_flutter_dynamic/widgets/basic/utils.dart';
import 'package:yz_flutter_dynamic/widgets/basic/widget.dart';

class YZClipRRectHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'ClipRRect';

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
  late YZClipRRectConfig props;
  BorderRadius? _borderRadius;
  Clip? _clipBehavior;
  Widget? _child;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZClipRRectConfig.fromJson(super.config?.props ?? {});
    _clipBehavior =
        YZDynamicWidgetUtils.clipBehaviorAdapter(props.clipBehavior);
    _borderRadius =
        YZDynamicWidgetUtils.borderRadiusAdapter(props.borderRadius);
    _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    ClipRRect _subwidget = ClipRRect(
      clipBehavior: _clipBehavior ?? Clip.antiAlias,
      borderRadius: _borderRadius,
      child: _child,
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
class YZClipRRectConfig {
  Map? borderRadius;
  String? clipBehavior;
  Map? child;

  YZClipRRectConfig({this.borderRadius, this.clipBehavior, this.child});

  YZClipRRectConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    borderRadius = json['borderRadius'];
    clipBehavior = json['clipBehavior'];
    child = json['child'];
  }
}
