/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-02 22:30:24 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-19 10:11:30
 */

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Row handler
class YZRowHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Row';

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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    //Deal with props / 处理控件属性
    YZRowConfig props = YZRowConfig.fromJson(super.config.props) ?? {};
    MainAxisAlignment _mainAxisAlignment = YZDinamicWidgetUtils.mainAxisAlignmentAdapter(props.mainAxisAlignment);
    MainAxisSize _mainAxisSize = YZDinamicWidgetUtils.mainAxisSizeAdapter(props.mainAxisSize);
    CrossAxisAlignment _crossAxisAlignment = YZDinamicWidgetUtils.crossAxisAlignmentAdapter(props.crossAxisAlignment);
    TextDirection _textDirection = YZDinamicWidgetUtils.textDirectionAdapter(props.textDirection);    
    VerticalDirection _verticalDirection = YZDinamicWidgetUtils.verticalDirectionAdapter(props.verticalDirection);   
    TextBaseline _textBaseline = YZDinamicWidgetUtils.textBaselineAdapter(props.verticalDirection); 
    List<Widget> _children;
    if (props?.children != null) {
      _children = [];
      props?.children?.forEach((e) {
        Widget _child = YZDynamicCommon.buildWidget(e, context: context);     
        if (_child == null)return; 
        _children.add(_child);        
      });
    } 

    Row _subwidget = Row(
      mainAxisAlignment: _mainAxisAlignment ?? MainAxisAlignment.start,
      mainAxisSize: _mainAxisSize ?? MainAxisSize.max,
      crossAxisAlignment: _crossAxisAlignment ?? CrossAxisAlignment.center,
      textDirection: _textDirection,
      verticalDirection: _verticalDirection ?? VerticalDirection.down,
      textBaseline: _textBaseline ?? TextBaseline.alphabetic,
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

  void stateSetter({
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

}

/// The props of Row config
class YZRowConfig {
  String mainAxisAlignment;
  String mainAxisSize;
  String crossAxisAlignment;
  String textDirection;
  String verticalDirection;
  String textBaseline;
  List<Map> children;

  YZRowConfig(
      {this.mainAxisAlignment,
      this.mainAxisSize,
      this.crossAxisAlignment,
      this.textDirection,
      this.verticalDirection,
      this.textBaseline,
      this.children});

  YZRowConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    mainAxisAlignment = json['mainAxisAlignment'];
    mainAxisSize = json['mainAxisSize'];
    crossAxisAlignment = json['crossAxisAlignment'];
    textDirection = json['textDirection'];
    verticalDirection = json['verticalDirection'];
    textBaseline = json['textBaseline'];
    if (json['children'] != null) {
      children = new List<Map>();
      json['children'].forEach((v) {
        children.add(v);
      });
    }
  }

}