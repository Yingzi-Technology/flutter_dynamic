/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-17 15:59:49 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-10-28 14:44:15
 */

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../tools/variable.dart';
import '../../widgets/basic/widget.dart';
import '../../tools/action.dart';

import '../../tools/common.dart';
import '../model/page_config.dart';

///The basic class of page
class YZDynamicBasePage extends StatefulWidget{

  //页面参数 
  //Page config
  final YZDynamicPageTemplateConfig pageConfig;

  //入参 YZDynamicVariable 里的name对应{}里的引用变量
  //Entrance variables. The name in YZDynamicVariable is corresponding to the {variable}
  final YZDynamicPagePreConfig preConfig;

  YZDynamicBasePage({this.pageConfig, this.preConfig});

  static YZDynamicBaseState of(BuildContext context) {
    final YZDynamicBaseState state = context.findAncestorStateOfType<YZDynamicBaseState>();
    return state;
  }

  ///获取某个表单元素的State
  ///Get xKey widget's state
  static YZDynamicWidgetBasicState widgetStateOf(BuildContext context, String xKey) {
    YZDynamicBaseState state = YZDynamicBasePage.of(context);
    dynamic gKey = state.widgets[xKey];
    if ((gKey is GlobalKey) && (gKey.currentState is YZDynamicWidgetBasicState)) {
      return gKey.currentState;
    }
    return null;
  }

  ///获取页面的action
  ///Get page action
  static YZDynamicActionConfig pageActionOf(BuildContext context, String actionName, [String xKey]) {
    YZDynamicBaseState state = YZDynamicBasePage.of(context);
    if (actionName == null || actionName.isEmpty) return null;

    YZDynamicActionConfig action;
    //支持targetKey.actionName查找
    if (xKey != null) {
      action = state.actions["$xKey.$actionName"];
    } 
    if (action == null) {
      action = state.actions[actionName];
    }    
    if (xKey != null && action?.targetKey != xKey) {
      return null;
    }

    return action;
  }  

  ///获取所有表单元素所有内容
  ///Get all page widget value
  static List<YZDynamicPageResult> getAllWidgetValues(BuildContext context) {
    List<YZDynamicPageResult> result = [];

    YZDynamicBaseState state = YZDynamicBasePage.of(context);    
    Map<String, dynamic> widgets = state.widgets;
    widgets.forEach((String key, dynamic value){
      if (value is GlobalKey<YZDynamicWidgetBasicState>) {
        GlobalKey<YZDynamicWidgetBasicState> gKey = value;
        YZDynamicWidgetBasicState state = gKey.currentState;
        if (state?.isFormField == true) {
          result.add(
            YZDynamicPageResult(
              xKey: key,
              value: state.value,
              properties: state.properties
            )            
          );
        }
      }
    });

    return result;    
  }   

  /// 获取某个变量值；查找范围是g/p/w（全局/页面/控件），如果dsl以<p:variableName>标识，则获取页面级变量，如果<w:variableName>则获取控件值，如果<scope:variableName>内是<scope:xxx.xxx>则表示按对象逐级查找，如果找到类型是Map则允许继续查找否则停止查找，如 Object.SomeObject/Object.Map[]
  /// Get variable which scope is g/p/w（global/page/widget）；If variable mark with <p:>, it is for page variable, or <w:> for the widget value. If <scope:variableName> is occupied by <scope:xxx.xx>, find by object pattern. It can continue when the result found is map or stop.
  static dynamic getVariable(    
    BuildContext context, 
    String name, 
    {
      YZDynamicVariableType type = YZDynamicVariableType.page,
      State state
    }
    ) {

    context ??= state?.context;
    if (type == YZDynamicVariableType.widget) {

      YZDynamicBaseState _state = YZDynamicBasePage.of(context);    
      Map<String, dynamic> widgets = _state.widgets;
      dynamic widget = widgets[name];

      if (widget != null && (widget is GlobalKey<YZDynamicWidgetBasicState>)) {
        GlobalKey<YZDynamicWidgetBasicState> gKey = widget;
        YZDynamicWidgetBasicState state = gKey.currentState;
        return state?.value;
      }

    } else if (type == YZDynamicVariableType.widgetProperties) {

      YZDynamicBaseState _state = YZDynamicBasePage.of(context);    
      Map<String, dynamic> widgets = _state.widgets;
      dynamic widget = widgets[name];

      if (widget != null && (widget is GlobalKey<YZDynamicWidgetBasicState>)) {
        GlobalKey<YZDynamicWidgetBasicState> gKey = widget;
        YZDynamicWidgetBasicState state = gKey.currentState;
        return state?.properties;
      }      

    } else {

      YZDynamicBaseState _state;
      if (state is YZDynamicBaseState) {
        _state = state;
      } else {
        _state = YZDynamicBasePage.of(context);
      }      
      Map variables = _state.properties;
      return variables[name];

    }

    return null;
  }

