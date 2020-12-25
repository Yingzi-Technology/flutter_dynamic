/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-20 11:27:13 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-01 13:59:57
 */

import 'package:flutter/material.dart';
import '../pages/basic/page.dart';
import 'action.dart';
import 'code.dart';
import 'common.dart';

//Global variable tag
const _YZGlobalVariablePlaceholder = r"(?:var:)?<g:([A-Za-z0-9_.]+)>";
//Page variable tag
const _YZPageVariablePlaceholder = r"(?:var:)?<p:([A-Za-z0-9_.]+)>";
//widget variable tag
const _YZWidgetVariablePlaceholder = r"(?:var:)?<w:([A-Za-z0-9_.]+)>";
//function/action variable tag
const _YZLocalVariablePlaceholder = r"(?:var:)?<c:([A-Za-z0-9_.]+)>";

//variable dot link format
const _YZDynamicVariableDotLink = ".";

/// 以var:开头的字符串被认为整个是Function作用域变量占位符<cope:xxx>=value
/// Regard as function scope placeholder when the string is begin with var:
const _YZDynamicVariablePrefix = "var:";
const _YZDynamicVariableTag = r"(var:)|(<\w:)";

const _YZDynamicStressMarkTag = r"`";

class YZDynamicVariableUtil {
  YZDynamicVariableUtil._();

  static bool isVariable(String raw) {
    if (raw == null || !(raw is String)) return false;
    return raw.trim().startsWith(RegExp(_YZDynamicVariableTag));
  }

  static bool isStressMarkString(String raw) {
    if (raw == null || !(raw is String)) return false;
    return raw.trim().startsWith(RegExp(_YZDynamicStressMarkTag));
  }

  /// 转换有变量占位符的字符串，支持<scope:object.object.xxx}
  /// Contvert the string with variable marked by <scope:object.object.xxx>
  static String convertStringWithVariablePatten(     
    String rawString, 
    {
      BuildContext context,      
      Map localVariables
    }) {
    String newString = rawString;

    if (context != null) {
      // Extract global variable with <g:xxx.xxx>
      RegExp expGlobal = new RegExp(_YZGlobalVariablePlaceholder);    
      Iterable<Match> matchesGlobal = expGlobal.allMatches(rawString);
      for (Match m in matchesGlobal) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic value;
        dynamic ret;
        for (var i = 0; i < subvariables.length; i++) {
          String subvar = subvariables[i];          
          if (i == 0) {
            ret = YZDynamicCommon.getGlobalVariable(subvar);
          } else {
            ret = ret[subvar];
          } 
          if (ret != null && (ret is Map)) {            
            continue;
          } else {
            value = ret;
            break;
          }     
        } 
        if (value == null) value = ''; 

        String replace = m.group(0);    
        if ((value is String) || (value is num)) {
          newString = newString.replaceAll(replace, value.toString());
        }        
      }

      // Extract page variable with <p:xxx.xxx>
      RegExp exp = new RegExp(_YZPageVariablePlaceholder);    
      Iterable<Match> matches = exp.allMatches(rawString);
      for (Match m in matches) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic value;
        dynamic ret;
        for (var i = 0; i < subvariables.length; i++) {
          String subvar = subvariables[i];          
          if (i == 0) {
            ret = YZDynamicBasePage.getVariable(context, subvar); 
          } else {
            ret = ret[subvar];
          } 
          if (ret != null && (ret is Map)) {            
            continue;
          } else {
            value = ret;
            break;
          }     
        } 
        if (value == null) value = ''; 

        String replace = m.group(0);    
        if ((value is String) || (value is num)) {
          newString = newString.replaceAll(replace, value.toString());
        }        
      }

