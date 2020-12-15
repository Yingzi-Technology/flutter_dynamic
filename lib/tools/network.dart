/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-27 22:44:28 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-10-28 14:37:22
 */

import 'action.dart';
import 'common.dart';

class YZDynamicRequest {
  String url;
  String method;
  Map<String, dynamic> params;
  YZDynamicRequestResult succeed;
  YZDynamicRequestResult failed;
  String responseDataVar; //返回数据的存放变量，The storage variable of response data

  YZDynamicRequest({this.url, this.method, this.params, this.responseDataVar});

  YZDynamicRequest.fromJson(Map<dynamic, dynamic> json) {
    if (json == null) return;
    url = json['url'];
    method = json['method'];
    params = YZDynamicCommon.dynamicToMap(json['params']);
    succeed = json['succeed'] == null ? null : YZDynamicRequestResult.fromJson(json['succeed']);
    failed = json['failed'] == null ? null : YZDynamicRequestResult.fromJson(json['failed']);
    responseDataVar = json['responseDataVar'];
  }
}

class YZDynamicRequestResult {
  List<YZDynamicActionConfig> actions;
  String tip;
  Map params;

  YZDynamicRequestResult({this.actions, this.tip, this.params});

  YZDynamicRequestResult.fromJson(Map<dynamic, dynamic> json) {
    if (json['actions'] != null) {
      actions = (json['actions'] as List).map((e) => YZDynamicActionConfig.fromJson(e))?.toList();
    }
    tip = json['tip'];
    params = json['params'];
  }
  
}
