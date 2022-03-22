/* 
 * @Author: yz.yujingzhou 
 * @Date: 2021-07-15 13:43:44 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-07-15 13:52:47
 * @Describe: 组件属性适配
 */

// Text widget adapter
Map yzTextWidgetAdapter(Map json) {

  Map _json = {};
  for (var key in json.keys) {
    _json[key] = json[key];
  }

  if (_json['props'] != null && 
    (_json['props'] is Map) && 
    _json['props']['style'] == null) {

    _json['props']['style'] = {
      "color" : json['props']['fontColor'],
      "background" : json['props']['bgColor'],
      "fontSize" : json['props']['fontSize'],
      "fontWeight" : json['props']['fontWeight'],
      "fontStyle" : json['props']['fontStyle'],
      "letterSpacing" : json['props']['letterSpacing'],
      "wordSpacing" : json['props']['wordSpacing'],
      "height" : json['props']['height'],
    };

  }

  return _json;

}
