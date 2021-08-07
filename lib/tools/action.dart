/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-19 11:36:28 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-01 14:34:32
 * @desc 存放系统定义公共的actions，支持外部扩展
 */

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/tools/actions/iterable.dart';
import '../widgets/basic/widget.dart';
import '../pages/basic/page.dart';
import 'actions/control_flow.dart';
import 'common.dart';

part 'actions/core.dart';
part 'actions/list.dart';
part 'actions/regexp.dart';
part 'actions/router.dart';
part 'actions/string.dart';
part 'actions/math.dart';
part 'actions/number.dart';
part 'actions/all.dart';
part 'actions/map.dart';
part 'actions/set.dart';

const _YZDynamicActionTag = 'action:';
const _YZDynamicActionBraceTag = '{';
const _YZDynamicActionSchemeTag = 'scheme/';
const _YZDynamicKeyActionTag = r"num|int|double|String|bool|List|Map|Set|Sys";
const _YZDynamicUserCodeActionTag = 'userCode:';

typedef YZDynamicActionFunction = Function(
  BuildContext triggerContext, 
  {
  // Widget value
  // Widget properties
  Map params,
  YZDynamicRequest request,
  List<YZDynamicActionRule> rules,
  Map localVariables, // Function scope variable
  State state,
});

///
/// The abstract class is for action.
///
enum YZDynamicActionHandlerType {
  action, //Handler excute action
  func, //Handler excute func
  userCode, //Handler excute userCode
}

abstract class YZDynamicActionHandler {
  // The action, The same as YZDynamicActionFunction
  dynamic action(
    BuildContext triggerContext, {
    Map params,
    YZDynamicRequest request,
    List<YZDynamicActionRule> rules,
    Map localVariables,
    State state,
  });

  // The func. A simple action
  dynamic func(Map params);

  // The userCode.
  dynamic userCode(
    BuildContext triggerContext, {
    String userCode,
    Map localVariables,
    State state,
  });

  dynamic execute(
    BuildContext context, {
    Map params,
    String userCode,
    YZDynamicRequest request,
    List<YZDynamicActionRule> rules,
    Map localVariables,
    State state,
  }) {
    if (actionType == YZDynamicActionHandlerType.action) {
      return this.action(
        context,
        params: params,
        request: request,
        rules: rules,
        localVariables: localVariables,
        state: state,
      );
    } else if (actionType == YZDynamicActionHandlerType.userCode) {
      return this.userCode(
        context,
        userCode: userCode,
        localVariables: localVariables,
        state: state,
      );
    } else {
      return this.func(params);
    }
  }

  // The handler name
  YZDynamicActionHandlerType get actionType;

  // The action name
  String get actionName;
}

// Define public action
abstract class YZDynamicPublicActionHandler extends YZDynamicActionHandler {
  @override
  dynamic func(Map params) {}

  @override
  dynamic userCode(
    BuildContext context, {
    String userCode,
    Map localVariables,
    State state,
  }) {}

  @override
  YZDynamicActionHandlerType get actionType =>
      YZDynamicActionHandlerType.action;
}

// Define the action passing to page
class YZDynamicPageActionHandler extends YZDynamicPublicActionHandler {

  final YZDynamicActionFunction entryAction;
  final String entryActionName;

  YZDynamicPageActionHandler({
    this.entryAction,
    this.entryActionName,
  });

  @override
  action(BuildContext triggerContext, {Map params, YZDynamicRequest request, List<YZDynamicActionRule> rules, Map localVariables, State<StatefulWidget> state}) {
    return entryAction(
      triggerContext, 
      params: params,
      request: request,
      rules: rules,
      localVariables: localVariables,
      state: state
    );
  }

  @override
  String get actionName => entryActionName;

}

// Define system action
abstract class YZDynamicSysActionHandler extends YZDynamicActionHandler {
  @override
  dynamic userCode(
    BuildContext context, {
    String userCode,
    Map localVariables,
    State state,
  }) {}