      // Extract widget variable with <w:xxx.xxx>
      RegExp exp2 = new RegExp(_YZWidgetVariablePlaceholder);    
      Iterable<Match> matches2 = exp2.allMatches(rawString);
      for (Match m in matches2) {
        String variable = m.group(1);
    
        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic value;
        dynamic ret;
        if (subvariables.length == 1) {
          value = YZDynamicBasePage.getVariable(context, subvariables[0], type: YZDynamicVariableType.widget); 
        } else {
          for (var i = 0; i < subvariables.length; i++) {
            String subvar = subvariables[i];          
            if (i == 0) {
              ret = YZDynamicBasePage.getVariable(context, subvar, type: YZDynamicVariableType.widgetProperties); 
            } else {
              ret = ret[subvar];
            } 
            if (ret != null && (ret is Map)) {            
              continue;
            } else {
              value = ret;
              break;
            }     
          }
        }

        if (value == null) value = ''; 

        String replace = m.group(0);  
        if ((value is String) || (value is num)) {    
          newString = newString.replaceAll(replace, value.toString());
        }
        
      }       
    } 

    if (localVariables != null) {
      // Extract page variable with <c:xxx.xxx>
      RegExp exp3 = new RegExp(_YZLocalVariablePlaceholder);    
      Iterable<Match> matches3 = exp3.allMatches(rawString);
      for (Match m in matches3) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic value;
        dynamic ret;
        for (var i = 0; i < subvariables.length; i++) {
          String subvar = subvariables[i];          
          if (i == 0) {
            ret = localVariables[subvar]; 
          } else {
            ret = ret[subvar];
          } 
          if (ret != null && (ret is Map)) {            
            continue;
          } else {
            value = ret;
            break;
          }     
        } 
        if (value == null) value = ''; 

        String replace = m.group(0);    
        if ((value is String) || (value is num)) {
          newString = newString.replaceAll(replace, value.toString());
        }        
        
      }      
    }       

    return newString;
  }  
  
  /// 获取有变量占位符的字符串，支持<scope:object.object.xxx>
  /// Get the string with variable marked by <scope:object.object.xxx>
  static dynamic getObjectWithVariablePatten(     
    String rawString, 
    {       
      State state,
      Map localVariables
    }) {
    dynamic value;
    String variableName;

    rawString = rawString.trim();
    if(rawString.startsWith(_YZDynamicVariablePrefix)) {
      if (rawString.length <= _YZDynamicVariablePrefix.length) return value; 
      variableName = rawString.substring(_YZDynamicVariablePrefix.length);
    } else {
      variableName = rawString;
    }

    if (state != null) {
      // Extract global variable with <g:xxx.xxx>
      RegExp expGlobal = new RegExp(_YZGlobalVariablePlaceholder);    
      Iterable<Match> matchesGlobal = expGlobal.allMatches(variableName);
      for (Match m in matchesGlobal) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic ret;
        for (var i = 0; i < subvariables.length; i++) {
          String subvar = subvariables[i];          
          if (i == 0) {
            ret = YZDynamicCommon.getGlobalVariable(subvar);
          } else {
            ret = ret[subvar];
          } 

          if (ret != null && (ret is Map)) {            
            continue;
          } else {
            break;
          }     
        } 

        if (ret != null) value = ret; 
        
      }

      // Extract page variable with <p:xxx.xxx>
      RegExp exp = new RegExp(_YZPageVariablePlaceholder);    
      Iterable<Match> matches = exp.allMatches(variableName);
      for (Match m in matches) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic ret;
        for (var i = 0; i < subvariables.length; i++) {
          String subvar = subvariables[i];          
          if (i == 0) {
            ret = YZDynamicBasePage.getVariable(state?.context, subvar, state: state); 
          } else {
            ret = ret[subvar];
          } 

          if (ret != null && (ret is Map)) {            
            continue;
          } else {
            break;
          }     
        } 

        if (ret != null) value = ret; 
        
      }

      // Extract widget variable with <w:xxx.xxx>
      RegExp exp2 = new RegExp(_YZWidgetVariablePlaceholder);    
      Iterable<Match> matches2 = exp2.allMatches(variableName);
      for (Match m in matches2) {
        String variable = m.group(1);
    
        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic ret;
        if (subvariables.length == 1) {
          ret = YZDynamicBasePage.getVariable(state?.context, subvariables[0], type:YZDynamicVariableType.widget); 
        } else {
          for (var i = 0; i < subvariables.length; i++) {
            String subvar = subvariables[i];          
            if (i == 0) {
              ret = YZDynamicBasePage.getVariable(state?.context, subvar, type:YZDynamicVariableType.widgetProperties); 
            } else {
              ret = ret[subvar];
            } 
            if (ret != null && (ret is Map)) {            
              continue;
            } else {
              break;
            }     
          }
        }

        if (ret != null) value = ret; 
        
      }       
    }  

    if (localVariables != null) {
      // Extract page variable with <c:xxx.xxx>
      RegExp exp3 = new RegExp(_YZLocalVariablePlaceholder);    
      Iterable<Match> matches3 = exp3.allMatches(variableName);
      for (Match m in matches3) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        dynamic ret;
        for (var i = 0; i < subvariables.length; i++) {
          String subvar = subvariables[i];          
          if (i == 0) {
            ret = localVariables[subvar]; 
          } else {
            ret = ret[subvar];
          } 

          if (ret != null && (ret is Map)) {            
            continue;
          } else {
            break;
          }     
        } 

        if (ret != null) value = ret; 
        
      }      
    }      

    return value;
  }

  ///处理变量赋值 var:<scope:variableName>=value
  ///assign value to variable
  static void assignmentVariable(
    String rawString,
    { 
      State state,       
      BuildContext context,
      Map localVariables
    }) {
      if (!YZDynamicVariableUtil.isVariable(rawString)) return;
      List<String> splitArr = rawString.split('=');
      if (splitArr.length < 2 || splitArr[1].isEmpty) return; 

      context ??= state?.context;
      String nameBody = splitArr[0].trim();
      String key;
      String valueBody = splitArr.sublist(1).join('=');

      if (nameBody.startsWith(_YZDynamicVariablePrefix)) {
        key = nameBody.substring(_YZDynamicVariablePrefix.length);
      } else {
        key = nameBody;
      }

      dynamic value = YZDynamicVariableUtil.getValueOfVariable(valueBody, state: state, context: context, localVariables: localVariables);

      setObjectWithVariablePatten(key, value, context: context, localVariables: localVariables);
  }  

  ///获取将要赋给变量的不同类型的值，常量、变量、code、action/``/
  ///Get value will assign to variable, supporting constant/variable/code/action/``
  ///num/int/double/String/bool/List/Map/ regard as action:xxx
  static dynamic getValueOfVariable(
    String valueBody,
    { 
      State state, 
      BuildContext context,     
      Map localVariables
    }) {
      dynamic value;

      context ??= state.context;
      if (YZDynamicVariableUtil.isVariable(valueBody)) {
        value = YZDynamicVariableUtil.getObjectWithVariablePatten(valueBody, state: state, localVariables: localVariables);
      } else if (YZDynamicCodeUtil.isCode(valueBody)) {

        value = YZDynamicCodeUtil.execute(valueBody, state: state, localVariables: localVariables);
        
      } else if (YZDynamicActionTool.isAction(valueBody)) {

        YZDynamicActionConfig action = YZDynamicActionTool.anylizeAction(valueBody, state:state, localVariables: localVariables);            
        value = YZDynamicActionTool.triggerActions(state, [action], context: context, localVariables: localVariables);

      } else if (YZDynamicVariableUtil.isStressMarkString(valueBody)) {

        valueBody = valueBody.replaceAll(_YZDynamicStressMarkTag, '');
        value = YZDynamicVariableUtil.convertStringWithVariablePatten(valueBody, context:state?.context, localVariables: localVariables);   

      } else if (YZDynamicActionTool.isKeyAction(valueBody)) {

        YZDynamicActionConfig action = YZDynamicActionTool.anylizeAction(valueBody, state:state, localVariables: localVariables);            
        value = YZDynamicActionTool.triggerActions(state, [action], context: context, localVariables: localVariables); 
               
      } else {
        value = valueBody;
      }

      return value;
  }  

  /// 设置变量占位符的值，key支持<scope:object.object.xxx>。如果还没有定义变量则创建一个Map
  /// Set the value of variable of key <scope:object.object.xxx>. Generate a map if the variable is not defined.
  static void setObjectWithVariablePatten(     
    String key, dynamic assinment, 
    {       
      BuildContext context,
      Map localVariables,
    }) {
    String variableName = key;

    if(key.startsWith(_YZDynamicVariablePrefix)) {
      if (key.length <= _YZDynamicVariablePrefix.length) return; 
      variableName = key.substring(_YZDynamicVariablePrefix.length);
    }

    // Extract global variable with <g:xxx.xxx>
    RegExp expGlobal = new RegExp(_YZGlobalVariablePlaceholder);    
    Iterable<Match> matchesGlobal = expGlobal.allMatches(variableName);
    for (Match m in matchesGlobal) {
      String variable = m.group(1);

      List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
      YZDynamicCommon.setGlobalVariable(subvariables, assinment);
    }
    //stop
    if (matchesGlobal != null && matchesGlobal.isNotEmpty) {
      return;
    }    

    if (context != null) {
      // Extract page variable with <p:xxx.xxx>
      RegExp exp = new RegExp(_YZPageVariablePlaceholder);    
      Iterable<Match> matches = exp.allMatches(variableName);
      for (Match m in matches) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);
        YZDynamicBasePage.setVariable(context, subvariables, assinment);
      }
      //stop
      if (matches != null && matches.isNotEmpty) {
        return;
      }

      // Extract widget variable with <w:xxx.xxx>
      RegExp exp2 = new RegExp(_YZWidgetVariablePlaceholder);    
      Iterable<Match> matches2 = exp2.allMatches(variableName);
      for (Match m in matches2) {
        String variable = m.group(1);
    
        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);        
 
        if (subvariables.length == 1) {
          YZDynamicBasePage.setVariable(context, subvariables, assinment, YZDynamicVariableType.widget);
        } else {
          YZDynamicBasePage.setVariable(context, subvariables, assinment, YZDynamicVariableType.widgetProperties);
        }
        
      }   

      //stop
      if (matches2 != null && matches2.isNotEmpty) {
        return;
      }    
    }  

    if (localVariables != null) {
      Map _variables = localVariables;

      // Extract page variable with <c:xxx.xxx>
      RegExp exp3 = new RegExp(_YZLocalVariablePlaceholder);    
      Iterable<Match> matches3 = exp3.allMatches(variableName);
      for (Match m in matches3) {
        String variable = m.group(1);

        List<String> subvariables = variable.split(_YZDynamicVariableDotLink);

        int len = subvariables.length;
        for (var i = 0; i < len; i++) {
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

      if (matches3 != null && matches3.isNotEmpty) {
        return;
      }           
    }      

  }      

}

class YZDynamicVariable {

  /// Only support [A-Za-z0-9_.] format
  String name;

  dynamic value;

  YZDynamicVariable({this.name, this.value});

}

enum YZDynamicVariableType {
  /// 在dsl描述文件中用<scope:variableName>包裹标识的变量
  /// Marked by <p:> in dsl
  page, 
  /// 在dsl描述文件中用<w:}包裹标识的变量，返回widget的value变量
  /// Marked by <w:> in dsl，return value of widget
  widget, 
  /// 在dsl描述文件中用<w:}包裹标识的变量，返回widget的extra变量
  /// Marked by <w:> in dsl，return properties of widget
  widgetProperties,
}