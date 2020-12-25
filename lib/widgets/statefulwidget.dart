/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 11:21:35     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-18 11:54:01
**/   

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/handler.dart';
import 'basic/widget.dart';

/// StatefulWidget handler
class YZStatefulWidgetHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'StatefulWidget';

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
  YZStatefulWidgetConfig props;
  
  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZStatefulWidgetConfig.fromJson(super.config.props) ?? {};    
  }

  @override
  Widget build(BuildContext context) {

    Widget _build = props.build == null ? null : YZDynamicCommon.buildWidget(props.build, context: context);    
    return _build;

  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
    actionFunctions['setState'] = stateSetter; 
  }

  void stateSetter({
      Map params, 
      YZDynamicRequest request,
      List<YZDynamicActionRule> rules,
      Map localVariables,
      State state,
    }) {
    print('Execute xAction: ${this.runtimeType} setState');
    if (mounted) {
      setState(() {});
    }
  }

}

/// The props of StatefulWidget config
class YZStatefulWidgetConfig {
  Map build;

  YZStatefulWidgetConfig(
      {this.build
      });

  YZStatefulWidgetConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    build = json['build'];
  }
}