  @override
  dynamic action(
    BuildContext context, {
    Map params,
    YZDynamicRequest request,
    List<YZDynamicActionRule> rules,
    Map localVariables,
    State state,
  }) {}

  @override
  YZDynamicActionHandlerType get actionType => YZDynamicActionHandlerType.func;
}

abstract class YZDynamicUserActionHandler extends YZDynamicActionHandler {
  @override
  dynamic func(Map params) {}

  @override
  dynamic action(
    BuildContext context, {
    Map params,
    YZDynamicRequest request,
    List<YZDynamicActionRule> rules,
    Map localVariables,
    State state,
  }) {}

  @override
  YZDynamicActionHandlerType get actionType =>
      YZDynamicActionHandlerType.userCode;

  @override
  String get actionName => _YZDynamicUserCodeActionTag;
}

enum YZDynamicWidgetActionType { handler, target }

class YZDynamicActionTool {
  YZDynamicActionTool._();

  static bool isAction(String action) {
    if (action != null && action.trim().startsWith(_YZDynamicActionTag))
      return true;
    return false;
  }

  static bool isKeyAction(String action) {
    if (action != null &&
        action.trim().startsWith(RegExp(_YZDynamicKeyActionTag))) return true;
    return false;
  }

  /// 分析code里的action，比如给action里的变量占位符赋值等。Action有两种形式，一种是json配置形式，另一种是 handlerVariable({params})->returnVariable
  /// Anylize code action, such as assign value to variable. There are two action formats as json config and handlerVariable({params})->returnVariable
  /// params支持多个actions，用逗号分隔
  /// The params support multi-actions using comma separated.
  static YZDynamicActionConfig anylizeAction(String actionStr,
      {State state, Map localVariables}) {
    if (actionStr == null) return null;

    actionStr = actionStr.trim();

    String actionStrRaw;
    if (actionStr.startsWith(_YZDynamicActionTag)) {
      actionStrRaw = actionStr.substring(_YZDynamicActionTag.length);
    } else {
      actionStrRaw = actionStr;
    }

    YZDynamicActionConfig action;
    if (actionStrRaw.startsWith(_YZDynamicActionBraceTag)) {
      action = YZDynamicActionConfig.fromJson(
          jsonDecode(actionStrRaw.replaceAll('\\', '')));
    } else if (actionStrRaw.startsWith(_YZDynamicActionSchemeTag)) {
      action = YZDynamicActionConfig.fromScheme(actionStrRaw);
    } else {
      action = YZDynamicActionConfig.fromFun(actionStrRaw);
    }

    return action;
  }

  ///解析参数结果值，参数值支持的类型包括：常量、action、code
  ///Anylize param's result which support constent/action/code
  ///triggerAction 前的预解释处理
  ///由于参数里有可能存在伪代码，所以不支持convertStringWithVariablePatten预解释文本
  static void anylizeParams(Map params, {State state, Map localVariables}) {
    params?.updateAll((key, value) {
      if (!(value is String)) return value;

      if (YZDynamicVariableUtil.isVariable(value)) {
        String placeholder = value;
        dynamic result = YZDynamicVariableUtil.getObjectWithVariablePatten(
            placeholder,
            state: state,
            localVariables: localVariables);
        return result;
      } else if (YZDynamicCodeUtil.isCode(value)) {
        dynamic result = YZDynamicCodeUtil.execute(value, state: state);

        return result;
      } else if (YZDynamicActionTool.isAction(value) ||
          YZDynamicActionTool.isKeyAction(value)) {
        YZDynamicActionConfig action = YZDynamicActionTool.anylizeAction(value,
            state: state, localVariables: localVariables);

        dynamic result = YZDynamicActionTool.triggerActions(state, [action],
            localVariables: localVariables);
        if (result != null && action.returnVariable != null) {
          localVariables[action.returnVariable] = result;
        }
        return result;
      }

      return value;
    });
  }

