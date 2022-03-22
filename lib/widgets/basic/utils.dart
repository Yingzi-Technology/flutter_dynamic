/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 12:02:10     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-08-17 13:55:14
**/

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../tools/common.dart';

class YZDynamicWidgetUtils {
  YZDynamicWidgetUtils._();

  //return string
  static String? valueAdapter(String? str, State? state) {
    if (state == null) return str;
    dynamic _ret = YZDynamicWidgetUtils.pseudocodeAdapter(str, state);

    return _ret?.toString() ?? '';
  }

  //return object
  @Deprecated("Use pseudocodeAdapter instead!")
  static dynamic resultAdapter(String str, State state) {
    return YZDynamicWidgetUtils.pseudocodeAdapter(str, state);
  }

  ///Deal with pseudo code
  static dynamic? pseudocodeAdapter(String? str, State? state) {
    if (state == null) return str;
    String? trimStr = str?.trim();
    dynamic _ret = YZDynamicVariableUtil.getValueOfVariable(trimStr, state: state);

    return _ret;    
  }    

  ///adapt dsl alignment to the flutter Alignment
  static Alignment? alignmentAdapter(String? alignmentString) {
    Alignment? alignment;
    switch (alignmentString) {
      case 'center':
        alignment = Alignment.center;
        break;
      case 'topCenter':
        alignment = Alignment.topCenter;
        break;
      case 'bottomCenter':
        alignment = Alignment.bottomCenter;
        break;
      case 'centerLeft':
        alignment = Alignment.centerLeft;
        break;
      case 'topLeft':
        alignment = Alignment.topLeft;
        break;
      case 'bottomLeft':
        alignment = Alignment.bottomLeft;
        break;
      case 'topRight':
        alignment = Alignment.topRight;
        break;
      case 'centerRight':
        alignment = Alignment.centerRight;
        break;
      case 'bottomRight':
        alignment = Alignment.bottomRight;
        break;
      default:
    }

    return alignment;
  }

  ///adapt dsl text align to the flutter TextAlign
  static TextAlign? textAlignAdapter(String? alignmentString) {
    TextAlign? alignment;
    switch (alignmentString) {
      case 'center':
        alignment = TextAlign.center;
        break;
      case 'end':
        alignment = TextAlign.end;
        break;
      case 'justify':
        alignment = TextAlign.justify;
        break;
      case 'left':
        alignment = TextAlign.left;
        break;
      case 'right':
        alignment = TextAlign.right;
        break;
      case 'start':
        alignment = TextAlign.start;
        break;
      default:
    }

    return alignment;
  }

  ///adapt dsl color to the flutter color 0xff123456
  static Color? colorAdapter(String? colorString, {State? state}) {
    Color? color;

    if (colorString != null) {
      dynamic pseudoRet = YZDynamicWidgetUtils.pseudocodeAdapter(colorString, state);
      if (pseudoRet is Color) {
        return pseudoRet;
      } else if (pseudoRet is String) {
        colorString = pseudoRet;
      }

      if (colorString.startsWith('#')) {
        colorString = colorString.replaceFirst('#', '0xff');
      }
      int? v = int.tryParse(colorString);
      color = v != null ? Color(v) : null;
    }

    return color;
  }

  ///adapt dsl fontWeight to the flutter fontWeight
  static FontWeight? fontWeightAdapter(String? fontWeightString) {
    FontWeight? fontWeight;
    switch (fontWeightString) {
      case 'bold':
        fontWeight = FontWeight.bold;
        break;
      case '500':
        fontWeight = FontWeight.w600;
        break;
      case '800':
        fontWeight = FontWeight.w800;
        break;
      default:
    }

    return fontWeight;
  }

  ///adapt dsl fontStyle to the flutter fontStyle
  static FontStyle? fontStypeAdapter(String fontStypeString) {
    FontStyle? fontStyle;
    switch (fontStypeString) {
      case 'normal':
        fontStyle = FontStyle.normal;
        break;
      case 'italic':
        fontStyle = FontStyle.italic;
        break;
      default:
    }

    return fontStyle;
  }

