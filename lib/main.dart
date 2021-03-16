/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-01 21:23:05     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-10-22 15:03:03
**/   

import 'package:flutter/material.dart';
import 'tools/common.dart';
import 'pages/basic/page.dart';
import 'pages/builder.dart';
import 'pages/model/page_config.dart';
import 'pages/basic/utils.dart';

export 'package:flutter/material.dart';
export 'package:yz_flutter_dynamic/pages/basic/page.dart';
export 'package:yz_flutter_dynamic/tools/common.dart';
export 'package:yz_flutter_dynamic/tools/action.dart';
export 'package:yz_flutter_dynamic/tools/variable.dart';
export 'package:yz_flutter_dynamic/tools/network.dart';
export 'package:yz_flutter_dynamic/widgets/basic/handler.dart';
export 'package:yz_flutter_dynamic/widgets/basic/widget.dart';
export 'package:yz_flutter_dynamic/widgets/basic/data.dart';
export 'package:yz_flutter_dynamic/widgets/basic/utils.dart';

/// 入口类（Entry class）
/// 注意事项：YZDynamic接收的dsl Map类型中的value需要转换成dynamic，而不是通过type infer成为其它类型的，可通过jsonEncode/jsonDecode方法强制转换
/// Note: The value in the dsl Map type received by YZDynamic needs to be converted to dynamic instead of other types through type infer. It can be forced to be converted through the jsonEncode/jsonDecode method
class YZDynamic {
  YZDynamic._();

  // deprecated public
  static Widget buildPage(BuildContext context, Map config, {YZDynamicPagePreConfig preConfig}) {
    Widget widget;

    //You shoud register widgets first or it wouldn't create widget
    YZDynamicCommon.registerSysWidgets();
    //You shoud register sys public action first or it wouldn't be found
    YZDynamicCommon.registerSysPublicActionHandlers();

    widget = YZDynamicPageTemplateBuilder.build(context, config, preConfig: preConfig);

    return widget;
  }

  // public
  static Widget buildWidget(BuildContext context, Map config, {YZDynamicPagePreConfig preConfig}) {
    Widget widget;

    if (config['page'] == null) {
      Map json = {
        "page": {
            "rootWidget": config.cast<String, dynamic>()
        }
      }; 

      widget = YZDynamic.buildPage(context, json, preConfig: preConfig);
    }

    return widget;
  }  

  // public
  // 相比buildPage, handle还支持处理页面的呈现方式
  // Compared to buildPage, The method of handle also supports processing the presentation of page.
  static handle(BuildContext context, Map dsl, {YZDynamicPagePreConfig preConfig}){

    assert(dsl != null, 'Error: Dsl can not be null!');
    if (dsl == null || dsl.isEmpty) {      
      return null;
    }

    Map config = dsl;

    Map _pageConfig = config['page'];
    YZDynamicPageTemplateConfig _pageConfigObj = YZDynamicPageTemplateConfig.fromJson(_pageConfig);
    String _presentMode = _pageConfigObj.presentMode;    

    YZDinamicPageMode _mode = YZDinamicPageUtils.pageMode(_presentMode);
    switch (_mode) {
      case YZDinamicPageMode.dialog:
        () async{
          await showDialog(
            context: context, 
            builder: (BuildContext context) {
              Widget child = YZDynamic.buildPage(context, config, preConfig: preConfig);
              return Dialog(child: child);
            }
          );
        }();
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
          return YZDynamic.buildPage(context, config, preConfig: preConfig);
        }));
    }

  }  

}
