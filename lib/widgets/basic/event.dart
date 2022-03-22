/*
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-17 14:37:45 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-19 22:49:16
 */

import 'package:flutter/material.dart';
import '../../tools/action.dart';

abstract class YZDynamicWidgetEvent{

  // @protected
  void triggerEvent([YZDynamicWidgetEventType eventType, String? name]);

}

mixin YZDynamicWidgetEventServer implements YZDynamicWidgetEvent {

  ///给控件套上事件
  ///Wrap the event to the widget
  ///这个方法只针对基础组件进行绑定，不针对有子对象（YZDynamicWidgetEventConfig.name）的组件进行区分子对象绑定
  Widget buildWithEvents(Widget widget, List? events){
    Widget _widget;

    if (events != null && events.isNotEmpty) {
      Function? _onClick;
      Function? _onLongPress;
      Function? _onDoubleTap;
      for (Map ev in events) {
        YZDynamicWidgetEventConfig m = YZDynamicWidgetEventConfig.fromJson(ev);
        switch (m.eventType) {
          case YZDynamicWidgetEventType.onClick:
            _onClick = (){
              triggerEvent(YZDynamicWidgetEventType.onClick);
            };
            break;            
          case YZDynamicWidgetEventType.onLongPress:
            _onLongPress = (){
              triggerEvent(YZDynamicWidgetEventType.onLongPress);
            };
            break;          
          case YZDynamicWidgetEventType.onDoubleTap:
            _onDoubleTap = (){
              triggerEvent(YZDynamicWidgetEventType.onDoubleTap);
            };
            break;          
          default:
        }
      }
      _widget = GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: widget,
        onTap: (){
          if (_onClick != null)_onClick();
        },
        onLongPress: (){
          if (_onLongPress != null)_onLongPress();
        },
        onDoubleTap: (){
          if (_onDoubleTap != null)_onDoubleTap();
        },
      );
    } else {
      _widget = widget;
    }

    return _widget;
  }

}

//The type of event / 事件类型
enum YZDynamicWidgetEventType {
  onClick, //onTap/onPress
  onLongPress,
  onDoubleTap,
  onValueChanged,
}

class YZDynamicWidgetEventConfig {
  String? name;
  YZDynamicWidgetEventType? eventType;
  List<YZDynamicActionConfig>? actions;
  String? code;

  YZDynamicWidgetEventConfig(
      {this.name, this.eventType, this.actions, this.code});

  YZDynamicWidgetEventConfig.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    dynamic _eventType = json['eventType'];
    if (_eventType == 'onClick' || _eventType == 'onTap' || _eventType == 'onPress' || _eventType == 'click') {
      eventType = YZDynamicWidgetEventType.onClick;
    } else if (_eventType == 'onLongPress' || _eventType == 'longclick') {
      eventType = YZDynamicWidgetEventType.onLongPress;
    } else if (_eventType == 'onDoubleTap' || _eventType == 'dblclick') {
      eventType = YZDynamicWidgetEventType.onDoubleTap;
    } if (_eventType == 'onValueChanged') {
      eventType = YZDynamicWidgetEventType.onValueChanged;
    }
    if (json['actions'] != null) {
      actions = (json['actions'] as List).map((e) => YZDynamicActionConfig.fromJson(e)).toList();
    }    
    code = json['code'];
  }
}

