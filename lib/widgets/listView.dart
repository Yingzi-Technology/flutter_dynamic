/*
 * @Description: ListView
 * @Author: chenlijiao
 * @Date: 2021-03-17 17:07:21
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-18 17:25:01
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZListViewHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'ListView';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    //Deal with props / 处理控件属性
    YZListViewConfig props =
        YZListViewConfig.fromJson(super.config.props) ?? {};
    Axis _scrollDirection =
        YZDynamicWidgetUtils.axisAdapter(props.scrollDirection);
    bool _reverse = YZDynamicWidgetUtils.boolAdapter(props.reverse);
    EdgeInsets _padding = YZDynamicWidgetUtils.edgeInsetAdapter(props.padding);
    bool _primary = YZDynamicWidgetUtils.boolAdapter(props.primary);
    ScrollController _controller = ScrollController();
    bool _shrinkWrap = YZDynamicWidgetUtils.boolAdapter(props.shrinkWrap);
    double _itemExtent = YZDynamicWidgetUtils.doubleAdapter(props.itemExtent);
    DragStartBehavior _dragStartBehavior =
        dragStartBehaviorAdapter(props.dragStartBehavior);
    Clip _clipBehavior =
        YZDynamicWidgetUtils.clipBehaviorAdapter(props.clipBehavior);
    String _restorationId = props.restorationId;
    ScrollViewKeyboardDismissBehavior _keyboardDismissBehavior =
        YZDynamicWidgetUtils.scrollViewKeyboardDismissBehaviorAdapter(
            props.keyboardDismissBehavior);
    List<Widget> _children;
    if (props?.children != null) {
      _children = [];
      props?.children?.forEach((e) {
        Widget _child = YZDynamicCommon.buildWidget(e, context: context);
        if (_child == null) return;
        _children.add(_child);
      });
    }

    ListView _subwidget = ListView(
      scrollDirection: _scrollDirection ?? Axis.vertical,
      reverse: _reverse ?? false,
      padding: _padding,
      primary: _primary,
      physics: null,
      controller: _controller,
      shrinkWrap: _shrinkWrap ?? false,
      itemExtent: _itemExtent,
      addAutomaticKeepAlives: true,
      addRepaintBoundaries: true,
      addSemanticIndexes: true,
      cacheExtent: null,
      semanticChildCount: null,
      dragStartBehavior: _dragStartBehavior ?? DragStartBehavior.start,
      keyboardDismissBehavior:
          _keyboardDismissBehavior ?? ScrollViewKeyboardDismissBehavior.manual,
      clipBehavior: _clipBehavior ?? Clip.hardEdge,
      restorationId: _restorationId,
      children: _children,
    );

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
    actionFunctions['setState'] = stateSetter;
  }

  void stateSetter(BuildContext triggerContext, {
    Map params,
    YZDynamicRequest request,
    List<YZDynamicActionRule> rules,
    Map localVariables,
    State state,
  }) {
    print('Execute xAction: ${this.runtimeType} stateSetter');
    if (mounted) {
      setState(() {});
    }
  }

  ///adapt dsl
  static DragStartBehavior dragStartBehaviorAdapter(String str, {State state}) {
    DragStartBehavior _ret;
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

/// The props of ListView config
class YZListViewConfig {
  String scrollDirection;
  String reverse;
  String padding;
  String primary;
  String physics;
  String controller;
  String shrinkWrap;
  String itemExtent;
  String dragStartBehavior;
  String clipBehavior;
  String restorationId;
  String keyboardDismissBehavior;
  List<Map> children;

  YZListViewConfig(
      {this.scrollDirection,
      this.reverse,
      this.padding,
      this.primary,
      this.physics,
      this.controller,
      this.shrinkWrap,
      this.itemExtent,
      this.dragStartBehavior,
      this.clipBehavior,
      this.restorationId,
      this.keyboardDismissBehavior,
      this.children});

  YZListViewConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    scrollDirection = json['scrollDirection'];
    reverse = json['reverse'];
    padding = json['padding'];
    primary = json['primary'];
    physics = json['physics'];
    controller = json['controller'];
    shrinkWrap = json['shrinkWrap'];
    itemExtent = json['itemExtent'];
    dragStartBehavior = json['dragStartBehavior'];
    clipBehavior = json['clipBehavior'];
    restorationId = json['restorationId'];
    keyboardDismissBehavior = json['keyboardDismissBehavior'];

    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children.add(v);
      });
    }
  }
}
