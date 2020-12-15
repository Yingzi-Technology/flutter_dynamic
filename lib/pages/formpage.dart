/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-01 21:36:18     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-29 15:45:50
**/   

import 'package:flutter/material.dart';
import 'package:yingzi_flutter_dynamicpage/widgets/form.dart';

import '../tools/common.dart';
import 'basic/page.dart';
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
      // GlobalKey<YZDynamicWidgetBasicState> _gkey;  
      String xKey = json['xKey'];
      // if (xKey != null && xKey.isNotEmpty) {
      //   _gkey = GlobalKey<YZDynamicWidgetBasicState>();
      //   widgets[xKey] = _gkey; //Save all widget/保存所有的控件
      // }      
      // Widget widget = YZDynamicCommon.buildWidget(json, key: _gkey, context: context);
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
    return Scaffold(
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