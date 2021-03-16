/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-01 21:36:18     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-01-27 14:59:37
**/   

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/widgets/form.dart';

import '../tools/common.dart';
import 'basic/page.dart';
import 'basic/utils.dart';
import 'model/page_config.dart';

///One-Dimension Column Form Layout (单列表单布局)
class YZDynamicFormPage extends YZDynamicBasePage {

  final YZDynamicPageTemplateConfig pageConfig;
  final Map navbarJson;
  final Map submitJson;
  final List<Map> childrenJson;
  final YZDynamicPagePreConfig preConfig;

  YZDynamicFormPage(this.childrenJson, 
    {
      this.pageConfig, 
      this.navbarJson, 
      this.submitJson, 
      this.preConfig
    }): super(pageConfig:pageConfig, preConfig: preConfig);

  @override
  _YZDynamicFormPageState createState() => _YZDynamicFormPageState();
}

class _YZDynamicFormPageState extends YZDynamicBaseState<YZDynamicFormPage> {

  @override
  void initState() {
    super.initState();   

    assert(widget.childrenJson != null, 'The children should not be null for formpage type.');
    for (Map json in widget.childrenJson) {
      dealWidgetKey(json);
    }
    dealWidgetKey(widget.navbarJson);
    dealWidgetKey(widget.submitJson);
    
  }

  @override
  void registerActions() {
    super.registerActions();
  }  

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    for (Map json in widget.childrenJson) {
      
      String xKey = json['xKey'];
      Widget widget = YZDynamicCommon.buildWidget(json, context: context);
      if ((widget is Column) || (widget is PreferredSizeWidget)) {
        print('Error: Form widget can not be Column or PreferredSizeWidget');
        continue;
      }
      if (widget == null) {
        children.add(Text('Not found widget for xKey "$xKey"'));
      } else {
        children.add(widget);      
      }      
    }

    if (children == null || children.isEmpty) {
      assert(children != null, 'Error: Children can not be null or empty!');
      children = [Text('No widgets')];
    }    

    Widget navbar = YZDynamicCommon.buildWidget(widget.navbarJson, context: context);
    if (navbar == null) {
      navbar = AppBar(title: Text('Dynamic form page'));
    }

    Widget submit = YZDynamicCommon.buildWidget(widget.submitJson, context: context);
    if (submit == null) {
      submit = Container();
    }

    EdgeInsets _padding = YZDynamicCommon.edgeInsetAdapter(super.pageConfig?.props?.padding)  ?? EdgeInsets.zero;
    Color _backgraoundColor = YZDinamicPageUtils.colorAdapter(super.pageConfig?.props?.backgraoundColor)  ?? Color(0xFFFFFFFF);
    return Scaffold(
      backgroundColor: _backgraoundColor,
      appBar: navbar,
      body: SafeArea(
        child: Padding(
          padding: _padding,
          child: YZForm(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: children ?? Text('Error: Children can not be null!'),
                    ),
                  )
                ),
                submit,
              ],
            )
          ),
        )
      ),
    );
  } 

}