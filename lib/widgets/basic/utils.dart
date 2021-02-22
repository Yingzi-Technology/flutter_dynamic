/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 12:02:10     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-01-25 11:24:18
**/   

import 'dart:convert';

import 'package:flutter/material.dart';
import '../../tools/code.dart';
import '../../tools/common.dart';

class YZDinamicWidgetUtils {
  YZDinamicWidgetUtils._();
  
  static String valueAdapter(String str, State state) {
      String _ret;

      _ret = YZDynamicVariableUtil.getValueOfVariable(str, state: state);

      return _ret;
  }

  ///adapt dsl alignment to the flutter Alignment
  static Alignment alignmentAdapter(String alignmentString){
    Alignment alignment;
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
  static TextAlign textAlignAdapter(String alignmentString){
    TextAlign alignment;
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
  static Color colorAdapter(String colorString){
    Color color;
    if (colorString != null) {
      int v = int.tryParse(colorString);
      color = v != null ? Color(v) : null;
    }

    return color;
  }

  ///adapt dsl fontWeight to the flutter fontWeight
  static FontWeight fontWeightAdapter(String fontWeightString){
    FontWeight fontWeight;
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
  static FontStyle fontStypeAdapter(String fontStypeString){
    FontStyle fontStyle;
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
  static EdgeInsets edgeInsetAdapter(dynamic edgeInsetList){
    if (edgeInsetList == null) return null;
    
    return YZDynamicCommon.edgeInsetAdapter(edgeInsetList);
  } 

  ///adapt dsl rect to the flutter Rect [left, top, right, bottom]
  static Rect rectAdapter(dynamic rectRaW){
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
      YZDynamicCommon.parseDouble(rectList[0]), 
      YZDynamicCommon.parseDouble(rectList[1]),
      YZDynamicCommon.parseDouble(rectList[2]), 
      YZDynamicCommon.parseDouble(rectList[3])
    );

    return _ret;
  }  

  ///adapt dsl color to the flutter color 0xff123456
  static double doubleAdapter(String colorString){
    if (colorString == null) return null;

    return YZDynamicCommon.parseDouble(num.tryParse(colorString));
  }  

  ///adapt dsl color to the flutter color 0xff123456
  static int intAdapter(String str){
    if (str == null) return null;

    return YZDynamicCommon.parseInt(num.tryParse(str));
  }   

  ///adapt dsl TextInputType to the flutter TextInputType
  static TextInputType inputTypeAdapter(String inputTypeString){
    TextInputType inputType;
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
  static bool boolAdapter(String str, {State state}){    

    //If value is code 
    if (YZDynamicCodeUtil.isCode(str)) {
      dynamic codeResult = YZDynamicCodeUtil.execute(str, state: state);
      if (codeResult is bool) return codeResult ?? false;
    }

    bool _bool;
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
  static List listAdapter<T>(String str, {State state}){    
    if (str == null || str.isEmpty) return null;

    //If value is code 
    if (YZDynamicCodeUtil.isCode(str)) {
      dynamic codeResult = YZDynamicCodeUtil.execute<T>(str, state: state);
      if (codeResult is List) return codeResult;
      else return null;
    }

    if (!str.startsWith('[')) return null;
    return jsonDecode(str.replaceAll(r"\s", ""));
  }  

  ///adapt dsl boxfit
  static BoxFit boxfitAdapter(String str){    

    BoxFit _boxFit;
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
  
  ///adapt dsl imageRepeat
  static ImageRepeat imageRepeatAdapter(String str){    

    ImageRepeat _ret;
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
  static MainAxisAlignment mainAxisAlignmentAdapter(String str){    

    MainAxisAlignment _ret;
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
  static MainAxisSize mainAxisSizeAdapter(String str){    

    MainAxisSize _ret;
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
  static CrossAxisAlignment crossAxisAlignmentAdapter(String str){    

    CrossAxisAlignment _ret;
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
  static TextDirection textDirectionAdapter(String str){    

    TextDirection _ret;
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
  static VerticalDirection verticalDirectionAdapter(String str){    

    VerticalDirection _ret;
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
  static TextBaseline textBaselineAdapter(String str){    

    TextBaseline _ret;
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
  static Axis axisAdapter(String str){    

    Axis _ret;
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
  static Clip clipBehaviorAdapter(String str){    

    Clip _ret;
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
  static TextStyle textStyleAdapter(dynamic raw){    

    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 

    Color _color;
    if (_config['color'] != null) {
      _color = YZDinamicWidgetUtils.colorAdapter(_config['color']);
    }

    Color _backgroundColor;
    if (_config['background'] != null) {
      _backgroundColor = YZDinamicWidgetUtils.colorAdapter(_config['background']);
    }

    double _fontSize;
    if (_config['fontSize'] != null) {
      _fontSize = YZDinamicWidgetUtils.doubleAdapter(_config['fontSize']);
    }    

    FontWeight _fontWeight;
    if (_config['fontWeight'] != null) {
      _fontWeight = YZDinamicWidgetUtils.fontWeightAdapter(_config['fontWeight']);
    }   

    FontStyle _fontStyle;
    if (_config['fontWeight'] != null) {
      _fontStyle = YZDinamicWidgetUtils.fontStypeAdapter(_config['fontStyle']);
    }  

    double _letterSpacing;
    if (_config['letterSpacing'] != null) {
      _letterSpacing = YZDinamicWidgetUtils.doubleAdapter(_config['letterSpacing']);
    }   

    double _wordSpacing;
    if (_config['wordSpacing'] != null) {
      _wordSpacing = YZDinamicWidgetUtils.doubleAdapter(_config['wordSpacing']);
    }   

    double _height;
    if (_config['height'] != null) {
      _height = YZDinamicWidgetUtils.doubleAdapter(_config['height']);
    }               

    String _fontFamily;
    if (_config['fontFamily'] != null) {
      _fontFamily = _config['fontFamily'];
    }  

    String _package;
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
      package: _package
    );

    return _ret;
  }  

  ///adapt dsl
  static StrutStyle strutStyleAdapter(dynamic raw){    

    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 

    double _leading;
    if (_config['leading'] != null) {
      _leading = YZDinamicWidgetUtils.doubleAdapter(_config['leading']);
    }

    bool _forceStrutHeight;
    if (_config['forceStrutHeight'] != null) {
      _forceStrutHeight = YZDinamicWidgetUtils.boolAdapter(_config['forceStrutHeight']);
    }

    double _fontSize;
    if (_config['fontSize'] != null) {
      _fontSize = YZDinamicWidgetUtils.doubleAdapter(_config['fontSize']);
    }    

    FontWeight _fontWeight;
    if (_config['fontWeight'] != null) {
      _fontWeight = YZDinamicWidgetUtils.fontWeightAdapter(_config['fontWeight']);
    }   

    FontStyle _fontStyle;
    if (_config['fontWeight'] != null) {
      _fontStyle = YZDinamicWidgetUtils.fontStypeAdapter(_config['fontStyle']);
    }  

    String _debugLabel;
    if (_config['debugLabel'] != null) {
      _debugLabel = _config['debugLabel'];
    }   

    double _height;
    if (_config['height'] != null) {
      _height = YZDinamicWidgetUtils.doubleAdapter(_config['height']);
    }               

    String _fontFamily;
    if (_config['fontFamily'] != null) {
      _fontFamily = _config['fontFamily'];
    }  

    String _package;
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
      package: _package
    );

    return _ret;
  }   
    
  ///adapt dsl
  static TextInputType keyboardTypeAdapter(String str){    

    TextInputType _ret;
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
  static ImageProvider imageProviderAdapter(dynamic raw) {

    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 
    if (_config == null) return null;

    String _runtimeType = _config['runtimeType'];
    if (_runtimeType == 'AssetImage') {
      String _assetName = _config['assetName'];
      String _package = _config['package'];
      if (_assetName == null) return null; 
      return AssetImage(
        _assetName,
        package: _package     
      );
    } else {
      String _url = _config['url'];
      double _scale = YZDinamicWidgetUtils.doubleAdapter(_config['scale']);
      if (_url == null) return null; 
      return NetworkImage(
        _url,
        scale: _scale
      );
    }

  }

  ///adapt dsl
  static BorderStyle borderStyleAdapter(String str){    

    BorderStyle _ret;
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
  static Border borderAdapter(dynamic raw) {

    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 

    String _type = _config['type'];
    if (_type == 'side') {
      BorderSide _left;
      if (_config['left'] != null) {
        _left = YZDinamicWidgetUtils.borderSideAdapter(_config['left']);
      }
      BorderSide _right;
      if (_config['right'] != null) {
        _right = YZDinamicWidgetUtils.borderSideAdapter(_config['right']);
      }   
      BorderSide _top;
      if (_config['top'] != null) {
        _top = YZDinamicWidgetUtils.borderSideAdapter(_config['top']);
      }   
      BorderSide _bottom;
      if (_config['bottom'] != null) {
        _bottom = YZDinamicWidgetUtils.borderSideAdapter(_config['bottom']);
      }                
      return Border(
        left: _left,
        right: _right,
        top: _top,
        bottom: _bottom
      );      
    } else {    
      return Border.all(
        color: YZDinamicWidgetUtils.colorAdapter(_config['color']) ?? const Color(0xFF000000),
        width: YZDinamicWidgetUtils.doubleAdapter(_config['width']) ?? 1.0,
        style: YZDinamicWidgetUtils.borderStyleAdapter(_config['style']) ?? BorderStyle.solid,        
      );
    }

  }

  static BorderSide borderSideAdapter(dynamic raw) {
    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 

    return BorderSide(
      color: YZDinamicWidgetUtils.colorAdapter(_config['color']) ?? const Color(0xFF000000),
      width: YZDinamicWidgetUtils.doubleAdapter(_config['width']) ?? 1.0,
      style: YZDinamicWidgetUtils.borderStyleAdapter(_config['style']) ?? BorderStyle.solid,
    );
  }

  static BorderRadius borderRadiusAdapter(dynamic raw) {
    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 
    String _type = _config['type'];
    if (_type == 'only') {
      return BorderRadius.only(
        topLeft: YZDinamicWidgetUtils.radiusAdapter(_config['topLeft']) ?? Radius.zero,
        topRight: YZDinamicWidgetUtils.radiusAdapter(_config['topRight']) ?? Radius.zero,
        bottomLeft: YZDinamicWidgetUtils.radiusAdapter(_config['bottomLeft']) ?? Radius.zero,
        bottomRight: YZDinamicWidgetUtils.radiusAdapter(_config['bottomRight']) ?? Radius.zero,
      );
    } else {
      return BorderRadius.circular(
        YZDinamicWidgetUtils.doubleAdapter(_config['radius'])
      );
    }

  }

  static Radius radiusAdapter(String str) {
    if (str == null || str.isEmpty) return null;

    double _radius = YZDinamicWidgetUtils.doubleAdapter(str);
    return Radius.circular(_radius);
  }

  static List<BoxShadow> boxShadowAdapter(dynamic raw) {
    if (raw == null) return null;

    List _config = YZDynamicCommon.dynamicToList(raw); 

    List<BoxShadow> _ret;
    if (_config != null) {
      _ret = [];
    }
    _config?.forEach((e) {
      Map _e = e as Map;
      _ret.add(BoxShadow(
        color: YZDinamicWidgetUtils.colorAdapter(_e['color']) ?? Color(0xFF000000),
        offset: YZDinamicWidgetUtils.offsetAdapter(_e['offset']) ?? Offset.zero,
        blurRadius: YZDinamicWidgetUtils.doubleAdapter(_e['blurRadius']) ?? 0.0,
        spreadRadius: YZDinamicWidgetUtils.doubleAdapter(_e['spreadRadius']) ?? 0.0,
      ));
    });
    return _ret;
  }  

  static Offset offsetAdapter(dynamic raw) {
    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 
    if (_config == null) return null;

    return Offset(
      YZDinamicWidgetUtils.doubleAdapter(_config['dx']),
      YZDinamicWidgetUtils.doubleAdapter(_config['dy'])
    );
  }  
 
  /// This is an interface that allows [LinearGradient], [RadialGradient], and
  /// [SweepGradient] classes to be used interchangeably in [BoxDecoration]s.
  static Gradient gradientAdapter(dynamic raw) {
    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 
    if (_config == null) return null;

    String _runtimeType = _config['runtimeType'];
    if (_runtimeType == 'LinearGradient') {

    } else {

    }
    return null;
  }  

  static BoxShape boxShapeAdapter(String str) {
    BoxShape _ret;
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
  static TextOverflow textOverflowAdapter(String str){    

    TextOverflow _ret;
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
  static Size sizeAdapter(dynamic raw) {

    if (raw == null) return null;

    Map _config = YZDynamicCommon.dynamicToMap(raw); 
    return Size(
      YZDinamicWidgetUtils.doubleAdapter(_config['color']) ?? double.infinity,
      YZDinamicWidgetUtils.doubleAdapter(_config['width']) ?? double.infinity
    );

  }  

  ///adapt dsl
  static Curve curveAdapter(String str) {

    if (str == null) return null;

    Curve _ret;
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
   
}