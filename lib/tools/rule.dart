/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-28 14:08:10 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-10-28 23:23:42
 */

import 'package:flutter/material.dart';
import '../pages/basic/page.dart';
import 'code.dart';
import 'variable.dart';
import 'network.dart';

const _YZDynamicRuleTag = 'rule:';

class YZDynamicRuleUtil {

  YZDynamicRuleUtil._();

  /// 支持简写格式(code)：rule:targetKey|reg|tip->returnVariable|
  /// Support simple format(code): rule:targetKey|reg|tip->returnVariable|
  static bool validate(        
    List<YZDynamicActionRule?>? rules,     
    {
      String? value, 
      State? state,
      Function(int?, String?)? callback
    }
  ) {

    if (rules != null && (rules is List)) {
      for (var i = 0; i < rules.length; i++) {
        var rule = rules[i];
        if (rule?.reg == null) return true;

        //临时方案，简写放在reg字段里了
        if (rule!.reg!.startsWith(_YZDynamicRuleTag)) {
          rule = anylizeCodeRule(rule.reg);
        } else if (YZDynamicCodeUtil.isCode(rule.reg)) {
          bool ret = YZDynamicCodeUtil.execute(rule.reg, state: state);
          if (!ret) {
            return false;
          } else {
            continue;
          }
        }        

        if (rule!.targetKey != null && rule.targetKey!.isNotEmpty) {
          assert(state != null, "Error: context con't be null");
          if (state != null) {
            value = YZDynamicBasePage.getVariable(state.context, rule.targetKey, type:YZDynamicVariableType.widget);
          }          
        }

        RegExp regExp = RegExp(rule.reg!);
        bool isMatch = regExp.hasMatch(value??'');
        if (isMatch != true) {
          if (callback != null) {
            callback(i, rule.tip);
          }
          return false;
        }        
      }            
    } 

    return true;
  }

  static YZDynamicActionRule? anylizeCodeRule(String? codeRule, {State? state, Map? localVariables}) {

    if (codeRule == null) return null;

    codeRule = codeRule.replaceAll(RegExp(r"\s"), '');
    if (codeRule.length <= _YZDynamicRuleTag.length) return null;

    String ruleStrRaw= codeRule.substring(_YZDynamicRuleTag.length);
    YZDynamicActionRule rule = YZDynamicActionRule();

    List regArr = ruleStrRaw.split('|');
    if (regArr.length >= 4) {
      rule.targetKey = regArr[0];
      rule.reg = regArr[1];
      rule.tip = regArr[2];
      rule.returnVariable = regArr[3];
    } else if (regArr.length >= 3) {
      rule.targetKey = regArr[0];
      rule.reg = regArr[1];
      rule.tip = regArr[2];
    } else if (regArr.length >= 2){
      rule.targetKey = regArr[0];
      rule.reg = regArr[1];
    }

    return rule;
  }

}

class  YZDynamicActionRule {
  String? targetKey;
  String? name;
  String? reg;
  String? tip;
  YZDynamicRequest? request;
  String? code;
  String? returnVariable;

   YZDynamicActionRule({this.targetKey, this.name, this.reg, this.tip, this.request, this.code, this.returnVariable});

   YZDynamicActionRule.fromJson(Map<dynamic, dynamic> json) {
    targetKey = json['targetKey'];
    name = json['name'];
    reg = json['reg'];
    tip = json['tip'];
    request = json['request'] != null ? new YZDynamicRequest.fromJson(json['request']) : null;
    code = json['code'];
    returnVariable = json['returnVariable'];
  }

}