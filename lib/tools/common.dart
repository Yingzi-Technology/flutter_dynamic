/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 15:26:55     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-13 08:50:50
**/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import '../pages/basic/page.dart';
import 'action.dart';
import '../widgets/basic/handler.dart';
import '../widgets/all.dart';
export 'rule.dart';
export 'action.dart';
export 'network.dart';
export 'code.dart';
export 'variable.dart';

class YZDynamicCommon {
  YZDynamicCommon._();

  /// Public widgets storage
  /// Widget存储变量，无论是系统还是扩展的Widget最终需要注册到这里
  static Map<String, YZDynamicBasicWidgetHandler> _widgetHandlers = {};
  static bool isSysWidgetHandlersMounted = false;

  /// Public action storage
  /// 公开action存储变量，无论是系统还是扩展的action最终需要注册到这里
  static Map<String, YZDynamicActionHandler> _publicActionHandlers = {};
  static bool isPageExitHandlersMounted = false;

  /// Global variable storage
  /// 全局变量
  static Map<String, dynamic> _globalActionHandlers = {};

  /// Widget property adaptive interceptor
  /// Widget属性适配拦截器{"widgetName": (config){}}，可以对元件的配置属生拦截更改后并重新返回
  static Map<String, Map Function(Map)> _widgetConfigInterceptor = {};  

  static addGlobalVariable(String k, dynamic v) {
    _globalActionHandlers[k] = v;
  }

  static dynamic getGlobalVariable(String k) {
    return _globalActionHandlers[k];
  }

