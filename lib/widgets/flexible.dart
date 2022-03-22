/*
 * @Description: Flexible
 * @Author: chenlijiao
 * @Date: 2021-03-15 11:04:29
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-18 17:26:16
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZFlexibleHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Flexible';

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
    YZFlexibleConfig props =
        YZFlexibleConfig.fromJson(super.config?.props ?? {});
    int? _flex = YZDynamicWidgetUtils.intAdapter(props.flex);
    Widget? _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);

    Flexible _subwidget =
        Flexible(flex: _flex ?? 1, fit: FlexFit.loose, child: _child!);

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {}
}

/// The props of Flexible config
class YZFlexibleConfig {
  String? flex;
  Map? child;

  YZFlexibleConfig({this.flex, this.child});

  YZFlexibleConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    flex = json['flex'];
    child = json['child'];
  }
}
