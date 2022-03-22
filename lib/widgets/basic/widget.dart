/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-17 20:58:42 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-07-07 17:41:36
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

  final Map? json;

  YZDynamicBaseWidget(this.json, {Key? key}): super(key: key);
}

abstract class YZDynamicWidgetBasicState<T extends YZDynamicBaseWidget> 
  extends State<T> 
  with YZDynamicWidgetEventServer, YZDynamicWidgetActionServer, YZDynamicWidgetDataServer
  implements YZDynamicWidgetEvent {

  YZDynamicWidgetConfig? config;
  
  /*
   * Widget private actions
   * 存储控件私有的 dsl action
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
  Map<String, List<YZDynamicActionConfig>> actionsOfEvent = {};

  /*
   * 存储事件对应的code
   * Store actions corresponding to event
   */
  Map<String, String?> codeOfEvent = {};

  /*
   * The widget identity，it is equal to formfield name
   * 控件的唯一标识，如果是表单元素想着于fromefield name，即请求参数key的值
   */
  String? xKey;

  /*
   * If the widget is formfield. For the page collect the value if true or not
   * 控件是否表单元素，如果true则页面会收集其value，否则不会收集
   */
  bool? isFormField;

  /*
   * The widget general value, such as [TextField] input value
   * 控件产生的值，如 [TextField] 的输入值 
   * Look [actionFunctions] Function()
   */
  String? value;

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
    this.xKey = config?.xKey;
    this.isFormField = config?.isFormField == "true" ? true : false;

    Map? xVar = config?.xVar;
    defineVariable(xVar);

    Map<String, YZDynamicActionConfig>? _actions = config?.xActions?.map((key, value) {
      // if (value.targetKey == null || value.targetKey.isEmpty) {
      //   value.targetKey = xKey;
      // }      
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
    dealLifecycle(this, config?.state?.build, context); 
    return SizedBox();
  }  

  @override
  void didChangeDependencies() {
    if (!_isStateMouned) {
      dealLifecycle(this, config?.state?.initState, context);
    }

    _isStateMouned = true;

    super.didChangeDependencies();
  }  

  @override
  void dispose() {
    dealLifecycle(this, config?.state?.dispose, context);

    super.dispose();    
  }

  ///处理页面生命周期 initState
  ///Deal page state initState
  void dealLifecycle(YZDynamicWidgetBasicState? state, List<YZDynamicActionConfig>? acts, [BuildContext? context]) {
    if (acts != null && acts.isNotEmpty) {   
      List<YZDynamicActionConfig>? _actions = YZDynamicActionTool.getFullfillActions(acts, this.actions, context);
      YZDynamicActionTool.triggerActions(this, _actions);
    }

  }  

  void _dealEvent() {

    List<dynamic>? _xEvents = config?.xEvents;

    _xEvents?.forEach((ejson) {
      if (ejson is Map) {
        YZDynamicWidgetEventConfig e = YZDynamicWidgetEventConfig.fromJson(ejson);
        String? name = e.name;

        _dealActionsOfEvent(e.eventType, name);
        _dealCodeOfEvent(e.eventType, name);   
      }
    });    
  }

  //处理事件对应actions
  //Deal with actions corresponding to event
  void _dealActionsOfEvent(YZDynamicWidgetEventType? eventType, [String? name]) {

    List<YZDynamicActionConfig>? clickActions = super.getActionsOfEvent(context, eventType, name, config?.xEvents, this.actions);
    if (clickActions == null || clickActions.isEmpty) {
      return;
    }
    String _key = getEventKey(eventType, name);    
    actionsOfEvent[_key] = clickActions;

  }

  //处理事件对应code
  //Deal with code corresponding to event
  void _dealCodeOfEvent(YZDynamicWidgetEventType? eventType, [String? name]) {

    List<dynamic>? _xEvents = config?.xEvents;

    _xEvents?.forEach((ejson) {
      if (ejson is Map) {
        YZDynamicWidgetEventConfig e = YZDynamicWidgetEventConfig.fromJson(ejson);
        String? _name = e.name;
        YZDynamicWidgetEventType? _eventType = e.eventType;        
        if (_eventType == eventType && _name == name && e.code!= null) {   
          String _key = getEventKey(eventType, name);    
          codeOfEvent[_key] = e.code;
        }
      }
    });

  }  

  ///处理DSL变量xVar
  ///Deal the DSL variables xVar
  void defineVariable(Map? json) {
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
  void triggerEvent([YZDynamicWidgetEventType? eventType, String? name]) {   

    eventType ??= YZDynamicWidgetEventType.onClick;

    String _key = getEventKey(eventType, name);
    // execute code primarily
    String? code = codeOfEvent[_key];
    if (code != null && code.isNotEmpty){
      YZDynamicCodeUtil.execute(code, state:this);
      return;
    }    

    List<YZDynamicActionConfig>? actions = actionsOfEvent[_key];
    List<YZDynamicActionConfig> _actions = [];
    actions?.forEach((element) {
      YZDynamicActionConfig m = YZDynamicActionConfig();
      _actions.add(m.fillFrom(element));
    });    
    Map? localVariables;
    super.triggerActions(this, _actions, localVariables: localVariables);

  }  

  String getEventKey([YZDynamicWidgetEventType? eventType, String? name]){
    return eventType.toString() + (name ?? '');
  }

}