  static void setGlobalVariable(List<String> subvariables, dynamic assinment) {
    if (subvariables == null || subvariables.isEmpty) return;

    Map _variables;
    int _start = 0;

    _variables = _globalActionHandlers;

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

  static addWidgetConfigInterceptor(String k,  Function(Map) v) {
    if (_widgetConfigInterceptor[k] != null) {
      assert(_widgetConfigInterceptor[k] == null, "Error: The interceptor of \"$k\" widget has been exist!");
      return;
    }    
    _widgetConfigInterceptor[k] = v;
  }  

  ///Build widget
  static Widget buildWidget(Map json, {Key key, BuildContext context}) {
    if (json == null) return null;
    YZDynamicBasicWidgetHandler handler = _widgetHandlers[json['widgetName']];
    if (handler == null) return null;
    Function interceptor = _widgetConfigInterceptor[json['widgetName']];
    if (interceptor != null){
      json = interceptor(json);
    }
    if (key == null) {
      key = json['xKeyObj'];
    }
    return handler.build(json, key: key, buildContext: context);
  }

  ///It should register widget handler, because flutter don't support reflect,
  ///因为flutter不支持反射，所以只能先注册能用的句柄
  static reginsterWidgetHandler(YZDynamicBasicWidgetHandler handler) {
    if (handler == null) return;

    _widgetHandlers[handler.widgetName] = handler;
  }

  ///Register system widget. Engine will find the widget for the dsl in register pool.
  ///注册系统组件到注册池里，引擎将通过dsl在注册池里找到相应的组件
  static registerSysWidgets() {
    if (YZDynamicCommon.isSysWidgetHandlersMounted) return;
    YZDynamicCommon.isSysWidgetHandlersMounted = true;

    for (Object item in yzAllDynamicWidgetHandlers) {
      YZDynamicCommon.reginsterWidgetHandler(item);
    }
  }

  ///Get system public action by actionName
  ///获取系统公开action
  static YZDynamicActionHandler publicActionHandler(String actionName) {
    return _publicActionHandlers[actionName];
  }

  ///Register system public action handler. Engine will find the handler for the actionName in register pool.
  ///注册系统action句柄到注册池里，引擎将通过actionName在注册池里找到相应的句柄
  static registerSysPublicActionHandlers() {
    if (YZDynamicCommon.isPageExitHandlersMounted) return;
    YZDynamicCommon.isPageExitHandlersMounted = true;

    for (Object item in yzAllDynamicExitHandlers) {
      YZDynamicCommon.reginsterPublicActionHandler(item);
    }
  }

  ///It should register public action handler, Because flutter don't support reflect,
  ///扩展注册public action的句柄，当用户自定义public action时需要注册才能被dsl配置识别
  static reginsterPublicActionHandler(YZDynamicActionHandler handler) {
    if (handler == null) return;

    assert(_publicActionHandlers[handler.actionName] == null,
        'Warning: There is a handle in pool with the same name!');
    _publicActionHandlers[handler.actionName] = handler;
  }

  ///获取所有表单元素内容
  ///Get all page widget value
  static List<YZDynamicPageResult> getAllWidgetValues(BuildContext context) {
    return YZDynamicBasePage.getAllWidgetValues(context);
  }

  ///解析一段代码的值，可以是不同类型的值，常量、变量、code、action/``/
  ///analysis the given value, supporting constant/variable/code/action/``
  ///num/int/double/String/bool/List/Map/ regard as action:xxx
  static String analysisValue(String valueBody,
      {State state, BuildContext context, Map localVariables}) {
    String trimValueBody = valueBody.trim();
    return YZDynamicVariableUtil.getValueOfVariable(trimValueBody,
        state: state, context: context, localVariables: localVariables);
  }

  ///adapt dsl edgeInset to the flutter EdgeInsets [left, top, right, bottom]或left, top, right, bottom
  static EdgeInsets edgeInsetAdapter(dynamic edgeInsetRaW) {
    EdgeInsets edgeInset;
    if (edgeInsetRaW == null || edgeInsetRaW.isEmpty) {
      return null;
    }

    List edgeInsetList;
    if (edgeInsetRaW is String) {
      if (edgeInsetRaW.startsWith('[')) {
        edgeInsetList = jsonDecode(edgeInsetRaW);
      } else {
        List l = edgeInsetRaW?.trim()?.split(',');
        edgeInsetList = l;
        print('Error: edgeInset format is not valided');
        return null;
      }
    } else if (edgeInsetRaW is List) {
      edgeInsetList = edgeInsetRaW;
    } else if (edgeInsetRaW is Map) {
      edgeInsetList = [
        edgeInsetRaW['left'] ?? 0,
        edgeInsetRaW['top'] ?? 0,
        edgeInsetRaW['right'] ?? 0,
        edgeInsetRaW['bottom'] ?? 0
      ];
    } else {
      print('Error: edgeInset format is not valided');
      return null;
    }

    int length = edgeInsetList.length;
    if (length < 4) {
      for (var i = length; i < 4; i++) {
        edgeInsetList[i] = 0;
      }
    }

    edgeInset = EdgeInsets.fromLTRB(
        YZDynamicCommon.parseDouble(edgeInsetList[0]),
        YZDynamicCommon.parseDouble(edgeInsetList[1]),
        YZDynamicCommon.parseDouble(edgeInsetList[2]),
        YZDynamicCommon.parseDouble(edgeInsetList[3]));

    return edgeInset;
  }

  static double parseDouble(dynamic v) {
    if (v == null) return null;
    num _v = v as num;
    return _v.toDouble();
  }

  static int parseInt(dynamic v) {
    if (v == null) return null;
    num _v = v as num;
    return _v.toInt();
  }

  static Map dynamicToMap(dynamic raw) {
    Map resultMap;
    if (raw != null) {
      if (raw is Map) {
        resultMap = raw;
      } else if ((raw is String) && raw.startsWith('{')) {
        resultMap = json.decode(raw);
      }
    }
    if (resultMap != null && resultMap['widgetName'] != null) {
      String type = resultMap['props']['type'];
      resultMap = resultMap['props'];
      resultMap['type'] = type;
    }
    return resultMap;
  }

  static List dynamicToList(dynamic raw) {
    if (raw != null) {
      if (raw is List) {
        return raw;
      } else if ((raw is String) && raw.startsWith('[')) {
        return json.decode(raw);
      }
    }
    return null;
  }
}
