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
export 'package:yingzi_flutter_dynamicpage/pages/basic/page.dart';
export 'package:yingzi_flutter_dynamicpage/tools/common.dart';
export 'package:yingzi_flutter_dynamicpage/tools/action.dart';
export 'package:yingzi_flutter_dynamicpage/tools/variable.dart';
export 'package:yingzi_flutter_dynamicpage/tools/network.dart';
export 'package:yingzi_flutter_dynamicpage/widgets/basic/handler.dart';
export 'package:yingzi_flutter_dynamicpage/widgets/basic/widget.dart';
export 'package:yingzi_flutter_dynamicpage/widgets/basic/data.dart';
export 'package:yingzi_flutter_dynamicpage/widgets/basic/utils.dart';

class YZDynamicPage {
  YZDynamicPage._();

  static Widget build(BuildContext context, Map config, {YZDynamicPagePreConfig preConfig}) {
    Widget widget;

    //You shoud register widgets first or it wouldn't create widget
    YZDynamicCommon.registerSysWidgets();
    //You shoud register sys public action first or it wouldn't be found
    YZDynamicCommon.registerSysPublicActionHandlers();

    widget = YZDynamicPageTemplateBuilder.build(context, config, preConfig: preConfig);

    return widget;
  }

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
              Widget child = YZDynamicPage.build(context, config, preConfig: preConfig);
              return Dialog(child: child);
            }
          );
        }();
        break;
      default:
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
          return YZDynamicPage.build(context, config, preConfig: preConfig);
        }));
    }

  }  

}
