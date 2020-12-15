/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-17 20:58:42 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-10-28 16:51:07
 */

import 'package:flutter/material.dart';
import '../../tools/code.dart';
import '../../tools/variable.dart';
import '../../tools/action.dart';
import '../model/widget_config.dart';
import 'action.dart';
import 'data.dart';
import 'event.dart';

abstract class YZDynamicBaseWidget extends StatefulWidget {

  final Map<String, dynamic> json;

  YZDynamicBaseWidget(this.json, {Key key}): super(key: key);
}

abstract class YZDynamicWidgetBasicState<T extends YZDynamicBaseWidget> 
  extends State<T> 
  with YZDynamicWidgetEventServer, YZDynamicWidgetActionServer, YZDynamicWidgetDataServer
  implements YZDynamicWidgetEvent {

  YZDynamicWidgetConfig config;
  
  /*
   * Widget private actions
   * 存储控件私有的action
   * Params shoud include a "value" key if exist
   * 如果有参数，则必须包含一个值
   */
  Map<String, YZDynamicActionConfig> actions = {};

  /*
   * Widget private action functions 
   * 存储控件私有的action对应的方法
   * Params shoud include a "value" key if exist
   * 如果有参数，则必须包含一个值
   */
  Map<String, YZDynamicActionFunction> actionFunctions = {};

  //You should register your event action on [actionFunctions] with a name, or it wouldn't invoke when event called
  //需要把事件的实现方法注册到[actionFunctions]并定义一个对应的name，否则远程配置将无法调用相应的事件实现
  void registerActions();

  /*
   * 存储事件对应的actions
   * Store actions corresponding to event
   */
  Map<YZDynamicWidgetEventType, List<YZDynamicActionConfig>> actionsOfEvent = {};

  /*
   * 存储事件对应的code
   * Store actions corresponding to event
   */
  Map<YZDynamicWidgetEventType, String> codeOfEvent = {};

  /*
   * The widget identity，it is equal to formfield name
   * 控件的唯一标识，如果是表单元素想着于fromefield name，即请求参数key的值
   */
  String xKey;

  /*
   * If the widget is formfield. For the page collect the value if true or not
   * 控件是否表单元素，如果true则页面会收集其value，否则不会收集
   */
  bool isFormField;

  /*
   * The widget general value, such as [TextField] input value
   * 控件产生的值，如 [TextField] 的输入值 
   * Look [actionFunctions] Function()
   */
  String value;

  /*
   * The widget general properties info，such as the variable offering for other widget
   * 控件产生的额外的值，比如提供外部使用的变量
   * Look [actionFunctions] Function()
   */
  Map properties = {}; 

  bool _isStateMouned = false;

  @override
  void initState() {
    super.initState();

    config = YZDynamicWidgetConfig.fromJson(widget.json);    
    this.xKey = config.xKey;
    this.isFormField = config.isFormField == "true" ? true : false;

    Map xVar = config.xVar;
    defineVariable(xVar);

    Map<String, YZDynamicActionConfig> _actions = config?.xActions?.map((key, value) {
      value.targetKey = xKey;
      return MapEntry(key, value);
    });
    if (_actions != null) {
      actions.addAll(_actions);
    }        

    registerActions();
    _dealEvent();
   
  }

  @override
  Widget build(BuildContext context) {     
    dealLifecycleInitState(this, config?.state?.build, context); 
    return null;
  }  

  @override
  void didChangeDependencies() {
    if (!_isStateMouned) {
      dealLifecycleInitState(this, config?.state?.initState, context);
    }

    _isStateMouned = true;

    super.didChangeDependencies();
  }  

  @override
  void dispose() {
    dealLifecycleInitState(this, config?.state?.dispose, context);

    super.dispose();    
  }

  ///处理页面生命周期 initState
  ///Deal page state initState
  void dealLifecycleInitState(YZDynamicWidgetBasicState state, List<YZDynamicActionConfig> acts, [BuildContext context]) {
    if (acts != null && acts.isNotEmpty) {    
      YZDynamicActionTool.triggerActions(this, acts);
    }

  }  

  void _dealEvent() {

    List<dynamic> _xEvents = config.xEvents;

    _xEvents?.forEach((ejson) {
      if (ejson is Map) {
        YZDynamicWidgetEventConfig e = YZDynamicWidgetEventConfig.fromJson(ejson);
        _dealActionsOfEvent(e.eventType);
        _dealCodeOfEvent(e.eventType);   
      }
    });    
  }

  //处理事件对应actions
  //Deal with actions corresponding to event
  void _dealActionsOfEvent(YZDynamicWidgetEventType eventType) {

    List<YZDynamicActionConfig> clickActions = super.getActionsOfEvent(context, eventType, config.xEvents, this.actions);
    actionsOfEvent[eventType] = clickActions;

  }

  //处理事件对应code
  //Deal with code corresponding to event
  void _dealCodeOfEvent(YZDynamicWidgetEventType eventType) {

    List<dynamic> _xEvents = config.xEvents;

    _xEvents?.forEach((ejson) {
      if (ejson is Map) {
        YZDynamicWidgetEventConfig e = YZDynamicWidgetEventConfig.fromJson(ejson);
        if (e.eventType == eventType && e?.code!= null) {        
          codeOfEvent[eventType] = e.code;
        }
      }
    });

  }  

  ///处理DSL变量xVar
  ///Deal the DSL variables xVar
  void defineVariable(Map json) {
    if (json == null) return;
    json.forEach((key, value) {
      if (properties[key] != null) return;
      properties[key] = YZDynamicVariableUtil.getValueOfVariable(value, state: this, context: context);
    });
  }    

  /*
   * The click event entry
   * 点击事件入口
   */
  @override
  void triggerEvent([YZDynamicWidgetEventType eventType]) {   

    eventType ??= YZDynamicWidgetEventType.onClick;
    // execute code primarily
    String code = codeOfEvent[eventType];
    if (code != null && code.isNotEmpty){
      YZDynamicCodeUtil.execute(code, state:this);
      return;
    }    

    List<YZDynamicActionConfig> actions = actionsOfEvent[eventType];
    Map localVariables;
    super.triggerActions(this, actions, localVariables: localVariables);

  }  

}