  ///adapt dsl edgeInset to the flutter EdgeInsets [left, top, right, bottom]
  static EdgeInsets? edgeInsetAdapter(dynamic edgeInsetList, {State? state}) {
    if (edgeInsetList == null) return null;
    if (edgeInsetList is String) {
      dynamic pseudoRet = YZDynamicWidgetUtils.pseudocodeAdapter(edgeInsetList, state);
      if (pseudoRet is EdgeInsets) {
        return pseudoRet;
      } else if (pseudoRet is String) {
        edgeInsetList = pseudoRet;
      }
    }
    
    return YZDynamicCommon.edgeInsetAdapter(edgeInsetList);
  }

  ///adapt dsl rect to the flutter Rect [left, top, right, bottom]
  static Rect? rectAdapter(dynamic rectRaW) {
    Rect _ret;
    if (rectRaW == null || rectRaW.isEmpty) {
      return null;
    }

    List rectList;
    if (rectRaW is String) {
      rectList = jsonDecode(rectRaW);
    } else {
      rectList = rectRaW as List;
    }

    int length = rectList.length;
    if (length < 4) {
      for (var i = length; i < 4; i++) {
        rectList[i] = 0;
      }
    }

    _ret = Rect.fromLTRB(
        YZDynamicCommon.parseDouble(rectList[0])!,
        YZDynamicCommon.parseDouble(rectList[1])!,
        YZDynamicCommon.parseDouble(rectList[2])!,
        YZDynamicCommon.parseDouble(rectList[3])!);

    return _ret;
  }

  ///adapt dsl color to the flutter color 0xff123456
  static double? doubleAdapter(String? raw, {State? state}) {
    if (raw == null) return null;
    if (raw == "infinity") return double.infinity;
    dynamic pseudoRet = YZDynamicWidgetUtils.pseudocodeAdapter(raw, state);
    if (pseudoRet is double) {
      return pseudoRet;
    } else if (pseudoRet is String) {
      raw = pseudoRet;
    }    
    return YZDynamicCommon.parseDouble(num.tryParse(raw));
  }

  ///adapt dsl color to the flutter color 0xff123456
  static int? intAdapter(String? str, {State? state}) {
    if (str == null) return null;
    dynamic pseudoRet = YZDynamicWidgetUtils.pseudocodeAdapter(str, state);
    if (pseudoRet is int) {
      return pseudoRet;
    } else if (pseudoRet is String) {
      str = pseudoRet;
    } 
    return YZDynamicCommon.parseInt(num.tryParse(str));
  }

  ///adapt dsl TextInputType to the flutter TextInputType
  static TextInputType? inputTypeAdapter(String inputTypeString) {
    TextInputType? inputType;
    switch (inputTypeString) {
      case 'datetime':
        inputType = TextInputType.datetime;
        break;
      case 'emailAddress':
        inputType = TextInputType.emailAddress;
        break;
      case 'number':
        inputType = TextInputType.number;
        break;
      case 'phone':
        inputType = TextInputType.phone;
        break;
      case 'multiline':
        inputType = TextInputType.multiline;
        break;
      case 'text':
        inputType = TextInputType.text;
        break;
      case 'url':
        inputType = TextInputType.url;
        break;
      case 'visiblePassword':
        inputType = TextInputType.visiblePassword;
        break;
      default:
    }

    return inputType;
  }

  ///adapt dsl bool
  static bool? boolAdapter(dynamic str, {State? state}) {

    if (str is bool) return str;

    dynamic pseudoRet = YZDynamicWidgetUtils.pseudocodeAdapter(str, state);
    if (pseudoRet is bool) {
      return pseudoRet;
    } else if (pseudoRet is String) {
      str = pseudoRet;
    }     

    bool? _bool;
    switch (str) {
      case 'true':
        _bool = true;
        break;
      case 'false':
        _bool = false;
        break;
      default:
    }

    return _bool;
  }

  ///adapt dsl list
  static List? listAdapter<T>(String? str, {State? state}) {
    if (str == null || str.isEmpty) return null;

    //If value is code
    dynamic pseudoRet = YZDynamicWidgetUtils.pseudocodeAdapter(str, state);
    if (pseudoRet is List) {
      return pseudoRet;
    } else if (pseudoRet is String) {
      str = pseudoRet;
    } 

    if (!str.startsWith('[')) return null;
    return jsonDecode(str.replaceAll(r"\s", ""));
  }