  //获取简单属性actions对应的actions，action有3个来源：控件本身、别的控件、公共区域
  //Get actions corresponding to the actions with simple properties. There are three source: Self DynamicWidget/Other DynamicWidget in page/Public DynamicWidget
  static List<YZDynamicActionConfig> getActionsOfSimpleActions(
      List<YZDynamicActionConfig> simpleActions,
      Map<String, YZDynamicActionConfig> xActions,
      [BuildContext context]) {
    List<YZDynamicActionConfig> actions = [];

    for (var m in simpleActions) {
      // execute code primarily
      String code = m.code;
      if (code != null && code.isNotEmpty) {
        actions.add(m);
        continue;
      }

      //如果是target action
      //If target action of full config
      if (m.targetKey != null && m.targetKey.isNotEmpty) {
        String targetKey = m.targetKey;
        YZDynamicWidgetBasicState targetState =
            YZDynamicBasePage.widgetStateOf(context, targetKey);
        if (targetState == null) return null;

        YZDynamicActionConfig act = targetState.actions[m.name];
        if (act != null) {
          //如果配置里有参数或请求配置，则重新生成一份action实例
          //Initialize a new instance if config action has params or request
          if (m.params != null || m.request != null) {
            actions.add(m.fillFrom(act));
          } else {
            actions.add(act);
          }
          continue;
        }

        //从页面上查找
        //Find action of full config in page
        YZDynamicActionConfig pageAct =
            YZDynamicBasePage.pageActionOf(context, m.name, targetKey);
        if (pageAct != null) {
          if (m.params != null || m.request != null) {
            actions.add(m.fillFrom(pageAct));
          } else {
            actions.add(pageAct);
          }
          continue;
        }
      } else {
        //如果是handle action
        //If handle action

        //从本身查找
        //Find in self
        if (xActions != null) {
          YZDynamicActionConfig act = xActions[m.name];
          if (act != null) {
            if (m.params != null || m.request != null) {
              actions.add(m.fillFrom(act));
            } else {
              actions.add(act);
            }
            continue;
          }
        }

        //从页面上查找
        //Find in page
        YZDynamicActionConfig pageAct =
            YZDynamicBasePage.pageActionOf(context, m.name);
        if (pageAct != null) {
          if (m.params != null || m.request != null) {
            actions.add(m.fillFrom(pageAct));
          } else {
            actions.add(pageAct);
          }
          continue;
        }

        //从公共区域查找
        //Find in global
        //不需要，因为触发action时会把页面和全局的同等对待，页面action优先

      }

      //如果都没有找到，则当成直接可以执行的simple config action
      //If not found, consider to be simple config action
      actions.add(m);
    }

    return actions;
  }

