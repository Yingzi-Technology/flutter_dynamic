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
  void triggerEvent([YZDynamicWidgetEventType eventType]);

}

mixin YZDynamicWidgetEventServer implements YZDynamicWidgetEvent {

  ///给控件套上事件
  ///Wrap the event to the widget
  Widget buildWithEvents(Widget widget, List events){
    Widget _widget;

    if (events != null && events.isNotEmpty) {
      Function _onClick;
      for (Map ev in events) {
        YZDynamicWidgetEventConfig m = YZDynamicWidgetEventConfig.fromJson(ev);
        switch (m.eventType) {
          case YZDynamicWidgetEventType.onClick:
          case YZDynamicWidgetEventType.onLongPress:
            _onClick = (){
              triggerEvent();
            };
            break;          
          default:
        }
      }
      _widget = GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: widget,
        onTap: _onClick,
        onLongPress: _onClick,
        onDoubleTap: _onClick,
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
  onValueChanged,
}

class YZDynamicWidgetEventConfig {
  String name;
  YZDynamicWidgetEventType eventType;
  List<YZDynamicActionConfig> actions;
  String code;

  YZDynamicWidgetEventConfig(
      {this.name, this.eventType, this.actions, this.code});

  YZDynamicWidgetEventConfig.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    dynamic _eventType = json['eventType'];
    if (_eventType == 'onClick' || _eventType == 'onTap' || _eventType == 'onPress') {
      eventType = YZDynamicWidgetEventType.onClick;
    } else if (_eventType == 'onLongPress') {
      eventType = YZDynamicWidgetEventType.onLongPress;
    } if (_eventType == 'onValueChanged') {
      eventType = YZDynamicWidgetEventType.onValueChanged;
    }
    if (json['actions'] != null) {
      actions = (json['actions'] as List)?.map((e) => YZDynamicActionConfig.fromJson(e))?.toList();
    }    
    code = json['code'];
  }
}

