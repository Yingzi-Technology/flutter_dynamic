/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-02 10:30:35     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-19 16:09:56
**/   


import '../../tools/action.dart';

class YZDynamicWidgetConfig {
	String? type;
	String? widget;
	Map? props;
	Map<String, YZDynamicActionConfig>? xActions;
	String? xKey;
	List<dynamic>? xEvents;
	List<dynamic>? xData;
	Map? xCode;
	List<dynamic>? xRules;
	Map? xRef;
  String? isFormField;
  Map? xVar;
  YZXCondition? xCondition;
  YZDynamicWidgetLifecycle? state;
  List? children; //兼容web数据模型

	YZDynamicWidgetConfig({this.type, this.widget, this.props, this.xActions, this.xKey, this.xEvents, this.xData, this.xCode, this.xRules, this.xRef, this.isFormField, this.xVar, this.state, this.xCondition});

	YZDynamicWidgetConfig.fromJson(Map<dynamic, dynamic>? json) {
    json ??= {};

		type = json['type'];
		widget = json['widget'];
		props = json['props'];
    if (json['xActions'] != null) {
      xActions = (json['xActions'] as Map).map(
        (key, value) => MapEntry(key, YZDynamicActionConfig.fromJson(value))
      );
    }		
		xKey = json['xKey'];
		xEvents = json['xEvents'];
		xData = json['xData'];
		xCode = json['xCode'];
		xRules = json['xRules'];
		xRef = json['xRef'];
    isFormField = json['isFormField'];
    xVar = json['xVar'];
    state = json['state'] != null
        ? new YZDynamicWidgetLifecycle.fromJson(json['state'])
        : null;
    xCondition = json['xCondition'] != null
        ? new YZXCondition.fromJson(json['xCondition'])
        : null;
	}

}

class YZXCondition {
  YZRepeatChild? repeatChild;

  YZXCondition({this.repeatChild});

  YZXCondition.fromJson(Map<String, dynamic> json) {
    repeatChild = json['repeatChild'] != null
        ? new YZRepeatChild.fromJson(json['repeatChild'])
        : null;
  }
}

class YZRepeatChild {
  String? data;
  String? item;

  YZRepeatChild({this.data, this.item});

  YZRepeatChild.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    item = json['item'];
  }
}

class YZDynamicWidgetLifecycle {
  List<YZDynamicActionConfig>? beforeEntrance;
  List<YZDynamicActionConfig>? initState;
  List<YZDynamicActionConfig>? build;
  List<YZDynamicActionConfig>? dispose;
  List<YZDynamicActionConfig>? afterLeave;

  YZDynamicWidgetLifecycle(
      {this.beforeEntrance,
      this.initState,
      this.build,
      this.dispose,
      this.afterLeave});

  YZDynamicWidgetLifecycle.fromJson(Map<dynamic, dynamic> json) {
    if (json['beforeEntrance'] != null) {
      beforeEntrance = <YZDynamicActionConfig>[];
      json['beforeEntrance'].forEach((v) {
        beforeEntrance!.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['initState'] != null) {
      initState = <YZDynamicActionConfig>[];
      json['initState'].forEach((v) {
        initState!.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['build'] != null) {
      build = <YZDynamicActionConfig>[];
      json['build'].forEach((v) {
        build!.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['dispose'] != null) {
      dispose = <YZDynamicActionConfig>[];
      json['dispose'].forEach((v) {
        dispose!.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
    if (json['afterLeave'] != null) {
      afterLeave = <YZDynamicActionConfig>[];
      json['afterLeave'].forEach((v) {
        afterLeave!.add(new YZDynamicActionConfig.fromJson(v));
      });
    }
  }

}