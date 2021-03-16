/*
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-16 22:24:50 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-24 09:44:37
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'event.dart';
import 'widget.dart';
export '../../tools/action.dart';

mixin YZDynamicWidgetActionServer {

  //获取事件对应的actions，action有3个来源：控件本身、别的控件、公共区域
  //Get actions corresponding to the event. There are three source: Self DynamicWidget/Other DynamicWidget in page/Public DynamicWidget
  List<YZDynamicActionConfig> getActionsOfEvent(
    BuildContext context,
    YZDynamicWidgetEventType eventType, 
    List<dynamic> xEvents,
    Map<String, YZDynamicActionConfig> xActions
    ) {
      return YZDynamicActionTool.getActionsOfEvent(context, eventType, xEvents, xActions);
  }

  //获取简单属性actions对应的actions，action有3个来源：控件本身、别的控件、公共区域
  //Get actions corresponding to the actions with simple properties. There are three source: Self DynamicWidget/Other DynamicWidget in page/Public DynamicWidget
  List<YZDynamicActionConfig> getActionsOfSimpleActions(
    List<YZDynamicActionConfig> simpleActions,
    Map<String, YZDynamicActionConfig> xActions,
    [BuildContext context]
  ) {
    return YZDynamicActionTool.getActionsOfSimpleActions(simpleActions, xActions);
  }

  void triggerActions(
    YZDynamicWidgetBasicState state, 
    List<YZDynamicActionConfig> actions,
    {Map localVariables}
  ){
    return YZDynamicActionTool.triggerActions(state, actions, localVariables: localVariables);
  }

}