  static void setVariable(    
    BuildContext context, 
    List<String> subvariables, 
    dynamic assinment,
    [YZDynamicVariableType type = YZDynamicVariableType.page]
    ) {

    if (subvariables == null || subvariables.isEmpty) return;

    Map _variables;
    int _start = 0;
    if (type == YZDynamicVariableType.widget) {

      String targetKey = subvariables[0];
      YZDynamicBaseState state = YZDynamicBasePage.of(context);    
      Map<String, dynamic> widgets = state.widgets;
      dynamic widget = widgets[targetKey];

      if (widget != null && (widget is GlobalKey<YZDynamicWidgetBasicState>)) {
        GlobalKey<YZDynamicWidgetBasicState> gKey = widget;
        YZDynamicWidgetBasicState state = gKey.currentState;
        state.value = assinment;
      }
      return;
    } else if (type == YZDynamicVariableType.widgetProperties) {

      if (subvariables.length < 2) return;
      _start = 1;

      String targetKey = subvariables[0];
      YZDynamicBaseState state = YZDynamicBasePage.of(context);    
      Map<String, dynamic> widgets = state.widgets;
      dynamic widget = widgets[targetKey];

      if (widget != null && (widget is GlobalKey<YZDynamicWidgetBasicState>)) {
        GlobalKey<YZDynamicWidgetBasicState> gKey = widget;
        YZDynamicWidgetBasicState state = gKey.currentState;

        _variables = state?.properties;      
      }
          
    } else {

      YZDynamicBaseState state = YZDynamicBasePage.of(context);    
      _variables = state.properties;      
    }

    if (_variables == null || !(_variables is Map)) return; 

    int len = subvariables.length;
    for (var i = _start; i < len; i++) {
      String key = subvariables[i];

      if (i == len - 1) {
        _variables[key] = assinment;
        break;
      }           

      dynamic _value = _variables[key];                  
      if (_value == null) {
        _value = {};                   
      } else {
        if (!(_value is Map)) {
          _value = {};
        }                      
      }
      _variables = _value;
    } 

  }  

  @override
  State<StatefulWidget> createState() => null;  

}

///The basic page state
class YZDynamicBaseState<T extends YZDynamicBasePage> extends State<T> {

  YZDynamicPageTemplateConfig pageConfig;

  /*
   * Widget private actions
   * 存储控件私有的action
   * Params shoud include a "value" key if exist
   * 如果有参数，则必须包含一个值
   */
  Map<String, YZDynamicActionConfig> actions = {};

  /*
   * Page private actions 
   * 页面私有的事件方法实现
   */
  Map<String, YZDynamicActionFunction> actionFunctions = {};  

  ///需要把事件的实现方法注册到[actionFunctions]并定义一个对应的name，否则配置将无法调用相应的事件实现
  ///You should register page action on [actionFunctions] with a name, or it wouldn't invoke when called  
  ///子类产现需要调用super.registerActions();
  ///Implimentation of sub class should call super.registerActions();
  void registerActions(){
    actionFunctions['refresh'] = refresh;
  }

  /// Store the widget of page
  /// It is always used when build widget 
  /// Always store GlobalKey, The key always is xKey
  /// 存储控件的地方，方便寻找，通常储存GlobalKey
  Map<String, dynamic> widgets = {}; 

  void registerWidgets(String xKey, dynamic obj){
    if (xKey == null || obj == null) return;
    if (widgets[xKey] != null) return;
    widgets[xKey] = obj;
  }  

  /// 存储入参的地方，方便控件或页面使用的时候查找
  /// Store the class variable for using by widget or page
  Map properties = {};

  bool _isStateMouned = false;

