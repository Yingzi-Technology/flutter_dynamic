/*
 * @Description: Offstage
 * @Author: chenlijiao
 * @Date: 2021-03-16 14:38:38
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-18 11:31:12
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZOffstageHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Offstage';

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
    YZOffstageConfig props =
        YZOffstageConfig.fromJson(super.config.props) ?? {};
    bool _offstage = YZDynamicWidgetUtils.boolAdapter(props.offstage);
    Widget _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);

    Offstage _subwidget = Offstage(offstage: _offstage ?? true, child: _child);

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
    print('Execute xAction: ${this.runtimeType} setState');
    if (mounted) {
      setState(() {});
    }
  }
}

/// The props of Offstage config
class YZOffstageConfig {
  String offstage;
  Map child;

  YZOffstageConfig({this.offstage, this.child});

  YZOffstageConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    offstage = json['offstage'];
    child = json['child'];
  }
}
