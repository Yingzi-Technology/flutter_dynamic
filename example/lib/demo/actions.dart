/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-19 13:45:48 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-19 11:18:56
 */

import 'package:fluttertoast/fluttertoast.dart';
import 'package:yz_flutter_dynamic/main.dart';

/*
 * Custum action
 * 自定义 action 
 */
class YZToastHandler extends YZDynamicPublicActionHandler{
  @override
  void action(BuildContext context, {
      Map params, 
      YZDynamicRequest request,
      List<YZDynamicActionRule> rules,
      Map localVariables,
      State state,
    }) {
      String tip = params['tip'];
      Fluttertoast.showToast(
        msg: tip,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  String get actionName => 'yzToast';

}