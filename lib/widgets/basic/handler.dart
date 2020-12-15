/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 11:20:05     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-17 17:45:04
**/   

import 'package:flutter/material.dart';

/// extends this class to make a Flutter widget base.
abstract class YZDynamicBasicWidgetHandler {

  /// the widget type name
  String get widgetName;

  /// parse the json map into a flutter widget.
  Widget build(Map<String, dynamic> json, {Key key, BuildContext buildContext});

}