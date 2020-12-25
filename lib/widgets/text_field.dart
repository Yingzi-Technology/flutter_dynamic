/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 11:21:35     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-19 10:55:19
**/   

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../tools/common.dart';
import '../tools/rule.dart';
import '../tools/network.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// TextField handler
class YZTextFieldHandler extends YZDynamicBasicWidgetHandler {
  
  @override
  String get widgetName => 'TextField';

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

  TextEditingController _controller;
  FocusNode _focusNode;
  YZTextFieldConfig props;
  
  String _value;
  int _maxLine;
  int _minLine;
  TextInputType _keyboardType;
  List<TextInputFormatter> inputFormatters;
  bool _enabled;
  TextAlign _textAlign;
  int _maxLength;  
  TextInputAction _textInputAction;
  TextAlignVertical _textAlignVertical;
  Color _cursorColor;
  TextStyle _style;
  StrutStyle _strutStyle;
  InputDecoration _decoration;

  @override
  void initState() {
    super.initState();

    props = YZTextFieldConfig.fromJson(super.config.props) ?? {};
    
    _value = YZDinamicWidgetUtils.valueAdapter(props.value, this);
    _maxLine = YZDinamicWidgetUtils.intAdapter(props.maxLines);
    _minLine = YZDinamicWidgetUtils.intAdapter(props.minLines);
    _keyboardType = YZDinamicWidgetUtils.keyboardTypeAdapter(props.keyboardType);
    ///Only suport WhitelistingTextInputFormatter
    ///只支持白名单验证
    inputFormatters = _inputFormattersAdapter(props.inputFormatters);
    _enabled = YZDinamicWidgetUtils.boolAdapter(props.enabled);
    _textAlign = YZDinamicWidgetUtils.textAlignAdapter(props.textAlign);
    _maxLength = YZDinamicWidgetUtils.intAdapter(props.maxLength);  
    _textInputAction = _textInputActionAdapter(props.textInputAction);  
    _textAlignVertical = _textAlignVerticalAdapter(props.textAlignVertical);  
    _cursorColor = YZDinamicWidgetUtils.colorAdapter(props.cursorColor);
    _style = YZDinamicWidgetUtils.textStyleAdapter(props.style);
    _strutStyle = YZDinamicWidgetUtils.strutStyleAdapter(props.strutStyle);
    _decoration = _inputDecorationAdapter(props.decoration);

    _controller = TextEditingController.fromValue(
        TextEditingValue(
          text: _value ?? '',
          selection: TextSelection.fromPosition(TextPosition(
                        affinity: TextAffinity.downstream,
                        offset: (_value ?? '').length
                        )
          )
        )
      );
    properties['controller'] = _controller;

    _focusNode = FocusNode();
    properties['focusNode'] = _focusNode;
  }

  @override
  void dispose() {  
    _controller?.dispose();
    _focusNode?.dispose();       
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget widget;

    widget = TextField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: _decoration,      
      keyboardType: _keyboardType,
      textInputAction: _textInputAction,
      textCapitalization: TextCapitalization.none,
      style: _style, 
      strutStyle: _strutStyle,       
      textAlign: _textAlign ?? TextAlign.start,
      textAlignVertical: _textAlignVertical,
      textDirection: null,
      readOnly: false,
      toolbarOptions: null,
      showCursor: null,
      autofocus: false,
      obscureText: false,
      autocorrect: true,
      enableSuggestions: true,
      maxLines: _maxLine ?? 1,
      minLines: _minLine,
      expands: false,
      maxLength: _maxLength,  
      maxLengthEnforced: true,      
      inputFormatters: inputFormatters,
      enabled: _enabled,    
      cursorColor: _cursorColor,
      scrollPadding: EdgeInsets.zero,   
      enableInteractiveSelection: true,           
    );

