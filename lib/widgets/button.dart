/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-18 12:02:11 
 * @Last Modified by:   yz.yujingzhou 
 * @Last Modified time: 2020-11-18 12:02:11  
 */

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/event.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// RawMaterialButton handler
class YZRawMaterialButtonHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'RawMaterialButton';

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
  late YZRawMaterialButtonConfig props;
  EdgeInsets? _padding;
  Clip? _clipBehavior;
  Widget? _child;
  TextStyle? _textStyle;
  Color? _fillColor;
  Color? _focusColor;
  Color? _hoverColor;
  Color? _highlightColor;
  Color? _splashColor;
  double? _elevation;
  double? _focusElevation;
  double? _hoverElevation;
  double? _highlightElevation;
  double? _disabledElevation;    

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZRawMaterialButtonConfig.fromJson(super.config?.props ?? {});
    _textStyle = YZDynamicWidgetUtils.textStyleAdapter(props.textStyle);
    _fillColor = YZDynamicWidgetUtils.colorAdapter(props.fillColor);
    _focusColor = YZDynamicWidgetUtils.colorAdapter(props.focusColor);
    _hoverColor = YZDynamicWidgetUtils.colorAdapter(props.hoverColor);
    _highlightColor = YZDynamicWidgetUtils.colorAdapter(props.highlightColor);
    _splashColor = YZDynamicWidgetUtils.colorAdapter(props.splashColor);
    _elevation = YZDynamicWidgetUtils.doubleAdapter(props.elevation);
    _focusElevation = YZDynamicWidgetUtils.doubleAdapter(props.focusElevation);
    _hoverElevation = YZDynamicWidgetUtils.doubleAdapter(props.hoverElevation);
    _highlightElevation = YZDynamicWidgetUtils.doubleAdapter(props.highlightElevation);
    _disabledElevation = YZDynamicWidgetUtils.doubleAdapter(props.disabledElevation);          
    _padding = YZDynamicWidgetUtils.edgeInsetAdapter(props.padding);
    _clipBehavior = YZDynamicWidgetUtils.clipBehaviorAdapter(props.clipBehavior);
    _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: context);    
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    _widget = RawMaterialButton(
      onPressed: () {
        super.triggerEvent(YZDynamicWidgetEventType.onClick);
      },
      onLongPress: (){
        super.triggerEvent(YZDynamicWidgetEventType.onLongPress);
      },
      onHighlightChanged: null,
      mouseCursor: null,      
      fillColor: _fillColor,
      textStyle: _textStyle,
      focusColor: _focusColor,
      hoverColor: _hoverColor,
      highlightColor: _highlightColor,
      splashColor: _splashColor,
      elevation: _elevation ?? 2.0,
      focusElevation: _focusElevation ?? 4.0,
      hoverElevation: _hoverElevation ?? 4.0,
      highlightElevation: _highlightElevation ?? 4.0,
      disabledElevation: _disabledElevation ?? 0.0,      
      padding: _padding ?? EdgeInsets.zero,
      visualDensity: const VisualDensity(),      
      constraints: const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
      shape: const RoundedRectangleBorder(),
      animationDuration: kThemeChangeDuration,      
      clipBehavior: _clipBehavior ?? Clip.none,
      focusNode: null,
      autofocus: false,
      materialTapTargetSize: null,
      enableFeedback: true,
      child: _child,
    );  

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

/// The props of RawMaterialButton config
class YZRawMaterialButtonConfig {
  Map? textStyle;
  String? fillColor;
  String? focusColor;
  String? hoverColor;
  String? highlightColor;
  String? splashColor;  
  String? elevation;
  String? focusElevation;
  String? hoverElevation;
  String? highlightElevation;
  String? disabledElevation;
  List? padding;
  String? clipBehavior;
  Map? child;

  YZRawMaterialButtonConfig(
      {this.textStyle,
      this.fillColor,
      this.focusColor,
      this.hoverColor,
      this.highlightColor,
      this.splashColor,
      this.elevation,
      this.focusElevation,
      this.hoverElevation,
      this.highlightElevation,
      this.disabledElevation,      
      this.padding,
      this.clipBehavior,
      this.child});

  YZRawMaterialButtonConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    textStyle = json['textStyle'];
    fillColor = json['fillColor'];
    focusColor = json['focusColor'];
    hoverColor = json['hoverColor'];
    highlightColor = json['highlightColor'];
    splashColor = json['splashColor'];
    elevation = json['elevation'];
    focusElevation = json['focusElevation'];
    hoverElevation = json['hoverElevation'];
    highlightElevation = json['highlightElevation'];
    disabledElevation = json['disabledElevation'];   
    padding = YZDynamicCommon.dynamicToList(json['padding']);
    clipBehavior = json['clipBehavior'];
    child = json['child'];
  }
}
