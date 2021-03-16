/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-02 22:26:21 
 * @Last Modified by:   yz.yujingzhou 
 * @Last Modified time: 2020-11-02 22:26:21  
 */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// Scaffold handler
class YZScaffoldHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'Scaffold';

  @override
  Widget build(Map<String, dynamic> json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget {

  final Map<String, dynamic> json;

  _Builder(this.json, {Key key}): super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {

  //Deal with props / 处理控件属性
  YZScaffoldConfig props;

  PreferredSizeWidget _appBar;
  Widget _body;

  @override
  void initState() {
    super.initState();

    props = YZScaffoldConfig.fromJson(super.config.props) ?? {};
    _appBar = YZDynamicCommon.buildWidget(props.appBar, context: context);
    _body = YZDynamicCommon.buildWidget(props.body, context: context);

  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;
    
    _widget = Scaffold(
      appBar: _appBar,
      body: _body,
      floatingActionButton: null,
      floatingActionButtonLocation: null,
      floatingActionButtonAnimator: null,
      persistentFooterButtons: null,
      drawer: null,
      endDrawer: null,
      bottomNavigationBar: null,
      bottomSheet: null,
      backgroundColor: null,
      resizeToAvoidBottomInset: null,
      primary: true,
      drawerDragStartBehavior: DragStartBehavior.start,
      extendBody: false,
      extendBodyBehindAppBar: false,
      drawerScrimColor: null,
      drawerEdgeDragWidth: null,
      drawerEnableOpenDragGesture: true,
      endDrawerEnableOpenDragGesture: true,
    );  

    return _widget;
  }

  @override
  void registerActions() {
  }

}

/// The props of Scaffold config
class YZScaffoldConfig {
  Map appBar;
  Map body;

  YZScaffoldConfig({
    this.appBar,
    this.body,
  });

  YZScaffoldConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    appBar = json['appBar'];
    body = json['body'];
  }

}