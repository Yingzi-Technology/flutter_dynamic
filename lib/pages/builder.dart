/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-01 22:06:01     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-03 14:24:37
**/   

import 'package:flutter/material.dart';
import 'basic/page.dart';
import 'custompage.dart';
import 'formpage.dart';
import 'formwidget.dart';
import 'model/page_config.dart';

class YZDynamicPageTemplateBuilder {
  YZDynamicPageTemplateBuilder._();

  static Widget build(BuildContext context, Map config, {YZDynamicPagePreConfig? preConfig}) {
    Widget page;
    
    Map _pageConfig = config['page'];
    YZDynamicPageTemplateConfig _pageConfigObj = YZDynamicPageTemplateConfig.fromJson(_pageConfig);
    String? _pageType = _pageConfigObj.type;    

    if (_pageType == 'formpage') {
      print("-->>>formpage: ${_pageConfigObj.name}");
      Map _submitJson = config['submit'];
      Map _navbarJson = config['navbar'];
      List<Map> _children =  List.castFrom<dynamic, Map>(config['children']);
      page = YZDynamicFormPage(
        _children, 
        submitJson: _submitJson,
        pageConfig: _pageConfigObj,
        preConfig: preConfig,
        navbarJson: _navbarJson
      );      
    } else {

      ///从设计器来的数据模型采用formpage的方式返回wigget的类型，子元素存在children中
      if (_pageConfigObj.rootWidget == null || _pageConfigObj.rootWidget!.isEmpty) {
        print("==>>>formwidget: ${_pageConfigObj.name}");
        List<Map> _children =  List.castFrom<dynamic, Map>(config['children']);
        page = YZDynamicFormWidget(
          _children, 
          pageConfig: _pageConfigObj,
          preConfig: preConfig,
        ); 
      } else {
        print("~~>>>custompage: ${_pageConfigObj.name}");
        page = YZDynamicCustomPage(
          _pageConfigObj,
          preConfig: preConfig,
        ); 
      }     
    }

    return page;
  }

}