  //触发action并执行。返回最后一个action的值
  //Trigger action and run. Return the last action's result
  static dynamic triggerActions<T>(
      State state, List<YZDynamicActionConfig> actions,
      {BuildContext context, Map localVariables}) {
    dynamic retsult;

    if (actions != null && actions.isNotEmpty) {
      context ??= state?.context;

      for (YZDynamicActionConfig act in actions) {
        YZDynamicActionConfig m = act;
        anylizeParams(m?.params, state: state, localVariables: localVariables);

        // execute code primarily
        String code = m.code;
        if (code != null && code.isNotEmpty) {
          retsult = YZDynamicCodeUtil.execute(code, state: state);
          continue;
        }

        ///Find action private first, if not found, finding public
        ///先在本地查找action，如果没有查找到则到全局的地方查找
        if (m.targetKey != null && m.targetKey.isNotEmpty) {
          String targetKey = m.targetKey;
          YZDynamicWidgetBasicState targetState =
              YZDynamicBasePage.widgetStateOf(context, targetKey);
          String actionName = m.actionName;
          if (targetState?.actionFunctions != null &&
              targetState?.actionFunctions[actionName] != null) {
            retsult = targetState.actionFunctions[actionName](
              context,
              params: m.params,
              request: m.request,
              rules: m.rules,
              state: state,
              localVariables: localVariables,
            );

            if (m.returnVariable != null)
              localVariables[m.returnVariable] = retsult;
          }

          continue;
        }

        ///Find and run action in widget
        ///在本地查widget查找执行
        YZDynamicActionFunction actionFunc;
        if (state is YZDynamicWidgetBasicState) {
          String actionName = m.actionName;
          actionFunc = state.actionFunctions[actionName];
        }
        if (actionFunc != null) {
          retsult = actionFunc(
            context,
            params: m.params,
            request: m.request,
            rules: m.rules,
            state: state,
            localVariables: localVariables,
          );
          if (m.returnVariable != null)
            localVariables[m.returnVariable] = retsult;
          continue;
        }

        ///Find and run action in page
        ///在页面查找执行
        YZDynamicBaseState pageState = YZDynamicBasePage.of(context);
        String actionName = m.actionName;
        if (pageState == null && state is YZDynamicBaseState) {
          pageState = state;
        }
        if (pageState?.actionFunctions != null &&
            pageState?.actionFunctions[actionName] != null) {
          retsult = pageState.actionFunctions[actionName](
            context,
            params: m.params,
            request: m.request,
            rules: m.rules,
            state: state,
            localVariables: localVariables,
          );
          if (m.returnVariable != null)
            localVariables[m.returnVariable] = retsult;
          continue;
        }

        ///Find and run action in global
        ///在公共区域查找执行
        YZDynamicActionHandler handler =
            YZDynamicCommon.publicActionHandler(actionName);
        assert(
            handler != null, 'Error: The handler "$actionName" was not found!');
        if (handler != null) {
          retsult = handler?.execute(
            context,
            params: m.params,
            userCode: m.userCode,
            request: m.request,
            rules: m.rules,
            state: state,
            localVariables: localVariables,
          );
          if (m.returnVariable != null)
            localVariables[m.returnVariable] = retsult;
        }
      }
    }

    return retsult;
  }
}

/* 
* The action model
* @returnVariable 存放action执行后返回值的变量名/The variable assigning by the result of execution
* @handlerVariable 存放action句柄/The hanlder of action
*/
class YZDynamicActionConfig {
  YZDynamicWidgetActionType type; //公共的action还是组件的action，主要为了快速寻址
  String name; //dsl action name
  String actionName; //native actionName
  String targetKey; // action 绑定的对象，通常为组件
  String isAsync; //  是否异步，主要是为了声明方法调用是否需要回调
  YZDynamicRequest request; // 数据请求参数
  List<YZDynamicActionRule> rules; //校验规则参数，通常在方法开始时执行
  Map params; // 普通参数，支持request和rules
  String returnVariable; //action对应的funcion返回值存放的变量名
  String handlerVariable; //action的句柄，用于别的action对本action的调用
  String code; //code block
  String userCode; // user code

  YZDynamicActionConfig({
    this.type,
    this.name,
    this.actionName,
    this.targetKey,
    this.isAsync,
    this.request,
    this.rules,
    this.params,
    this.returnVariable,
    this.handlerVariable,
    this.code,
    this.userCode,
  });

  //从另一个对象补充属性值到本对象，不影响现有对象已存在的值
  //Fill properties from other instance to this without disturbing existed properties
  YZDynamicActionConfig fillFrom(YZDynamicActionConfig original) {
    if (this.type == null) this.type = original.type;
    if (this.name == null) this.name = original.name;
    if (this.actionName == null) this.actionName = original.actionName;
    if (this.targetKey == null) this.targetKey = original.targetKey;
    if (this.isAsync == null) this.isAsync = original.isAsync;
    if (this.request == null) this.request = original.request;
    if (this.rules == null) this.rules = original.rules;
    if (this.params == null) this.params = Map.from(original.params ?? {});
    if (this.returnVariable == null)
      this.returnVariable = original.returnVariable;
    if (this.handlerVariable == null)
      this.handlerVariable = original.handlerVariable;
    if (this.code == null) this.code = original.code;
    if (this.userCode == null) this.userCode = original.userCode;

    return this;
  }

