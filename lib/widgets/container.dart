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
  Widget build(Map json,
      {Key? key, BuildContext? buildContext}) {
    return _Builder(json, key: key);
  }
}

class _Builder extends YZDynamicBaseWidget {
  final Map json;

  _Builder(this.json, {Key? key}) : super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {
  //Deal with props / 处理控件属性
  late YZContainerConfig props;
  Alignment? _alignment;
  EdgeInsets? _padding;
  double? _width;
  double? _height;
  BoxDecoration? _decoration;
  EdgeInsets? _margin;
  Clip? _clipBehavior;
  Widget? _child;
  Color? _color;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZContainerConfig.fromJson(super.config?.props ?? {});
    _alignment = YZDynamicWidgetUtils.alignmentAdapter(props.alignment);
    _color = YZDynamicWidgetUtils.colorAdapter(props.color, state: this);
    _padding = YZDynamicWidgetUtils.edgeInsetAdapter(props.padding);
    _width = YZDynamicWidgetUtils.doubleAdapter(props.width);
    _height = YZDynamicWidgetUtils.doubleAdapter(props.height);
    _decoration = _boxDecorationAdapter(props.decoration, this);
    _margin = YZDynamicWidgetUtils.edgeInsetAdapter(props.margin);
    _clipBehavior =
        YZDynamicWidgetUtils.clipBehaviorAdapter(props.clipBehavior);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    _child = props.child == null
        ? null
        : YZDynamicCommon.buildWidget(props.child, context: context);
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
    _widget = super.buildWithEvents(_subwidget, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
  }
  
}

///adapt dsl
BoxDecoration? _boxDecorationAdapter(dynamic raw, State state) {
  if (raw == null) return null;

  Map _config = YZDynamicCommon.dynamicToMap(raw)!;

  Color? _color;
  if (_config['color'] != null) {
    _color = YZDynamicWidgetUtils.colorAdapter(_config['color'], state: state);
  }

  DecorationImage? _image;
  if (_config['image'] != null) {
    _image = _decorationImageAdapter(_config['image'], state: state);
  }

  BoxBorder? _border;
  if (_config['border'] != null) {
    _border = YZDynamicWidgetUtils.borderAdapter(_config['border']);
  }

  BorderRadius? _borderRadius;
  if (_config['borderRadius'] != null) {
    _borderRadius =
        YZDynamicWidgetUtils.borderRadiusAdapter(_config['borderRadius']);
  }

  List<BoxShadow>? _boxShadow;
  if (_config['boxShadow'] != null) {
    _boxShadow = YZDynamicWidgetUtils.boxShadowAdapter(_config['boxShadow']);
  }

  BoxShape? _shape;
  if (_config['shape'] != null) {
    _shape = YZDynamicWidgetUtils.boxShapeAdapter(_config['shape']);
  }

  return BoxDecoration(
      color: _color,
      image: _image,
      border: _border,
      borderRadius: _borderRadius,
      boxShadow: _boxShadow,
      gradient: null,
      backgroundBlendMode: null,
      shape: _shape ?? BoxShape.rectangle);
}

DecorationImage? _decorationImageAdapter(dynamic raw, {State? state}) {
  if (raw == null) return null;

  Map _config = YZDynamicCommon.dynamicToMap(raw)!;

  ImageProvider? _image;
  if (_config['image'] != null) {
    // 解析字典中url对应value的变量
    String? imagePath = _config['image']['url'];
    if (imagePath != null) {
      _config['image']['url'] =
          YZDynamicWidgetUtils.valueAdapter(imagePath, state);
    }
    _image = YZDynamicWidgetUtils.imageProviderAdapter(_config['image']);
  }

  BoxFit? _fit;
  if (_config['fit'] != null) {
    _fit = YZDynamicWidgetUtils.boxfitAdapter(_config['fit']);
  }

  Alignment? _alignment;
  if (_config['alignment'] != null) {
    _alignment = YZDynamicWidgetUtils.alignmentAdapter(_config['alignment']);
  }

  Rect? _centerSlice;
  if (_config['centerSlice'] != null) {
    _centerSlice = YZDynamicWidgetUtils.rectAdapter(_config['centerSlice']);
  }

  ImageRepeat? _repeat;
  if (_config['repeat'] != null) {
    _repeat = YZDynamicWidgetUtils.imageRepeatAdapter(_config['repeat']);
  }

  bool? _matchTextDirection;
  if (_config['matchTextDirection'] != null) {
    _matchTextDirection =
        YZDynamicWidgetUtils.boolAdapter(_config['matchTextDirection']);
  }

  double? _scale;
  if (_config['_scale'] != null) {
    _scale = YZDynamicWidgetUtils.doubleAdapter(_config['_scale']);
  }

  return DecorationImage(
      image: _image!,
      colorFilter: null,
      fit: _fit,
      alignment: _alignment ?? Alignment.center,
      centerSlice: _centerSlice,
      repeat: _repeat ?? ImageRepeat.noRepeat,
      matchTextDirection: _matchTextDirection ?? false,
      scale: _scale ?? 1.0);
}

/// The props of Container config
class YZContainerConfig {
  String? alignment;
  List? padding;
  String? color;
  String? width;
  String? height;
  List? margin;
  Map? decoration;
  String? clipBehavior;
  Map? child;

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

  YZContainerConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    alignment = json['alignment'];
    padding = YZDynamicCommon.dynamicToList(json['padding']);
    color = json['color'];
    width = json['width'];
    height = json['height'];
    margin = YZDynamicCommon.dynamicToList(json['margin']);
    decoration = YZDynamicCommon.dynamicToMap(json['decoration']);
    clipBehavior = json['clipBehavior'];
    child = json['child'];
  }
}
