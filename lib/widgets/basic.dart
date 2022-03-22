/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-19 09:40:11 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-19 10:08:05
 */

import 'package:flutter/material.dart';
import '../tools/common.dart';

import 'basic/handler.dart';
import 'basic/utils.dart';
import 'model/widget_config.dart';

/// SizedBox handler
class YZSizedBoxHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'SizedBox';

  @override
  Widget build(Map json, {Key key, BuildContext buildContext}) {
    
    //Deal with props / 处理控件属性
    YZDynamicWidgetConfig config = YZDynamicWidgetConfig.fromJson(json);   
    YZSizedBoxConfig props = YZSizedBoxConfig.fromJson(config.props) ?? {};
    String _type = props?.type;    
    Widget _child = props.child == null ? null : YZDynamicCommon.buildWidget(props.child, context: buildContext);

    SizedBox _widget;
    switch (_type) {
      case 'expand':
        _widget = SizedBox.expand(
          child: _child
        );         
        break;
      case 'shrink':
        _widget = SizedBox.shrink(
          child: _child
        );         
        break;  
      case 'fromSize':
        Size _size = YZDynamicWidgetUtils.sizeAdapter(props?.size);
        _widget = SizedBox.fromSize(
          size: _size,
          child: _child
        );         
        break;              
      default:
        double _width = YZDynamicWidgetUtils.doubleAdapter(props?.width);
        double _height = YZDynamicWidgetUtils.doubleAdapter(props?.height);      
        _widget = SizedBox(
          width: _width,
          height: _height,
          child: _child
        );       
    }

    return _widget;   
  }
  
}

/// The props of SizedBox config
class YZSizedBoxConfig {
  String type; //expand/shrink/fromSize
  String width;
  String height;
  Map size;
  Map child;

  YZSizedBoxConfig(
      {this.type,
      this.width,
      this.height,
      this.child});

  YZSizedBoxConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    type = json['type'];
    width = json['width'];
    height = json['height'];
    child = json['child'];
  }
}