  ///adapt dsl boxfit
  static BoxFit? boxfitAdapter(String? str) {
    BoxFit? _boxFit;
    switch (str) {
      case 'contain':
        _boxFit = BoxFit.contain;
        break;
      case 'cover':
        _boxFit = BoxFit.cover;
        break;
      case 'fill':
        _boxFit = BoxFit.fill;
        break;
      case 'fitHeight':
        _boxFit = BoxFit.fitHeight;
        break;
      case 'fitWidth':
        _boxFit = BoxFit.fitWidth;
        break;
      case 'none':
        _boxFit = BoxFit.none;
        break;
      case 'scaleDown':
        _boxFit = BoxFit.scaleDown;
        break;
      default:
    }

    return _boxFit;
  }

  ///adapt dsl StackFit
  static StackFit? stackFitAdapter(String? str) {
    StackFit? _boxFit;
    switch (str) {
      case 'loose':
        _boxFit = StackFit.loose;
        break;
      case 'expand':
        _boxFit = StackFit.expand;
        break;
      case 'passthrough':
        _boxFit = StackFit.passthrough;
        break;

      default:
    }

    return _boxFit;
  }

  ///adapt dsl imageRepeat
  static ImageRepeat? imageRepeatAdapter(String? str) {
    ImageRepeat? _ret;
    switch (str) {
      case 'noRepeat':
        _ret = ImageRepeat.noRepeat;
        break;
      case 'repeat':
        _ret = ImageRepeat.repeat;
        break;
      case 'repeatX':
        _ret = ImageRepeat.repeatX;
        break;
      case 'repeatY':
        _ret = ImageRepeat.repeatY;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static MainAxisAlignment? mainAxisAlignmentAdapter(String? str) {
    MainAxisAlignment? _ret;
    switch (str) {
      case 'center':
        _ret = MainAxisAlignment.center;
        break;
      case 'end':
        _ret = MainAxisAlignment.end;
        break;
      case 'spaceAround':
        _ret = MainAxisAlignment.spaceAround;
        break;
      case 'spaceBetween':
        _ret = MainAxisAlignment.spaceBetween;
        break;
      case 'spaceEvenly':
        _ret = MainAxisAlignment.spaceEvenly;
        break;
      case 'start':
        _ret = MainAxisAlignment.start;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static MainAxisSize? mainAxisSizeAdapter(String? str) {
    MainAxisSize? _ret;
    switch (str) {
      case 'max':
        _ret = MainAxisSize.max;
        break;
      case 'min':
        _ret = MainAxisSize.min;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static CrossAxisAlignment? crossAxisAlignmentAdapter(String? str) {
    CrossAxisAlignment? _ret;
    switch (str) {
      case 'baseline':
        _ret = CrossAxisAlignment.baseline;
        break;
      case 'center':
        _ret = CrossAxisAlignment.center;
        break;
      case 'end':
        _ret = CrossAxisAlignment.end;
        break;
      case 'start':
        _ret = CrossAxisAlignment.start;
        break;
      case 'stretch':
        _ret = CrossAxisAlignment.stretch;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static WrapAlignment? wrapAlignmentAdapter(String? str) {
    WrapAlignment? _ret;
    switch (str) {
      case 'center':
        _ret = WrapAlignment.center;
        break;
      case 'end':
        _ret = WrapAlignment.end;
        break;
      case 'spaceAround':
        _ret = WrapAlignment.spaceAround;
        break;
      case 'spaceBetween':
        _ret = WrapAlignment.spaceBetween;
        break;
      case 'spaceEvenly':
        _ret = WrapAlignment.spaceEvenly;
        break;
      case 'start':
        _ret = WrapAlignment.start;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static WrapCrossAlignment? wrapCrossAlignmentAdapter(String? str) {
    WrapCrossAlignment? _ret;
    switch (str) {
      case 'center':
        _ret = WrapCrossAlignment.center;
        break;
      case 'end':
        _ret = WrapCrossAlignment.end;
        break;
      case 'start':
        _ret = WrapCrossAlignment.start;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static TextDirection? textDirectionAdapter(String? str) {
    TextDirection? _ret;
    switch (str) {
      case 'ltr':
        _ret = TextDirection.ltr;
        break;
      case 'rtl':
        _ret = TextDirection.rtl;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static VerticalDirection? verticalDirectionAdapter(String? str) {
    VerticalDirection? _ret;
    switch (str) {
      case 'down':
        _ret = VerticalDirection.down;
        break;
      case 'up':
        _ret = VerticalDirection.up;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static TextBaseline? textBaselineAdapter(String? str) {
    TextBaseline? _ret;
    switch (str) {
      case 'alphabetic':
        _ret = TextBaseline.alphabetic;
        break;
      case 'ideographic':
        _ret = TextBaseline.ideographic;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static Axis? axisAdapter(String? str) {
    Axis? _ret;
    switch (str) {
      case 'horizontal':
        _ret = Axis.horizontal;
        break;
      case 'vertical':
        _ret = Axis.vertical;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static Clip? clipBehaviorAdapter(String? str) {
    Clip? _ret;
    switch (str) {
      case 'antiAlias':
        _ret = Clip.antiAlias;
        break;
      case 'antiAliasWithSaveLayer':
        _ret = Clip.antiAliasWithSaveLayer;
        break;
      case 'hardEdge':
        _ret = Clip.hardEdge;
        break;
      case 'none':
        _ret = Clip.none;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static TextStyle? textStyleAdapter(dynamic raw, {State? state}) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    Color? _color;
    if (_config['color'] != null) {
      _color = YZDynamicWidgetUtils.colorAdapter(_config['color'], state: state);            
    }

    Color? _backgroundColor;
    if (_config['background'] != null) {
      _backgroundColor =
          YZDynamicWidgetUtils.colorAdapter(_config['background'], state: state);
    }

    double? _fontSize;
    if (_config['fontSize'] != null) {
      _fontSize = YZDynamicWidgetUtils.doubleAdapter(_config['fontSize'], state: state);
    }

    FontWeight? _fontWeight;
    if (_config['fontWeight'] != null) {
      _fontWeight =
          YZDynamicWidgetUtils.fontWeightAdapter(_config['fontWeight']);
    }

    FontStyle? _fontStyle;
    if (_config['fontStyle'] != null) {
      _fontStyle = YZDynamicWidgetUtils.fontStypeAdapter(_config['fontStyle']);
    }

    double? _letterSpacing;
    if (_config['letterSpacing'] != null) {
      _letterSpacing =
          YZDynamicWidgetUtils.doubleAdapter(_config['letterSpacing']);
    }

    double? _wordSpacing;
    if (_config['wordSpacing'] != null) {
      _wordSpacing = YZDynamicWidgetUtils.doubleAdapter(_config['wordSpacing']);
    }

    double? _height;
    if (_config['height'] != null) {
      _height = YZDynamicWidgetUtils.doubleAdapter(_config['height'], state: state);
    }

    String? _fontFamily;
    if (_config['fontFamily'] != null) {
      _fontFamily = _config['fontFamily'];
    }

    String? _package;
    if (_config['package'] != null) {
      _package = _config['package'];
    }

    TextStyle _ret = TextStyle(
        color: _color,
        backgroundColor: _backgroundColor,
        fontSize: _fontSize,
        fontWeight: _fontWeight,
        fontStyle: _fontStyle,
        letterSpacing: _letterSpacing,
        wordSpacing: _wordSpacing,
        height: _height,
        fontFamily: _fontFamily,
        package: _package);

    return _ret;
  }

  ///adapt dsl
  static StrutStyle? strutStyleAdapter(dynamic raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    double? _leading;
    if (_config['leading'] != null) {
      _leading = YZDynamicWidgetUtils.doubleAdapter(_config['leading']);
    }

    bool? _forceStrutHeight;
    if (_config['forceStrutHeight'] != null) {
      _forceStrutHeight =
          YZDynamicWidgetUtils.boolAdapter(_config['forceStrutHeight']);
    }

    double? _fontSize;
    if (_config['fontSize'] != null) {
      _fontSize = YZDynamicWidgetUtils.doubleAdapter(_config['fontSize']);
    }

    FontWeight? _fontWeight;
    if (_config['fontWeight'] != null) {
      _fontWeight =
          YZDynamicWidgetUtils.fontWeightAdapter(_config['fontWeight']);
    }

    FontStyle? _fontStyle;
    if (_config['fontWeight'] != null) {
      _fontStyle = YZDynamicWidgetUtils.fontStypeAdapter(_config['fontStyle']);
    }

    String? _debugLabel;
    if (_config['debugLabel'] != null) {
      _debugLabel = _config['debugLabel'];
    }

    double? _height;
    if (_config['height'] != null) {
      _height = YZDynamicWidgetUtils.doubleAdapter(_config['height']);
    }

    String? _fontFamily;
    if (_config['fontFamily'] != null) {
      _fontFamily = _config['fontFamily'];
    }

    String? _package;
    if (_config['package'] != null) {
      _package = _config['package'];
    }

    StrutStyle _ret = StrutStyle(
        fontSize: _fontSize,
        fontWeight: _fontWeight,
        fontStyle: _fontStyle,
        height: _height,
        leading: _leading,
        forceStrutHeight: _forceStrutHeight,
        debugLabel: _debugLabel,
        fontFamily: _fontFamily,
        package: _package);

    return _ret;
  }

  ///adapt dsl
  static TextInputType? keyboardTypeAdapter(String? str) {
    TextInputType? _ret;
    switch (str) {
      case 'datetime':
        _ret = TextInputType.datetime;
        break;
      case 'emailAddress':
        _ret = TextInputType.emailAddress;
        break;
      case 'multiline':
        _ret = TextInputType.multiline;
        break;
      case 'name':
        _ret = TextInputType.name;
        break;
      case 'number':
        _ret = TextInputType.number;
        break;
      case 'phone':
        _ret = TextInputType.phone;
        break;
      case 'streetAddress':
        _ret = TextInputType.streetAddress;
        break;
      case 'text':
        _ret = TextInputType.text;
        break;
      case 'url':
        _ret = TextInputType.url;
        break;
      case 'visiblePassword':
        _ret = TextInputType.visiblePassword;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static ImageProvider? imageProviderAdapter(dynamic raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    String _runtimeType = _config['runtimeType'];
    if (_runtimeType == 'AssetImage') {
      String? _assetName = _config['assetName'];
      String _package = _config['package'];
      if (_assetName == null) return null;
      return AssetImage(_assetName, package: _package);
    } else {
      String? _url = _config['url'];
      double? _scale = YZDynamicWidgetUtils.doubleAdapter(_config['scale']);
      if (_url == null) return null;
      return NetworkImage(_url, scale: _scale ?? 1.0);
    }
  }

  ///adapt dsl
  static BorderStyle? borderStyleAdapter(String str) {
    BorderStyle? _ret;
    switch (str) {
      case 'none':
        _ret = BorderStyle.none;
        break;
      case 'solid':
        _ret = BorderStyle.solid;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static Border? borderAdapter(dynamic raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    String _type = _config['type'];
    if (_type == 'side') {
      BorderSide? _left;
      if (_config['left'] != null) {
        _left = YZDynamicWidgetUtils.borderSideAdapter(_config['left']);
      }
      BorderSide? _right;
      if (_config['right'] != null) {
        _right = YZDynamicWidgetUtils.borderSideAdapter(_config['right']);
      }
      BorderSide? _top;
      if (_config['top'] != null) {
        _top = YZDynamicWidgetUtils.borderSideAdapter(_config['top']);
      }
      BorderSide? _bottom;
      if (_config['bottom'] != null) {
        _bottom = YZDynamicWidgetUtils.borderSideAdapter(_config['bottom']);
      }
      return Border(left: _left ?? BorderSide.none, right: _right ?? BorderSide.none, top: _top ?? BorderSide.none, bottom: _bottom ?? BorderSide.none);
    } else {
      return Border.all(
        color: YZDynamicWidgetUtils.colorAdapter(_config['color']) ??
            const Color(0xFF000000),
        width: YZDynamicWidgetUtils.doubleAdapter(_config['width']) ?? 1.0,
        style: YZDynamicWidgetUtils.borderStyleAdapter(_config['style']) ??
            BorderStyle.solid,
      );
    }
  }

  static BorderSide? borderSideAdapter(dynamic raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    return BorderSide(
      color: YZDynamicWidgetUtils.colorAdapter(_config['color']) ??
          const Color(0xFF000000),
      width: YZDynamicWidgetUtils.doubleAdapter(_config['width']) ?? 1.0,
      style: YZDynamicWidgetUtils.borderStyleAdapter(_config['style']) ??
          BorderStyle.solid,
    );
  }

  static BorderRadius? borderRadiusAdapter(dynamic raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    String _type = _config['type'];
    if (_type == 'only') {
      return BorderRadius.only(
        topLeft: YZDynamicWidgetUtils.radiusAdapter(_config['topLeft']) ??
            Radius.zero,
        topRight: YZDynamicWidgetUtils.radiusAdapter(_config['topRight']) ??
            Radius.zero,
        bottomLeft: YZDynamicWidgetUtils.radiusAdapter(_config['bottomLeft']) ??
            Radius.zero,
        bottomRight:
            YZDynamicWidgetUtils.radiusAdapter(_config['bottomRight']) ??
                Radius.zero,
      );
    } else {
      return BorderRadius.circular(
          YZDynamicWidgetUtils.doubleAdapter(_config['radius'])!);
    }
  }

  static Radius? radiusAdapter(dynamic raw) {
    if (raw == null) return null;
    if (raw is String) {
      if (raw.isEmpty) return null;

      double? _radius = YZDynamicWidgetUtils.doubleAdapter(raw);
      return Radius.circular(_radius!);
    }

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    String _type = _config['type'];
    if (_type == 'circular') {
      return Radius.circular(
          YZDynamicWidgetUtils.doubleAdapter(_config['radius'])!);
    } else if (_type == 'elliptical') {
      return Radius.elliptical(YZDynamicWidgetUtils.doubleAdapter(_config['x'])!,
          YZDynamicWidgetUtils.doubleAdapter(_config['y'])!);
    } else {
      return Radius.circular(0);
    }
  }

  static List<BoxShadow>? boxShadowAdapter(dynamic raw) {
    if (raw == null) return null;

    List? _config = YZDynamicCommon.dynamicToList(raw);

    List<BoxShadow>? _ret;
    if (_config != null) {
      _ret = [];
    }
    _config?.forEach((e) {
      Map _e = e as Map;
      _ret?.add(BoxShadow(
        color:
            YZDynamicWidgetUtils.colorAdapter(_e['color']) ?? Color(0xFF000000),
        offset: YZDynamicWidgetUtils.offsetAdapter(_e['offset']) ?? Offset.zero,
        blurRadius: YZDynamicWidgetUtils.doubleAdapter(_e['blurRadius']) ?? 0.0,
        spreadRadius:
            YZDynamicWidgetUtils.doubleAdapter(_e['spreadRadius']) ?? 0.0,
      ));
    });
    return _ret;
  }

  static Offset? offsetAdapter(dynamic raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    return Offset(YZDynamicWidgetUtils.doubleAdapter(_config['dx'])!,
        YZDynamicWidgetUtils.doubleAdapter(_config['dy'])!);
  }

  /// This is an interface that allows [LinearGradient], [RadialGradient], and
  /// [SweepGradient] classes to be used interchangeably in [BoxDecoration]s.
  static Gradient? gradientAdapter(dynamic raw, {State? state}) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    String _runtimeType = _config['runtimeType'];
    if (_runtimeType == 'LinearGradient') {    
      List<dynamic>? _colors = _config['colors'];
      if (_colors == null) return null;

      List<Color>? colors;      
      colors = _colors.map<Color>((e){
        return YZDynamicWidgetUtils.colorAdapter(e, state: state)!;
      }).toList();
      return LinearGradient(
        begin: YZDynamicWidgetUtils.alignmentAdapter(_config['begin'] ?? 'centerLeft')!,
        end: YZDynamicWidgetUtils.alignmentAdapter(_config['end'] ?? 'centerRight')!,        
        colors: colors
      );
    } else {}

    return null;
  }

  static BoxShape? boxShapeAdapter(String str) {
    BoxShape? _ret;
    switch (str) {
      case 'circle':
        _ret = BoxShape.circle;
        break;
      case 'rectangle':
        _ret = BoxShape.rectangle;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static TextOverflow? textOverflowAdapter(String? str) {
    TextOverflow? _ret;
    switch (str) {
      case 'clip':
        _ret = TextOverflow.clip;
        break;
      case 'ellipsis':
        _ret = TextOverflow.ellipsis;
        break;
      case 'fade':
        _ret = TextOverflow.fade;
        break;
      case 'visible':
        _ret = TextOverflow.visible;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static Size? sizeAdapter(dynamic? raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null;

    return Size(
        YZDynamicWidgetUtils.doubleAdapter(_config['color']) ?? double.infinity,
        YZDynamicWidgetUtils.doubleAdapter(_config['width']) ??
            double.infinity);
  }

  ///adapt dsl
  static Curve? curveAdapter(String? str) {
    if (str == null) return null;

    Curve? _ret;
    switch (str) {
      case 'bounceIn':
        _ret = Curves.bounceIn;
        break;
      case 'bounceInOut':
        _ret = Curves.bounceInOut;
        break;
      case 'bounceOut':
        _ret = Curves.bounceOut;
        break;
      case 'decelerate':
        _ret = Curves.decelerate;
        break;
      case 'linear':
        _ret = Curves.linear;
        break;
      case 'ease':
        _ret = Curves.ease;
        break;
      case 'easeIn':
        _ret = Curves.easeIn;
        break;
      case 'easeInBack':
        _ret = Curves.easeInBack;
        break;
      case 'easeInCirc':
        _ret = Curves.easeInCirc;
        break;
      case 'easeInCubic':
        _ret = Curves.easeInCubic;
        break;
      case 'easeInExpo':
        _ret = Curves.easeInExpo;
        break;
      case 'easeInOut':
        _ret = Curves.easeInOut;
        break;
      case 'easeOut':
        _ret = Curves.easeOut;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static ScrollViewKeyboardDismissBehavior?
      scrollViewKeyboardDismissBehaviorAdapter(String? str) {
    ScrollViewKeyboardDismissBehavior? _ret;
    switch (str) {
      case 'manual':
        _ret = ScrollViewKeyboardDismissBehavior.manual;
        break;
      case 'onDrag':
        _ret = ScrollViewKeyboardDismissBehavior.onDrag;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static MaterialTapTargetSize? materialTapTargetSizeAdapter(String? str) {
    MaterialTapTargetSize? _ret;
    switch (str) {
      case 'padded':
        _ret = MaterialTapTargetSize.padded;
        break;
      case 'shrinkWrap':
        _ret = MaterialTapTargetSize.shrinkWrap;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static HitTestBehavior? hitTestBehaviorSizeAdapter(String? str) {
    HitTestBehavior? _ret;
    switch (str) {
      case 'deferToChild':
        _ret = HitTestBehavior.deferToChild;
        break;
      case 'translucent':
        _ret = HitTestBehavior.translucent;
        break;
      case 'opaque':
        _ret = HitTestBehavior.opaque;
        break;
      default:
    }

    return _ret;
  }

  ///adapt dsl
  static BoxDecoration? boxDecorationAdapter(dynamic raw, {State? state}) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null; 

    Color? _color;
    if (_config['color'] != null) {
      _color = YZDynamicWidgetUtils.colorAdapter(_config['color'], state: state);
    }

    DecorationImage? _image;
    if (_config['image'] != null) {
      _image = decorationImageAdapter(_config['image']);
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

    Gradient? _gradient;
    if (_config['gradient'] != null) {
      _gradient = YZDynamicWidgetUtils.gradientAdapter(_config['gradient'], state: state);
    }    

    return BoxDecoration(
        color: _color,
        image: _image,
        border: _border,
        borderRadius: _borderRadius,
        boxShadow: _boxShadow,
        gradient: _gradient,
        backgroundBlendMode: null,
        shape: _shape ?? BoxShape.rectangle);
  }



  static DecorationImage? decorationImageAdapter(dynamic raw) {
    if (raw == null) return null;

    Map? _config = YZDynamicCommon.dynamicToMap(raw);
    if (_config == null) return null; 

    ImageProvider? _image;
    if (_config['image'] != null) {
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
}
