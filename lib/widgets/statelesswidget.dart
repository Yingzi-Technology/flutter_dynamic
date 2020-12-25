/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 11:21:35     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-18 11:54:01
**/   

import 'package:flutter/material.dart';
import '../tools/common.dart';
import 'basic/handler.dart';
import 'model/widget_config.dart';

/// StatelessWidget handler
class YZStatelessWidgetHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'StatelessWidget';

  @override
  Widget build(Map<String, dynamic> json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends StatelessWidget {

  final Map<String, dynamic> json;
  const _Builder(this.json, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      //Deal with props / 处理控件属性
    YZDynamicWidgetConfig config = YZDynamicWidgetConfig.fromJson(json);
    YZStatelessWidgetConfig props = YZStatelessWidgetConfig.fromJson(config.props) ?? {};    
    Widget _build = props.build == null ? null : YZDynamicCommon.buildWidget(props.build, context: context);  
    return _build;
  }
}

/// The props of StatelessWidget config
class YZStatelessWidgetConfig {
  Map build;

  YZStatelessWidgetConfig(
      {this.build
      });

  YZStatelessWidgetConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    build = json['build'];
  }
}
