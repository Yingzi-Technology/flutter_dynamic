/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-18 12:04:45 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-18 12:08:18
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/common.dart';
import 'basic/event.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZCheckboxHandler extends YZDynamicBasicWidgetHandler {
  @override
  Widget build(Map json,
      {Key key, BuildContext buildContext}) {
    return _Builder(json, key: key);
  }

  @override
  String get widgetName => 'Checkbox';
}

class _Builder extends YZDynamicBaseWidget {
  final Map json;

  _Builder(this.json, {Key key}) : super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {
  //Deal with props / 处理控件属性
  YZCheckboxConfig props;
  Color _activeColor;
  bool _value;
  Color _checkColor;
  bool _tristate;
  Color _focusColor;
  Color _hoverColor;
  MaterialTapTargetSize _materialTapTargetSize;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZCheckboxConfig.fromJson(super.config.props) ?? {};
    _value = YZDynamicWidgetUtils.boolAdapter(props.value);
    _activeColor = YZDynamicWidgetUtils.colorAdapter(props.activeColor);
    _checkColor = YZDynamicWidgetUtils.colorAdapter(props.checkColor);
    _focusColor = YZDynamicWidgetUtils.colorAdapter(props.focusColor);
    _hoverColor = YZDynamicWidgetUtils.colorAdapter(props.hoverColor);
    _materialTapTargetSize = YZDynamicWidgetUtils.materialTapTargetSizeAdapter(
        props.materialTapTargetSize);
    _tristate = YZDynamicWidgetUtils.boolAdapter(props.tristate);
  }

  @override
  Widget build(BuildContext context) {
    Checkbox _widget;

    _widget = Checkbox(
      value: _value,
      activeColor: _activeColor,
      checkColor: _checkColor,
      tristate: _tristate ?? false,
      focusNode: null,
      autofocus: false,
      visualDensity: null,
      mouseCursor: null,
      focusColor: _focusColor,
      hoverColor: _hoverColor,
      materialTapTargetSize: _materialTapTargetSize,
      onChanged: (value) {
        this.value = value.toString();
        _value = !_value;
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

/// The props of Checkbox config
class YZCheckboxConfig {
  String activeColor;
  String value;
  String checkColor;
  String tristate;
  String focusColor;
  String hoverColor;
  String materialTapTargetSize;

  YZCheckboxConfig(
      {this.activeColor, this.checkColor, this.value, this.tristate});

  YZCheckboxConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    activeColor = json['activeColor'];
    value = json['value'];
    checkColor = json['checkColor'];
    tristate = json['tristate'];
    focusColor = json['focusColor'];
    hoverColor = json['hoverColor'];
    materialTapTargetSize = json['materialTapTargetSize'];
  }
}