  //action:{"targetKey":"", "actionName": "actionName", "params": {}}
  YZDynamicActionConfig.fromJson(Map<dynamic, dynamic> json) {
    if (json['type'] == 'handler') {
      type = YZDynamicWidgetActionType.handler;
    } else if (json['type'] == 'target') {
      type = YZDynamicWidgetActionType.target;
    }
    name = json['name'];
    actionName = json['actionName'];
    targetKey = json['targetKey'];
    isAsync = json['isAsync'] != null ? json['isAsync'].toString() : null;
    request = json['request'] != null
        ? new YZDynamicRequest.fromJson(json['request'])
        : null;
    if (json['rules'] != null) {
      rules = new List<YZDynamicActionRule>();
      json['rules'].forEach((v) {
        rules.add(new YZDynamicActionRule.fromJson(v));
      });
    }
    params = json['params'];
    returnVariable = json['returnVariable'];
    handlerVariable = json['handlerVariable'];
    code = json['code'];
  }

  ///action:scheme/actionName?key1=value&key2=value
  /// Having nothing to do with DSL, the name could be the same as actionName
  YZDynamicActionConfig.fromScheme(String actionStrRaw) {
    if (actionStrRaw.length <= _YZDynamicActionSchemeTag.length) return;

    String bodyStr;

    if (actionStrRaw.startsWith(_YZDynamicActionSchemeTag)) {
      bodyStr = actionStrRaw.substring(_YZDynamicActionSchemeTag.length);
    } else {
      bodyStr = actionStrRaw;
    }

    if (bodyStr.isNotEmpty) {
      List strThird = bodyStr.split('?');
      String actionName = strThird[0];
      this.name = actionName;
      this.actionName = actionName;
      this.params = {};
      if (strThird.length >= 2) {
        String paramRaw = strThird[1];
        List<String> params = paramRaw.split('&');
        params.forEach((kvStr) {
          List kvArr = kvStr.split('=');
          this.params[kvArr[0]] = kvArr[1];
        });
      }
    }
  }

  //1、action:actionName({"value": "", "value1": ""})->returnValue
  //2、action:actionName(value: value, value1: value1)->returnValue. PS: value: "value", then "" will be as content.
  //3、action:actionName(value, value1, value2)->returnValue. PS: trans to action:actionName({"0": "value", "1": "value1"})->returnValue
  // Having nothing to do with DSL, the name could be the same as actionName
  YZDynamicActionConfig.fromFun(String actionStrRaw) {
    List strFirst = actionStrRaw.split('->');
    String bodyStr;
    if (strFirst.length >= 2) {
      String returnV = strFirst[1];
      this.returnVariable = returnV.trim();
    }
    bodyStr = (strFirst[0] as String).trim();

    if (bodyStr.isNotEmpty) {
      int firstBracket = bodyStr.indexOf('(');
      int lastBracket = bodyStr.lastIndexOf(')');
      assert(firstBracket != -1 && lastBracket != -1,
          'The action fun format is not valided!');

      String _name = bodyStr.substring(0, firstBracket).trim();
      if (_name.startsWith('<w:')) {
        //targetKey
        int lIndex = _name.indexOf('>');
        this.targetKey = _name.substring(3, lIndex);
        _name = _name.substring(lIndex + 2);
      }
      this.name = _name;
      this.actionName = _name;
      assert(this.name.isNotEmpty, 'The action fun format is not valided!');

      String paramJson = bodyStr.substring(firstBracket + 1, lastBracket);
      if (paramJson.trim().isNotEmpty) {
        if (!paramJson.startsWith('{')) {
          var paramList = paramJson.split(',');
          this.params = {};
          for (var i = 0; i < paramList.length; i++) {
            var param = paramList[i];
            var kv = param.split(RegExp(r"((?<!(var|\<[pwc])):)"));
            if (kv.length < 2) {
              this.params[i] = kv[0];
              continue;
            }
            this.params[kv[0].trim()] = kv[1];
          }
        } else {
          this.params = json.decode(paramJson);
        }
      }
    }
  }
}
