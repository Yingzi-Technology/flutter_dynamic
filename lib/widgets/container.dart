/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 11:21:35     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-18 11:54:01
**/   

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Container handler
class YZContainerHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Container';

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
  YZContainerConfig props;
  Alignment _alignment;
  EdgeInsets _padding;
  double _width;
  double _height;
  BoxDecoration _decoration;
  EdgeInsets _margin;
  Clip _clipBehavior;
  Widget _child;
  Color _color;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZContainerConfig.fromJson(super.config.props) ?? {};
    _alignment = YZDinamicWidgetUtils.alignmentAdapter(props.alignment);
    _color = YZDinamicWidgetUtils.colorAdapter(props.color);
    _padding = YZDinamicWidgetUtils.edgeInsetAdapter(props.padding);
    _width = YZDinamicWidgetUtils.doubleAdapter(props.width);
    _height = YZDinamicWidgetUtils.doubleAdapter(props.height);
    _decoration = _boxDecorationAdapter(props.decoration);
    _margin = YZDinamicWidgetUtils.edgeInsetAdapter(props.margin);
    _clipBehavior = YZDinamicWidgetUtils.clipBehaviorAdapter(props.clipBehavior);
    _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: context);    
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    Container _subwidget = Container(
      alignment: _alignment,
      color: _color,
      padding: _padding,
      width: _width,
      height: _height,
      decoration: _decoration,
      foregroundDecoration: null,
      constraints: null,
      margin: _margin,
      transform: null,
      clipBehavior: _clipBehavior ?? Clip.none,
      child: _child,
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
    print('Execute xAction: ${this.runtimeType} setState');
    if (mounted) {
      setState(() {});
    }
  }

}

///adapt dsl
BoxDecoration _boxDecorationAdapter(dynamic raw){    

  if (raw == null) return null;

  Map _config = YZDynamicCommon.dynamicToMap(raw); 

  Color _color;
  if (_config['color'] != null) {
    _color = YZDinamicWidgetUtils.colorAdapter(_config['color']);
  }   

  DecorationImage _image;
  if (_config['image'] != null) {
    _image = _decorationImageAdapter(_config['image']);
  } 

  BoxBorder _border;
  if (_config['border'] != null) {
    _border = YZDinamicWidgetUtils.borderAdapter(_config['border']);
  }

  BorderRadius _borderRadius;
  if (_config['borderRadius'] != null) {
    _borderRadius = YZDinamicWidgetUtils.borderRadiusAdapter(_config['borderRadius']);
  }     

  List<BoxShadow> _boxShadow;
  if (_config['boxShadow'] != null) {
    _boxShadow = YZDinamicWidgetUtils.boxShadowAdapter(_config['boxShadow']);
  }   

  BoxShape _shape;
  if (_config['shape'] != null) {
    _shape = YZDinamicWidgetUtils.boxShapeAdapter(_config['shape']);
  }  

  return BoxDecoration(
    color: _color,
    image: _image,
    border: _border,
    borderRadius: _borderRadius,
    boxShadow: _boxShadow,
    gradient: null,
    backgroundBlendMode: null,
    shape: _shape ?? BoxShape.rectangle
  );
}

DecorationImage _decorationImageAdapter(dynamic raw) {

  if (raw == null) return null;

  Map _config = YZDynamicCommon.dynamicToMap(raw); 

  ImageProvider _image;
  if (_config['image'] != null) {
    _image = YZDinamicWidgetUtils.imageProviderAdapter(_config['image']);
  } 

  BoxFit _fit;
  if (_config['fit'] != null) {
    _fit = YZDinamicWidgetUtils.boxfitAdapter(_config['fit']);
  }   

  Alignment _alignment;
  if (_config['alignment'] != null) {
    _alignment = YZDinamicWidgetUtils.alignmentAdapter(_config['alignment']);
  } 

  Rect _centerSlice;
  if (_config['centerSlice'] != null) {
    _centerSlice = YZDinamicWidgetUtils.rectAdapter(_config['centerSlice']);
  }   

  ImageRepeat _repeat;
  if (_config['repeat'] != null) {
    _repeat = YZDinamicWidgetUtils.imageRepeatAdapter(_config['repeat']);
  }   

  bool _matchTextDirection;
  if (_config['matchTextDirection'] != null) {
    _matchTextDirection = YZDinamicWidgetUtils.boolAdapter(_config['matchTextDirection']);
  }   

  double _scale;
  if (_config['_scale'] != null) {
    _scale = YZDinamicWidgetUtils.doubleAdapter(_config['_scale']);
  }    

  return DecorationImage(
    image: _image,
    colorFilter: null,
    fit: _fit,
    alignment: _alignment,
    centerSlice: _centerSlice,
    repeat: _repeat,
    matchTextDirection: _matchTextDirection,
    scale: _scale ?? 1.0
  );
}

/// The props of Container config
class YZContainerConfig {
  String alignment;
  List padding;
  String color;
  String width;
  String height;
  String margin;
  Map decoration;
  String clipBehavior;
  Map child;

  YZContainerConfig(
      {this.alignment,
      this.padding,
      this.color,
      this.width,
      this.height,
      this.margin,
      this.decoration,
      this.clipBehavior,
      this.child});

  YZContainerConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    alignment = json['alignment'];
    padding = YZDynamicCommon.dynamicToList(json['padding']);
    color = json['color'];
    width = json['width'];
    height = json['height'];
    margin = json['margin'];
    decoration = YZDynamicCommon.dynamicToMap(json['decoration']);
    clipBehavior = json['clipBehavior'];
    child = json['child'];
  }
}
