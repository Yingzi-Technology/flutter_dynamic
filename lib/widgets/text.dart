/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 11:21:35     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-01 14:52:11
**/   

import 'package:flutter/material.dart';
import '../tools/common.dart';
import '../tools/network.dart';
import '../tools/rule.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Text handler
class YZTextHandler extends YZDynamicBasicWidgetHandler {
  
  @override
  String get widgetName => 'Text';

  @override
  Widget build(Map<String, dynamic> json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget {

  final Map<String, dynamic> json;

  _Builder(this.json, {Key key}): super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {

  //Deal with props / 处理控件属性
  YZTextConfig props;
  String _data;
  TextStyle _style;
  StrutStyle _strutStyle;
  TextAlign _textAlign;
  TextDirection _textDirection;
  bool _softWrap;
  TextOverflow _overflow;
  double _textScaleFactor;
  int _maxLines;
  String _semanticsLabel;
  TextWidthBasis _textWidthBasis;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZTextConfig.fromJson(super.config.props) ?? {};

    _data = YZDinamicWidgetUtils.valueAdapter(props.data, this);
    _style = YZDinamicWidgetUtils.textStyleAdapter(props.style);   
    _strutStyle = YZDinamicWidgetUtils.strutStyleAdapter(props.strutStyle);
    _textAlign = YZDinamicWidgetUtils.textAlignAdapter(props.textAlign);
    _textDirection = YZDinamicWidgetUtils.textDirectionAdapter(props.textDirection);
    _softWrap = YZDinamicWidgetUtils.boolAdapter(props.softWrap);
    _overflow = YZDinamicWidgetUtils.textOverflowAdapter(props.overflow);
    _textScaleFactor = YZDinamicWidgetUtils.doubleAdapter(props.textScaleFactor);
    _maxLines = YZDinamicWidgetUtils.intAdapter(props.maxLines);
    _semanticsLabel = props.semanticsLabel;
    _textWidthBasis = _textWidthBasisAdapter(props.textWidthBasis);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    Text _subwidget = Text(
      _data ?? '',
      style: _style,
      strutStyle: _strutStyle,
      textAlign: _textAlign,
      textDirection: _textDirection,
      locale: null,
      softWrap: _softWrap,
      overflow: _overflow,
      textScaleFactor: _textScaleFactor,
      maxLines: _maxLines,
      semanticsLabel: _semanticsLabel,
      textWidthBasis: _textWidthBasis,
      textHeightBehavior: null,
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

  set value(String v) {
    _data = v;
  }

  void stateSetter({
      Map params, 
      YZDynamicRequest request,
      List<YZDynamicActionRule> rules,
      Map localVariables,
      State state,
    }) {
    if (mounted) {
      setState(() {});
    }
  }

}

TextWidthBasis _textWidthBasisAdapter(String str) {
    TextWidthBasis _ret;
    switch (str) {
      case 'longestLine':
        _ret = TextWidthBasis.longestLine; 
        break;   
      case 'parent':
        _ret = TextWidthBasis.parent; 
        break;                                                                   
      default:
    }

    return _ret;
}

/// The props of Text config
class YZTextConfig {
	String data;
	Map style;
  Map strutStyle;
  String textAlign;
  String textDirection;
  String softWrap;
  String overflow;
  String textScaleFactor;
  String maxLines;
  String semanticsLabel;
  String textWidthBasis;

	YZTextConfig({
    this.data, 
    this.style,
    this.strutStyle,
    this.textAlign,
    this.textDirection,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    });

	YZTextConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
		data = json['data'];
		style = YZDynamicCommon.dynamicToMap(json['style']);
    strutStyle = YZDynamicCommon.dynamicToMap(json['strutStyle']);
    textAlign = json['textAlign'];
    textDirection = json['textDirection'];
    softWrap = json['softWrap'];
    overflow = json['overflow'];
    textScaleFactor = json['textScaleFactor'];
    maxLines = json['maxLines']; 
    semanticsLabel = json['semanticsLabel']; 
    textWidthBasis = json['textWidthBasis']; 
	}
  
}

