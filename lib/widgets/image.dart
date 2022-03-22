/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-30 14:59:56 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-03 11:47:33
 */

import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'basic/utils.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Image handler
class YZImageHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Image';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;
    YZImageConfig props = YZImageConfig.fromJson(super.config?.props ?? {});

    String? _type = props.type ?? 'asset';
    double? _width = YZDynamicWidgetUtils.doubleAdapter(props.width);
    double? _height = YZDynamicWidgetUtils.doubleAdapter(props.height);
    BoxFit? _fix = YZDynamicWidgetUtils.boxfitAdapter(props.fit);
    Alignment? _alignment =
        YZDynamicWidgetUtils.alignmentAdapter(props.alignment);
    ImageRepeat? _repeat =
        YZDynamicWidgetUtils.imageRepeatAdapter(props.repeat);
    double? _scale = YZDynamicWidgetUtils.doubleAdapter(props.scale);
    int? _cacheWidth = YZDynamicWidgetUtils.intAdapter(props.cacheWidth);
    int? _cacheHeight = YZDynamicWidgetUtils.intAdapter(props.cacheHeight);
    bool? _isAntiAlias = YZDynamicWidgetUtils.boolAdapter(props.isAntiAlias);
    FilterQuality? _filterQuality = _filterQualityAdapter(props.filterQuality);
    BlendMode? _colorBlendMode = _colorBlendModeAdapter(props.colorBlendMode);
    Rect? _centerSlice = YZDynamicWidgetUtils.rectAdapter(props.centerSlice);
    bool? _matchTextDirection =
        YZDynamicWidgetUtils.boolAdapter(props.matchTextDirection);
    bool? _gaplessPlayback =
        YZDynamicWidgetUtils.boolAdapter(props.gaplessPlayback);

    Image? _subwidget;
    switch (_type) {
      case 'file':
        _subwidget = null;
        break;
      case 'memory':
        String? _src = props.src;
        _subwidget = null;
        if (_src != null && _src.startsWith('data:')) {
          _src = _src.replaceFirst('data:image/jpeg;base64,', '');
        }  
        if (_src == null) break;   
        Uint8List bytes = base64Decode(_src);
        _subwidget = Image.memory(bytes);        
        break;
      case 'network':
        String? _src = props.src;
        _src = YZDynamicWidgetUtils.valueAdapter(_src, this);
        _subwidget = Image.network(_src!,
            width: _width,
            height: _height,
            fit: _fix,
            alignment: _alignment ?? Alignment.center,
            repeat: _repeat ?? ImageRepeat.noRepeat,
            scale: _scale ?? 1.0,
            cacheHeight: _cacheHeight,
            cacheWidth: _cacheWidth,
            isAntiAlias: _isAntiAlias ?? false,
            filterQuality: _filterQuality ?? FilterQuality.low,
            colorBlendMode: _colorBlendMode,
            centerSlice: _centerSlice,
            matchTextDirection: _matchTextDirection ?? false,
            gaplessPlayback: _gaplessPlayback ?? false);
        break;
      default:
        String? _name = props.name;
        _subwidget = Image.asset(_name!,
            width: _width,
            height: _height,
            fit: _fix,
            alignment: _alignment ?? Alignment.center,
            repeat: _repeat ?? ImageRepeat.noRepeat,
            scale: _scale,
            cacheHeight: _cacheHeight,
            cacheWidth: _cacheWidth,
            isAntiAlias: _isAntiAlias ?? false,
            filterQuality: _filterQuality ?? FilterQuality.low,
            colorBlendMode: _colorBlendMode,
            centerSlice: _centerSlice,
            matchTextDirection: _matchTextDirection ?? false,
            gaplessPlayback: _gaplessPlayback ?? false);
    }

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget!, super.config?.xEvents);

    return _widget;
  }

  @override
  void registerActions() {}

  ///adapt dsl colorBlendMode
  BlendMode? _colorBlendModeAdapter(String? str) {
    BlendMode? _ret;
    switch (str) {
      case 'clear':
        _ret = BlendMode.clear;
        break;
      case 'color':
        _ret = BlendMode.color;
        break;
      case 'colorBurn':
        _ret = BlendMode.colorBurn;
        break;
      case 'colorDodge':
        _ret = BlendMode.colorDodge;
        break;
      case 'darken':
        _ret = BlendMode.darken;
        break;
      case 'difference':
        _ret = BlendMode.difference;
        break;
      case 'dst':
        _ret = BlendMode.dst;
        break;
      case 'dstATop':
        _ret = BlendMode.dstATop;
        break;
      case 'dstIn':
        _ret = BlendMode.dstIn;
        break;
      case 'dstOut':
        _ret = BlendMode.dstOut;
        break;
      case 'dstOver':
        _ret = BlendMode.dstOver;
        break;
      case 'exclusion':
        _ret = BlendMode.exclusion;
        break;
      case 'hardLight':
        _ret = BlendMode.hardLight;
        break;
      case 'hue':
        _ret = BlendMode.hue;
        break;
      case 'lighten':
        _ret = BlendMode.lighten;
        break;
      case 'luminosity':
        _ret = BlendMode.luminosity;
        break;
      case 'modulate':
        _ret = BlendMode.modulate;
        break;
      case 'multiply':
        _ret = BlendMode.multiply;
        break;
      case 'overlay':
        _ret = BlendMode.overlay;
        break;
      case 'plus':
        _ret = BlendMode.plus;
        break;
      case 'saturation':
        _ret = BlendMode.saturation;
        break;
      case 'screen':
        _ret = BlendMode.screen;
        break;
      case 'softLight':
        _ret = BlendMode.softLight;
        break;
      case 'src':
        _ret = BlendMode.src;
        break;
      case 'srcATop':
        _ret = BlendMode.srcATop;
        break;
      case 'srcIn':
        _ret = BlendMode.srcIn;
        break;
      case 'srcOut':
        _ret = BlendMode.srcOut;
        break;
      case 'srcOver':
        _ret = BlendMode.srcOver;
        break;
      case 'xor':
        _ret = BlendMode.xor;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl filterQuality
  FilterQuality? _filterQualityAdapter(String? str) {
    FilterQuality? _ret;
    switch (str) {
      case 'high':
        _ret = FilterQuality.high;
        break;
      case 'low':
        _ret = FilterQuality.low;
        break;
      case 'medium':
        _ret = FilterQuality.medium;
        break;
      case 'none':
        _ret = FilterQuality.none;
        break;
      default:
    }

    return _ret;
  }
}

class YZImageConfig {
  String? type; //asset/network/file/memory
  String? name;
  String? bytes;
  String? file;
  String? src;
  String? width;
  String? height;
  String? fit;
  String? alignment;
  String? repeat;
  String? scale;
  String? cacheWidth;
  String? cacheHeight;
  String? isAntiAlias;
  String? filterQuality;
  String? colorBlendMode;
  String? centerSlice;
  String? matchTextDirection;
  String? gaplessPlayback;

  YZImageConfig(
      {this.type,
      this.name,
      this.bytes,
      this.file,
      this.src,
      this.width,
      this.height,
      this.fit,
      this.alignment,
      this.repeat,
      this.scale,
      this.cacheWidth,
      this.cacheHeight,
      this.isAntiAlias,
      this.filterQuality,
      this.colorBlendMode,
      this.centerSlice,
      this.matchTextDirection,
      this.gaplessPlayback});

  YZImageConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};
    type = json['type'];
    name = json['name'];
    bytes = json['bytes'];
    file = json['file'];
    src = json['src'];
    width = json['width'];
    height = json['height'];
    fit = json['fit'];
    alignment = json['alignment'];
    repeat = json['repeat'];
    scale = json['scale'];
    cacheWidth = json['cacheWidth'];
    cacheHeight = json['cacheHeight'];
    isAntiAlias = json['isAntiAlias'];
    filterQuality = json['filterQuality'];
    colorBlendMode = json['colorBlendMode'];
    centerSlice = json['centerSlice'];
    matchTextDirection = json['matchTextDirection'];
    gaplessPlayback = json['gaplessPlayback'];
  }
}
