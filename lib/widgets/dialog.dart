/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-26 18:11:05 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-26 18:26:59
 */


import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Dialog handler
class YZDialogHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Dialog';

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

  //Deal with props / 处理控件属性
  late YZDialogConfig props;
  EdgeInsets? _insetPadding;
  double? _elevation;
  Curve? _insetAnimationCurve;
  Clip? _clipBehavior;
  Widget? _child;
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZDialogConfig.fromJson(super.config?.props ?? {});
    _backgroundColor = YZDynamicWidgetUtils.colorAdapter(props.backgroundColor);
    _insetPadding = YZDynamicWidgetUtils.edgeInsetAdapter(props.insetPadding);
    _elevation = YZDynamicWidgetUtils.doubleAdapter(props.elevation);
    _insetAnimationCurve = YZDynamicWidgetUtils.curveAdapter(props.insetAnimationCurve);
    _clipBehavior = YZDynamicWidgetUtils.clipBehaviorAdapter(props.clipBehavior);
    _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: context);    
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    Dialog _subwidget = Dialog(
      backgroundColor: _backgroundColor,
      elevation: _elevation,
      insetAnimationDuration: const Duration(milliseconds: 100),
      insetAnimationCurve: _insetAnimationCurve ?? Curves.decelerate,
      insetPadding: _insetPadding,
      clipBehavior: _clipBehavior ?? Clip.none,
      shape: null,
      child: _child,
    );  

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
    actionFunctions['setState'] = stateSetter; 
  }

  void stateSetter(BuildContext? triggerContext, {
      Map? params, 
      YZDynamicRequest? request,
      List<YZDynamicActionRule>? rules,
      Map? localVariables,
      State? state,
    }) {
    print('Execute xAction: ${this.runtimeType} setState');
    if (mounted) {
      setState(() {});
    }
  }

}

/// The props of Dialog config
class YZDialogConfig {
  List? insetPadding;
  String? backgroundColor;
  String? elevation;
  String? insetAnimationCurve;
  String? clipBehavior;
  Map? child;

  YZDialogConfig(
      {this.insetPadding,
      this.backgroundColor,
      this.elevation,
      this.insetAnimationCurve,
      this.clipBehavior,
      this.child});

  YZDialogConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    insetPadding = YZDynamicCommon.dynamicToList(json['insetPadding']);
    backgroundColor = json['backgroundColor'];
    elevation = json['elevation'];
    insetAnimationCurve = json['insetAnimationCurve'];
    clipBehavior = json['clipBehavior'];
    child = json['child'];
  }
}
