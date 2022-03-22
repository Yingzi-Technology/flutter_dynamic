/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-03 11:17:48 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-03 11:29:51
 */

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// SafeArea handler
class YZSafeAreaHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'SafeArea';

  @override
  Widget build(Map json, {Key? key, BuildContext? buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget {

  final Map json;

  _Builder(this.json, {Key? key}): super(json, key: key);

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
    YZSafeAreaConfig props = YZSafeAreaConfig.fromJson(super.config?.props ?? {});
    bool? _left = YZDynamicWidgetUtils.boolAdapter(props.left);
    bool? _top = YZDynamicWidgetUtils.boolAdapter(props.top);
    bool? _bottom = YZDynamicWidgetUtils.boolAdapter(props.bottom);
    bool? _right = YZDynamicWidgetUtils.boolAdapter(props.right);
    EdgeInsets? _minimum = YZDynamicWidgetUtils.edgeInsetAdapter(props.minimum);
    bool? _maintainBottomViewPadding = YZDynamicWidgetUtils.boolAdapter(props.maintainBottomViewPadding);
    Widget? _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: context);

    SafeArea _subwidget = SafeArea(
      left: _left ?? true,
      top: _top ?? true,
      bottom: _bottom ?? true,
      right: _right ?? true,
      minimum: _minimum ?? EdgeInsets.zero,
      maintainBottomViewPadding: _maintainBottomViewPadding ?? false,
      child: _child!,
    );  

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
  }

}

/// The props of SafeArea config
class YZSafeAreaConfig {
  String? left;
  String? top;
  String? bottom;
  String? right;
  String? minimum;
  String? maintainBottomViewPadding;
  Map? child;

  YZSafeAreaConfig(
      {this.left,
      this.top,
      this.bottom,
      this.right,
      this.minimum,
      this.maintainBottomViewPadding,
      this.child});

  YZSafeAreaConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    left = json['left'];
    top = json['top'];
    bottom = json['bottom'];
    right = json['right'];
    minimum = json['minimum'];
    maintainBottomViewPadding = json['maintainBottomViewPadding'];
    child = json['child'];
  }

}