  /// 页面渲染完成后执行一些操作。主要是为了解决组件各自渲染的过程中需要用到其它组件的变量或方法，而其它组件有可能还没有渲染完成
  /// Callback after the page has rendered. This mechanism resolve some widget will use some properties or method of other widget who is not ready
  /// Look [addPostFrameCallback]
  List<FrameCallback> _postFrameCallbacks = <FrameCallback>[];

  @override
  void initState() {
    super.initState();
    
    pageConfig = widget.pageConfig;
    dealParams(widget.preConfig?.params);

    Map xVar = pageConfig.xVar;    
    defineVariable(xVar);  

    if (pageConfig?.xActions != null) actions.addAll(pageConfig?.xActions);

    if (widget.preConfig?.initState != null) {
      widget.preConfig?.initState();
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      for (FrameCallback callback in _postFrameCallbacks) {
        callback(timeStamp);
      }
    });    
  }

  @override
  void didChangeDependencies() {
    if (!_isStateMouned) {
      dealLifecycleInitState(this, pageConfig?.state?.initState, context);
    }

    _isStateMouned = true;
        
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) { 
    if (widget.preConfig?.build != null) {
      widget.preConfig?.build(context);
    }      
    dealLifecycleInitState(this, pageConfig?.state?.build, context); 
    return null;
  }

  @override
  void dispose() {
    dealLifecycleInitState(this, pageConfig?.state?.dispose, context); 

    super.dispose();    
  }

  ///添加页面加载完的监听方法
  ///Add listener of page loaded
  void addPostFrameCallback(FrameCallback callback) {
    _postFrameCallbacks.add(callback);
  }  

  ///根据dsl预生成widget的key
  ///Generate widget key by dsl
  void dealWidgetKey(Map w) {
    if (w == null || !(w is Map)) return;
    String xKey = w['xKey'];
    dynamic xKeyObj = w['xKeyObj'];
    if (xKey != null && xKey.isNotEmpty) {
      if (xKeyObj != null ) {
        registerWidgets(xKey, xKeyObj);  
        return;      
      }
      xKeyObj = GlobalKey<YZDynamicWidgetBasicState>();
      w['xKeyObj'] = xKeyObj;
      registerWidgets(xKey, xKeyObj);
    }

    Map props = w['props'];
    if (props != null  && (props is Map)) {
      Map child = props['child'];
      if (child != null && (child is Map)) {
        dealWidgetKey(child);
      }
      
      List children = props['children'];
      if (children != null && (children is List)) {
        children.forEach((element) {
          dealWidgetKey(element as Map);
        });      
      }          
    }

  }  

  ///处理入参
  ///Deal the entrance variables 
  void dealParams(List<YZDynamicVariable> params) {
    if (params == null) return;
    params.forEach((YZDynamicVariable param){
      properties[param.name] = param?.value;
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

  ///处理页面生命周期 initState
  ///Deal page state initState
  void dealLifecycleInitState(YZDynamicBaseState state, List<YZDynamicActionConfig> acts, [BuildContext context]) {
    if (acts == null) return;

    if (acts != null && acts.isNotEmpty) {
      YZDynamicActionTool.triggerActions(this, acts);
    }

  }

  void refresh() {
    if (mounted) {
      setState(() {});
    }    
  }

}

class YZDynamicPageResult {
  String xKey;
  String value;
  Map properties;

  YZDynamicPageResult({this.xKey, this.value, this.properties});

  YZDynamicPageResult.fromJson(Map<dynamic, dynamic> json) {
    xKey = json['xKey'];
    value = json['value'];
    properties = json['properties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xKey'] = this.xKey;
    data['value'] = this.value;
    data['properties'] = this.properties;
    return data;
  }  
  
}

class YZDynamicPagePreConfig {

  YZDynamicPagePreConfig({
    this.params, 
    this.actions,
    // this.afterLeave,
    // this.beforeEntrance,
    this.build,
    this.dispose,
    this.initState
  });

  //入参 YZDynamicVariable 里的name对应{}里的引用变量
  //Entrance variables. The name in YZDynamicVariable is corresponding to the {variable}
  List<YZDynamicVariable> params;

  //页面私有action
  //Page private action
  List<YZDynamicActionHandler> actions;

  //进入页面前
  //Before entrance
  // Function beforeEntrance;

  //初始化页面时
  //When initState
  Function initState;

  //页面构建过程中
  //When page render
  Function (BuildContext context) build;

  //页面销毁时
  //When page dispose
  Function dispose;

  //页面消失
  //When page leave
  // Function afterLeave;

}