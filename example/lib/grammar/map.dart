/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 17:40:03
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTMap extends StatefulWidget {
  @override
  _UTMapState createState() => _UTMapState();
}

class _UTMapState extends UTBaseState<UTMap> {

  String get getTitle => "Map";

  List<Widget> getItem() {
    return [
      createItem("Map", 'action:Map({"k1":"v1", "k2":"v2"});'), 
      createItem("Map.valueOfKey", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.valueOfKey(map:var:<c:map>, key:k1);'),
      createItem("Map.isEmpty", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.isEmpty(map:var:<c:map>));'), 
      createItem("Map.isNotEmpty", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.isNotEmpty(map:var:<c:map>));'),
      createItem("Map.length", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.length(map:var:<c:map>));'),
      createItem("Map.containsValue", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.containsValue(map:var:<c:map>, value:v1));'),
      createItem("Map.containsKey", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.containsKey(map:var:<c:map>, key:k1));'),  
      createItem("Map.remove", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\naction:Map.remove(map:var:<c:map>, key:k1));\nvar:<c:ret>=var:<c:map>'),
      createItem("Map.clear", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.clear(map:var:<c:map>));\nvar:<c:ret>=var:<c:map>'),       
    ];
  }

}