/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-02 22:29:51 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-03 12:04:03
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// SingleChildScrollView handler
class YZSingleChildScrollViewHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'SingleChildScrollView';

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
    YZSingleChildScrollViewConfig props = YZSingleChildScrollViewConfig.fromJson(super.config?.props ?? {});
    Axis? _scrollDirection = YZDynamicWidgetUtils.axisAdapter(props.scrollDirection);
    bool? _reverse = YZDynamicWidgetUtils.boolAdapter(props.reverse);
    bool? _primary = YZDynamicWidgetUtils.boolAdapter(props.primary);
    ScrollController _controller = ScrollController();
    DragStartBehavior? _dragStartBehavior = dragStartBehaviorAdapter(props.dragStartBehavior);
    EdgeInsets? _padding = YZDynamicWidgetUtils.edgeInsetAdapter(props.padding);
    Clip? _clipBehavior = YZDynamicWidgetUtils.clipBehaviorAdapter(props.clipBehavior);
    String? _restorationId = props.restorationId;
    Widget? _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: context);

    SingleChildScrollView _subwidget = SingleChildScrollView(
      scrollDirection: _scrollDirection ?? Axis.vertical,
      reverse: _reverse ?? false,      
      padding: _padding,
      primary: _primary,
      physics: null,
      controller: _controller,
      dragStartBehavior: _dragStartBehavior ?? DragStartBehavior.start,
      clipBehavior: _clipBehavior ?? Clip.hardEdge,
      restorationId: _restorationId,
      child: _child,
    );  

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
  }

  ///adapt dsl
  static DragStartBehavior? dragStartBehaviorAdapter(String? str){    

    DragStartBehavior? _ret;
    switch (str) {
      case 'down':
        _ret = DragStartBehavior.down; 
        break;   
      case 'start':
        _ret = DragStartBehavior.start; 
        break;  
      default:

    }

    return _ret;
  }   

}

/// The props of SingleChildScrollView config
class YZSingleChildScrollViewConfig {
  String? scrollDirection;
  String? reverse;
  String? padding;
  String? primary;
  String? physics;
  String? controller;
  String? dragStartBehavior;
  String? clipBehavior;
  String? restorationId;
  Map? child;

  YZSingleChildScrollViewConfig(
      {this.scrollDirection,
      this.reverse,
      this.padding,
      this.primary,
      this.physics,
      this.controller,
      this.dragStartBehavior,
      this.clipBehavior,
      this.restorationId,
      this.child});

  YZSingleChildScrollViewConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    scrollDirection = json['scrollDirection'];
    reverse = json['reverse'];
    padding = json['padding'];
    primary = json['primary'];
    physics = json['physics'];
    controller = json['controller'];
    dragStartBehavior = json['dragStartBehavior'];
    clipBehavior = json['clipBehavior'];
    restorationId = json['restorationId'];
    child = json['child'];
  }
  
}