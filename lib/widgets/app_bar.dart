/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-02 22:27:02 
 * @Last Modified by:   yz.yujingzhou 
 * @Last Modified time: 2020-11-02 22:27:02  
 */

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

/// AppBar handler
class YZAppBarHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'AppBar';

  @override
  Widget build(Map<String, dynamic> json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget implements PreferredSizeWidget {

  final Map<String, dynamic> json;

  _Builder(this.json, {Key key}): super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {

  //Deal with props / 处理控件属性
  YZAppBarConfig props;

  Widget _leading;
  List<Widget> _actions;
  Widget _title;
  Widget _flexibleSpace;
  PreferredSizeWidget _bottom;
  double _elevation;
  Color _shadowColor;
  Color _backgroundColor;
  Brightness _brightness;
  bool _primary;
  bool _centerTitle;
  bool _excludeHeaderSemantics;
  double _titleSpacing;
  double _toolbarOpacity;
  double _bottomOpacity;
  double _toolbarHeight;
  double _leadingWidth;

  @override
  void initState() {
    super.initState();

    props = YZAppBarConfig.fromJson(super.config.props) ?? {};

    _leading = YZDynamicCommon.buildWidget(props.leading, context: context);
    if (props.leading != null) {
      _actions = [];
      props.leading.forEach((key, value) {
        _actions.add(YZDynamicCommon.buildWidget(value, context: context));
      });
    }
    _title = YZDynamicCommon.buildWidget(props.title, context: context);
    _flexibleSpace = YZDynamicCommon.buildWidget(props.flexibleSpace, context: context);
    _bottom = YZDynamicCommon.buildWidget(props.bottom, context: context);
    _elevation = YZDinamicWidgetUtils.doubleAdapter(props.elevation);
    _shadowColor = YZDinamicWidgetUtils.colorAdapter(props.shadowColor);
    _backgroundColor = YZDinamicWidgetUtils.colorAdapter(props.backgroundColor);
    _brightness = _brightnessAdapter(props.brightness);
    _primary = YZDinamicWidgetUtils.boolAdapter(props.primary);
    _centerTitle = YZDinamicWidgetUtils.boolAdapter(props.centerTitle);
    _excludeHeaderSemantics = YZDinamicWidgetUtils.boolAdapter(props.excludeHeaderSemantics);
    _titleSpacing = YZDinamicWidgetUtils.doubleAdapter(props.titleSpacing);
    _toolbarOpacity = YZDinamicWidgetUtils.doubleAdapter(props.toolbarOpacity);
    _bottomOpacity = YZDinamicWidgetUtils.doubleAdapter(props.bottomOpacity);
    _toolbarHeight = YZDinamicWidgetUtils.doubleAdapter(props.toolbarHeight);
    _leadingWidth = YZDinamicWidgetUtils.doubleAdapter(props.leadingWidth);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;
    
    _widget = AppBar(
      leading: _leading,
      automaticallyImplyLeading: true,
      title: _title,
      actions: _actions,
      flexibleSpace: _flexibleSpace,
      bottom: _bottom,
      elevation: _elevation,
      shadowColor: _shadowColor,
      shape: null,
      backgroundColor: _backgroundColor,
      brightness: _brightness,
      iconTheme: null,
      actionsIconTheme: null,
      textTheme: null,
      primary: _primary ?? true,
      centerTitle: _centerTitle,
      excludeHeaderSemantics: _excludeHeaderSemantics ?? false,
      titleSpacing: _titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      toolbarOpacity: _toolbarOpacity ?? 1.0,
      bottomOpacity: _bottomOpacity ?? 1.0,
      toolbarHeight: _toolbarHeight,
      leadingWidth: _leadingWidth,
    );  

    return _widget;
  }

  @override
  void registerActions() {
  }

}

Brightness _brightnessAdapter(String str) {

  Brightness _ret;
  switch (str) {
    case 'dark':
      _ret = Brightness.dark; 
      break;   
    case 'light':
      _ret = Brightness.light; 
      break;                                                                    
    default:
  }

  return _ret;
    
}

/// The props of AppBar config
class YZAppBarConfig {
  Map leading;
  List<Map> actions;
  Map title;
  Map flexibleSpace;
  Map bottom;
  String elevation;
  String shadowColor;
  String backgroundColor;
  String brightness;
  String primary;
  String centerTitle;
  String excludeHeaderSemantics;
  String titleSpacing;
  String toolbarOpacity;
  String bottomOpacity;
  String toolbarHeight;
  String leadingWidth;

  YZAppBarConfig({
    this.leading,
    this.actions,
    this.title,
    this.flexibleSpace,
    this.bottom,
    this.elevation,
    this.shadowColor,
    this.backgroundColor,
    this.brightness,
    this.primary,
    this.centerTitle,
    this.excludeHeaderSemantics,
    this.titleSpacing,
    this.toolbarOpacity,
    this.bottomOpacity,
    this.toolbarHeight,
    this.leadingWidth
  });

  YZAppBarConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    leading = json['leading'];
    actions = json['actions'];
    title = json['title']; 
    flexibleSpace = json['flexibleSpace'];
    bottom = json['bottom'];
    elevation = json['elevation'];
    shadowColor = json['shadowColor'];
    backgroundColor = json['backgroundColor'];
    brightness = json['brightness'];
    primary = json['primary'];
    centerTitle = json['centerTitle'];
    excludeHeaderSemantics = json['excludeHeaderSemantics'];
    titleSpacing = json['titleSpacing'];
    toolbarOpacity = json['toolbarOpacity'];
    bottomOpacity = json['bottomOpacity'];
    toolbarHeight = json['toolbarHeight'];
    leadingWidth = json['leadingWidth'];
  }

}