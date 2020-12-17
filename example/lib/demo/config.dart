/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-03 09:24:58     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-29 16:59:36
**/   

import 'actions.dart';

import 'package:yz_flutter_dynamic/main.dart';

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

  //注册网络库
  //Register the network lib
  // YZDynamicCommon.network = YZDynamicDataNetworkFPF.getInstance();

}

