/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-29 12:04:22 
 * @Last Modified by:   yz.yujingzhou 
 * @Last Modified time: 2020-10-29 12:04:22  
 */

part of '../action.dart';

class YZRouterPopHandler extends YZDynamicPublicActionHandler{
  @override
  void action(BuildContext? context, {
      Map? params, 
      YZDynamicRequest? request,
      List<YZDynamicActionRule>? rules,
      Map? localVariables,
      State? state,
    }) {
    print('xAction: YZPagePopHandler Router.pop');

    if (context == null) return; 
    Navigator.of(context).pop();
  }

  @override
  String get actionName => 'Router.pop';

}