/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-09-19 23:09:26 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-20 18:15:57
 */

import '../../tools/network.dart';

mixin YZDynamicWidgetDataServer {

  ///获取控件显示的数据
  ///Get widget display data
  List<YZDynamicWidgetDataConfig> getXData(List? xdata){

    List<YZDynamicWidgetDataConfig> _data = [];

    if (xdata != null && xdata.isNotEmpty) {
      xdata.forEach((item){
        Map _item = item as Map;
        _data.add(YZDynamicWidgetDataConfig.fromJson(_item));
      });
    } 

    return _data;
  }

  ///获取控件显示request
  ///Get widget display request
  ///Default get first one
  YZDynamicRequest? getRequest(List? xdata, [String? name]) {
    YZDynamicRequest? request;

    if (xdata != null && xdata.isNotEmpty) {
      if (name == null || name.isEmpty) {
        request = YZDynamicRequest.fromJson(xdata[0]['request']);
      } else {
        for (Map item in xdata) {
          if (name == item[name]) {
            request = YZDynamicRequest.fromJson(item['request']);
            break;
          }          
        }
      }
    } 

    return request;    
  }

  ///获取控件显示定义数据，支持透传
  ///Get widget display defined showdata supporting unvarnished transmission 
  ///Default get first one
  dynamic getShowData(List? xdata, [String? name]) {
    dynamic showdata;

    if (xdata != null && xdata.isNotEmpty) {
      if (name == null || name.isEmpty) {
        showdata = xdata[0]['showdata'];
      } else {
        for (Map item in xdata) {
          if (name == item[name]) {
            showdata = item['showdata'];
            break;
          }          
        }
      }
    } 

    return showdata; 
  }

}

class YZDynamicWidgetDataConfig {
  String? name;
  YZDynamicRequest? request;
  dynamic showdata;

  YZDynamicWidgetDataConfig({this.name, this.request, this.showdata});

  YZDynamicWidgetDataConfig.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    request = YZDynamicRequest.fromJson(json['request']);
    showdata = json['showdata'];

  }
  
}
