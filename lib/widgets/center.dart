/*
 * @Description: Center
 * @Author: chenlijiao
 * @Date: 2021-03-16 15:47:51
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-16 15:50:03
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZCenterHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Center';

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
  //Deal with props / 处理控件属性
  late YZCenterConfig props;
  double? _widthFactor;
  double? _heightFactor;
  Widget? _child;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZCenterConfig.fromJson(super.config?.props ?? {});
    _widthFactor = YZDynamicWidgetUtils.doubleAdapter(props.widthFactor);
    _heightFactor = YZDynamicWidgetUtils.doubleAdapter(props.heightFactor);
    _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    Center _subwidget = Center(
      widthFactor: _widthFactor,
      heightFactor: _heightFactor,
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

/// The props of Center config
class YZCenterConfig {
  String? widthFactor;
  String? heightFactor;
  Map? child;

  YZCenterConfig({this.heightFactor, this.widthFactor, this.child});

  YZCenterConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    widthFactor = json['widthFactor'];
    heightFactor = json['heightFactor'];
    child = json['child'];
  }
}
