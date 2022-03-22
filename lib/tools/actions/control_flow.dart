/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-19 13:56:52 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-19 15:03:06
 */

import 'package:flutter/material.dart';

import '../action.dart';
import '../code.dart';
import '../network.dart';
import '../rule.dart';
import '../variable.dart';

/// params format
/// {"ifs" : [{"if":"", "block":""}], "else" : ""}
class YZIfElseHandler extends YZDynamicPublicActionHandler{
  @override
  dynamic action(BuildContext? context, {
      Map? params, 
      YZDynamicRequest? request,
      List<YZDynamicActionRule>? rules,
      Map? localVariables,
      State? state,
    }) {
      if (params == null) return;
      
      String? codeBlock;    

      dynamic cases = params['ifs'];  
      bool isCase = false;
      if (cases != null && (cases is List)) {
        for (var item in cases) {
          dynamic ifcondiction = YZDynamicVariableUtil.getValueOfVariable(item['if'], state: state, localVariables: localVariables);
          if ((ifcondiction is bool) && ifcondiction) {
            isCase = true;
            codeBlock = item['block'];
          }
        }
      }

      if (!isCase) {
        codeBlock = params['else'];
      }

      if (codeBlock != null) {
        dynamic result;
        if (YZDynamicCodeUtil.isCodeAction(codeBlock)) {
          result = YZDynamicCodeUtil.execute(codeBlock, state: state, localVariables: localVariables);        
        } 
        if (result != null) return result;         
      }     
  }

  @override
  String get actionName => 'Sys.ifElse';

}

/// params format
/// {"switch" : "Condition", "cases" : [{"case":"", "block":""}], "default" : ""}
class YZSwitchCaseHandler extends YZDynamicPublicActionHandler{
  @override
  dynamic action(BuildContext? context, {
      Map? params, 
      YZDynamicRequest? request,
      List<YZDynamicActionRule>? rules,
      Map? localVariables,
      State? state,
    }) {
      if (params == null) return;
      dynamic condition = params['switch'];

      String? codeBlock;    

      dynamic cases = params['cases'];  
      bool isCase = false;
      if (cases != null && (cases is List)) {
        for (var item in cases) {
          dynamic _case = YZDynamicVariableUtil.getValueOfVariable(item['case'], state: state, localVariables: localVariables);
          if (condition == _case) {
            isCase = true;
            codeBlock = item['block'];
          }
        }
      }

      if (!isCase) {
        codeBlock = params['default'];
      }

      if (codeBlock != null) {
        dynamic result;
        if (YZDynamicCodeUtil.isCodeAction(codeBlock)) {
          result = YZDynamicCodeUtil.execute(codeBlock, state: state, localVariables: localVariables);        
        } 
        if (result != null) return result;         
      }      
  }

  @override
  String get actionName => 'Sys.switchCase';

}

/// params format
/// {"i" : "", "length" : "", "step" : ""}
class YZForLoopHandler extends YZDynamicPublicActionHandler{
  @override
  dynamic action(BuildContext? context, {
      Map? params, 
      YZDynamicRequest? request,
      List<YZDynamicActionRule>? rules,
      Map? localVariables,
      State? state,
    }) {
      if (params == null) return;

      String ivar = params['ivar'];

      int ivalue = (params['ivalue'] is int)? params['ivalue'] : int.tryParse(params['ivalue']) ?? 0;

      int length = (params['length'] is int)? params['length'] : int.tryParse(params['length']) ?? 0;

      int step = (params['step'] is int)? params['step'] : (int.tryParse(params['step'] ?? '') ?? 1);

      String? codeBlock = params['block'];

      dynamic result;
      if (codeBlock != null && YZDynamicCodeUtil.isCodeAction(codeBlock)) {
        for (int index = ivalue; index < length; index += step) { 
          YZDynamicVariableUtil.assignmentVariable('<c:$ivar>=$index', state: state, localVariables: localVariables);        
          result = YZDynamicCodeUtil.execute(codeBlock, state: state, localVariables: localVariables);        
        }        
      }  
      return result;             
  }

  @override
  String get actionName => 'Sys.forLoop';

}

class YZWhileHandler extends YZDynamicPublicActionHandler{
  @override
  dynamic action(BuildContext? context, {
      Map? params, 
      YZDynamicRequest? request,
      List<YZDynamicActionRule>? rules,
      Map? localVariables,
      State? state,
    }) {
      if (params == null) return;

      String? condition = params['condition'];
      String? codeBlock = params['block'];

      dynamic result;
      if (codeBlock != null && YZDynamicCodeUtil.isCodeAction(codeBlock)) {
        bool isContinue = YZDynamicCodeUtil.execute(condition, state: state, localVariables: localVariables) ?? false; 
        while (isContinue) {                  
          result = YZDynamicCodeUtil.execute(codeBlock, state: state, localVariables: localVariables);
          isContinue = YZDynamicCodeUtil.execute(condition, state: state, localVariables: localVariables);         
        }        
      }  
      return result;             
  }

  @override
  String get actionName => 'Sys.while';

}