    return widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
    actionFunctions['stateSetter'] = _stateSetter; 
    actionFunctions['validate'] = _validate; 
  }

  String get value {
    return _controller.text;
  }

  set value(String v) {
    _controller.text = v;
  }

  void _stateSetter({
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

  bool _validate({
      Map params, 
      YZDynamicRequest request,
      List<YZDynamicActionRule> rules,   
      Map localVariables,
      State state, 
  }) {

    bool ret = YZDynamicRuleUtil.validate(
      rules, 
      value: this.value, 
      callback: (index, tip) {
        
      }
    );
        
    return ret;
  }  

}

List<TextInputFormatter> _inputFormattersAdapter(List<String> formats){
  if (formats == null) return null;
  List<TextInputFormatter> result = [];
  for (String f in formats) {      
    result.add(FilteringTextInputFormatter.allow(RegExp(f)));
  }
  return result;
}

InputDecoration _inputDecorationAdapter(dynamic raw) {

    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 

    String _hint;
    if (_config['hint'] != null) {
      _hint = _config['hint'];
    }

    TextStyle _hintStyle;
    if (_config['hintStyle'] != null) {
      _hintStyle = YZDinamicWidgetUtils.textStyleAdapter(_config['hintStyle']);
    } 

    return InputDecoration(
      labelText: null,
      labelStyle: null,
      helperText: null,
      helperStyle: null,
      helperMaxLines: null,
      hintText: _hint ?? '',
      hintStyle: _hintStyle, 
      hintMaxLines: null,
      errorText: null,
      errorStyle: null,
      errorMaxLines: null,
      isCollapsed: false,        
      isDense: true,
      contentPadding: EdgeInsets.zero,  
      prefixText: null,
      prefixStyle: null,
      suffixText: null,
      suffixStyle: null,
      counterText: null,
      counterStyle: null,
      filled: null,
      fillColor: null,
      focusColor: null,
      hoverColor: null,
      errorBorder: null,
      focusedBorder: null,  
      focusedErrorBorder: null,
      disabledBorder: null,
      enabledBorder: null,            
      border: InputBorder.none,               
      enabled: true,
      semanticCounterText: null,
      alignLabelWithHint: null
    );
}

TextAlignVertical _textAlignVerticalAdapter(String str) {
    TextAlignVertical _ret;
    switch (str) {
      case 'bottom':
        _ret = TextAlignVertical.bottom; 
        break;   
      case 'center':
        _ret = TextAlignVertical.center; 
        break;  
      case 'top':
        _ret = TextAlignVertical.top; 
        break;                                                                      
      default:

    }

    return _ret;
}


TextInputAction _textInputActionAdapter(String str) {
    TextInputAction _ret;
    switch (str) {
      case 'continueAction':
        _ret = TextInputAction.continueAction; 
        break;   
      case 'done':
        _ret = TextInputAction.done; 
        break;  
      case 'emergencyCall':
        _ret = TextInputAction.emergencyCall; 
        break;
      case 'go':
        _ret = TextInputAction.go; 
        break;     
      case 'join':
        _ret = TextInputAction.join; 
        break;  
      case 'newline':
        _ret = TextInputAction.newline; 
        break;  
      case 'next':
        _ret = TextInputAction.next; 
        break;    
      case 'none':
        _ret = TextInputAction.none; 
        break; 
      case 'previous':
        _ret = TextInputAction.previous; 
        break; 
      case 'route':
        _ret = TextInputAction.route; 
        break;    
      case 'search':
        _ret = TextInputAction.search; 
        break;  
      case 'send':
        _ret = TextInputAction.send; 
        break;   
      case 'unspecified':
        _ret = TextInputAction.unspecified; 
        break;                                                                           
      default:

    }

    return _ret;
}

/// The props of TextField config
class YZTextFieldConfig {
	String value;
  String hint;
	String maxLines;
  String keyboardType;
  List<String> inputFormatters;
  String enabled;
  String textAlign;
  String maxLength;
  String minLines;
  String textInputAction;
  String textAlignVertical;
  String cursorColor;
  Map style;
  Map strutStyle;
  Map decoration;

	YZTextFieldConfig({
    this.value, 
    this.hint,
    this.maxLines, 
    this.keyboardType,
    this.inputFormatters,
    this.enabled,
    this.textAlign,
    this.maxLength,
    this.minLines,
    this.textInputAction,
    this.textAlignVertical,
    this.cursorColor,
    this.style,
    this.strutStyle,
    this.decoration,
    });

	YZTextFieldConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
		value = json['value'];
    hint = json['hint'];
		maxLines = json['maxLines'];
    keyboardType = json['keyboardType'];
    inputFormatters = json['inputFormatters'];
    enabled = json['enabled'];
    textAlign = json['textAlign'];
    maxLength = json['maxLength'];
    minLines = json['minLines'];
    textInputAction = json['textInputAction'];
    textAlignVertical = json['textAlignVertical'];
    cursorColor = json['cursorColor'];
    style = YZDynamicCommon.dynamicToMap(json['style']);
    strutStyle = YZDynamicCommon.dynamicToMap(json['strutStyle']);
    decoration = YZDynamicCommon.dynamicToMap(json['decoration']);
	}

}