/*
 * @Description: Radio
 * @Author: chenlijiao
 * @Date: 2021-02-24 16:44:58
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-03-18 18:20:33
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'basic/event.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZRadioHandler extends YZDynamicBasicWidgetHandler {
  @override
  Widget build(Map json,
      {Key key, BuildContext buildContext}) {
    return _Builder(json, key: key);
  }

  @override
  String get widgetName => 'Radio';
}

class _Builder extends YZDynamicBaseWidget {
  final Map json;

  _Builder(this.json, {Key key}) : super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {
  //Deal with props / 处理控件属性
  YZRadioConfig props;

  String _value;
  String _groupValue;
  bool _toggleable;
  Color _activeColor;
  Color _focusColor;
  Color _hoverColor;
  MaterialTapTargetSize _materialTapTargetSize;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZRadioConfig.fromJson(super.config.props) ?? {};
    _value = props.value;
    _groupValue = props.groupValue;
    _toggleable = YZDynamicWidgetUtils.boolAdapter(props.toggleable);
    _activeColor = YZDynamicWidgetUtils.colorAdapter(props.activeColor);
    _focusColor = YZDynamicWidgetUtils.colorAdapter(props.focusColor);
    _hoverColor = YZDynamicWidgetUtils.colorAdapter(props.hoverColor);
    _materialTapTargetSize = YZDynamicWidgetUtils.materialTapTargetSizeAdapter(
        props.materialTapTargetSize);
  }

  @override
  Widget build(BuildContext context) {
    Radio _widget = Radio(
      value: _value,
      groupValue: _groupValue,
      activeColor: _activeColor,
      mouseCursor: null,
      toggleable: _toggleable ?? false,
      focusColor: _focusColor,
      hoverColor: _hoverColor,
      visualDensity: null,
      focusNode: null,
      autofocus: false,
      materialTapTargetSize: _materialTapTargetSize,
      onChanged: (value) {
        this.value = value.toString();
        _value = _groupValue;
        setState(() {});
        super.triggerEvent(YZDynamicWidgetEventType.onValueChanged);
      },
    );

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

/// The props of Radio config
class YZRadioConfig {
  String value;
  String groupValue;
  String toggleable;
  String activeColor;
  String focusColor;
  String hoverColor;
  String materialTapTargetSize;

  YZRadioConfig(
      {this.value,
      this.groupValue,
      this.toggleable,
      this.activeColor,
      this.focusColor,
      this.hoverColor,
      this.materialTapTargetSize});

  YZRadioConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    value = json['value'];
    groupValue = json['groupValue'];
    toggleable = json['toggleable'];
    activeColor = json['activeColor'];
    focusColor = json['focusColor'];
    hoverColor = json['hoverColor'];
    materialTapTargetSize = json['materialTapTargetSize'];
  }
}
