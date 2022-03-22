/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-03 09:24:58     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-07-15 13:45:13
**/   

import 'actions.dart';

import 'package:yz_flutter_dynamic/main.dart';

import 'adapter.dart';

/// The third part config

bool isDynamicpageConfigFPFInit = false;

dynamicpageConfigDemo() {
  
  if (isDynamicpageConfigFPFInit == true) return;
  isDynamicpageConfigFPFInit = true;

  //Register the third part widget
  //注册扩展的第三方控件
  // YZDynamicCommon.reginsterWidgetHandler(...);

  //Register the third part action
  //注册扩展的第三方action
  YZDynamicCommon.reginsterPublicActionHandler(YZToastHandler());

  YZDynamicCommon.addWidgetConfigInterceptor('Text', yzTextWidgetAdapter);

  //注册网络库
  //Register the network lib
  // YZDynamicCommon.network = YZDynamicDataNetworkFPF.getInstance();

}

