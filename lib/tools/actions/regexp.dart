/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-29 12:05:18 
 * @Last Modified by:   yz.yujingzhou 
 * @Last Modified time: 2020-10-29 12:05:18  
 */

part of '../action.dart';

class YZRegExpHasMatchHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return false;

    String? pattern = params['pattern'];
    if (pattern == null) return false;

    String? value = params['value'];
    if (value == null) return false;

    RegExp regExp = RegExp(pattern);
    bool isMatch = regExp.hasMatch(value);
    return isMatch;    
  }

  @override
  String get actionName => 'RegExp.hasMatch';

}