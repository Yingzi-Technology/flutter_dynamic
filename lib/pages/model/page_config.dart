/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 10:48:50     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-01-27 14:57:17
**/   

import 'dart:convert';

import '../../tools/action.dart';
export '../../tools/action.dart';

class YZDynamicPageTemplateConfig {
  String key;
  String type;
  String name;
  String presentMode;
  String routeTag;
  YZDynamicPageProps props;
  YZDynamicPageLifecycle state;
  Map<String, YZDynamicActionConfig> xActions;
  Map rootWidget;
  Map xVar;

  YZDynamicPageTemplateConfig(
      {this.key,
      this.type,
      this.name,
      this.presentMode,
      this.routeTag,
      this.props,
      this.state,
      this.xActions,
      this.rootWidget,
      this.xVar});

  YZDynamicPageTemplateConfig.fromJson(Map<dynamic, dynamic> json) {
    key = json['key'];
    type = json['type'];
    name = json['name'];
    presentMode = json['presentMode'];
    routeTag = json['routeTag'];
    props = json['props'] != null ? new YZDynamicPageProps.fromJson(json['props']) : null;
    state = json['state'] != null
        ? new YZDynamicPageLifecycle.fromJson(json['state'])
        : null;
    if (json['xActions'] != null) {
      xActions = (json['xActions'] as Map).map(
        (key, value) => MapEntry(key, YZDynamicActionConfig.fromJson(value))
      );
    }	
    rootWidget = json['rootWidget']; 
    xVar = json['xVar'];        
  }

}

class YZDynamicPageProps {
  List padding;
  String backgraoundColor;

  YZDynamicPageProps({this.padding, this.backgraoundColor});

  YZDynamicPageProps.fromJson(Map<dynamic, dynamic> json) {
    padding = json['padding'] == null ? null : jsonDecode(json['padding']);
    backgraoundColor = json['backgraoundColor'];
  }
  
}

class YZDynamicPageLifecycle {
  List<YZDynamicActionConfig> beforeEntrance;
  List<YZDynamicActionConfig> initState;
  List<YZDynamicActionConfig> build;
  List<YZDynamicActionConfig> dispose;
  List<YZDynamicActionConfig> afterLeave;

  YZDynamicPageLifecycle(
      {this.beforeEntrance,
      this.initState,
      this.build,
      this.dispose,
      this.afterLeave});

  YZDynamicPageLifecycle.fromJson(Map<dynamic, dynamic> json) {
    if (json['beforeEntrance'] != null) {
      beforeEntrance = new List<YZDynamicActionConfig>();
      json['beforeEntrance'].forEach((v) {
        beforeEntrance.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['initState'] != null) {
      initState = new List<YZDynamicActionConfig>();
      json['initState'].forEach((v) {
        initState.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['build'] != null) {
      build = new List<YZDynamicActionConfig>();
      json['build'].forEach((v) {
        build.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['dispose'] != null) {
      dispose = new List<YZDynamicActionConfig>();
      json['dispose'].forEach((v) {
        dispose.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['afterLeave'] != null) {
      afterLeave = new List<YZDynamicActionConfig>();
      json['afterLeave'].forEach((v) {
        afterLeave.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
  }

}
