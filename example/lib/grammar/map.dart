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
      createItem("MapEntry", 'var:<c:ret>=action:MapEntry(key:k1,value:v1);'), 
      createItem("Map.valueOfKey", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.valueOfKey(map:var:<c:map>, key:k1);'),
      createItem("Map.isEmpty", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.isEmpty(map:var:<c:map>);'), 
      createItem("Map.isNotEmpty", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.isNotEmpty(map:var:<c:map>);'),
      createItem("Map.length", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.length(map:var:<c:map>);'),
      createItem("Map.containsValue", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.containsValue(map:var:<c:map>, value:v1);'),
      createItem("Map.containsKey", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.containsKey(map:var:<c:map>, key:k1);'),  
      createItem("Map.remove", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\naction:Map.remove(map:var:<c:map>, key:k1));\nvar:<c:ret>=var:<c:map>'),
      createItem("Map.clear", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\naction:Map.clear(map:var:<c:map>));\nvar:<c:ret>=var:<c:map>'),  
      createItem("Map.keys", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.keys(map:var:<c:map>));'), 
      createItem("Map.values", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.values(map:var:<c:map>));'),
      createItem("Map.entries", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:result>=action:Map.entries(map:var:<c:map>);\nvar:<c:ret>=action:Iterable.elementAt(iterable:var:<c:result>,index:0);'), 
      createItem("Map.addAll", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:other>=Map({"k3":"v3", "k4":"v4"});\naction:Map.addAll(map:var:<c:map>,other:var:<c:other>,));\nvar:<c:ret>=var:<c:map>'), 
      createItem("Map.toString", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.toString(map:var:<c:map>);'), 
      createItem("Map.from", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.from(other:var:<c:map>);'), 
      createItem("Map.of", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.of(other:var:<c:map>);'), 
      createItem("Map.identity", 'var:<c:ret>=action:Map.identity();'), 
      createItem("Map.fromIterable",'var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:Map.fromIterable(entries:var:<c:list>)'),
      createItem("Map.fromIterables",'var:<c:keys>=List(1,2,3,4);\nvar:<c:values>=List(a,b,c,d);\nvar:<c:ret>=action:Map.fromIterables(keys:var:<c:keys>,values:var:<c:values>)'),
      // FIXME: addEntries、fromEntries;不传入泛型如何解决这个问题
      // createItem("Map.fromEntries", 'var:<c:entry>=action:MapEntry(key:k3,value:v3);\nvar:<c:list>=action:List();\naction:List.add(value:var:<c:entry>,list:var:<c:list>);\nvar:<c:ret>=action:Map.fromEntries(entries:var:<c:list>);'),
      // createItem("Map.addEntries", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:entry>=MapEntry(key:k3,value:v3);\nvar:<c:list>=List();\naction:List.add(value:var:<c:entry>,list:var:<c:list>);\naction:Map.addEntries(newEntries:var:<c:list>, map:var:<c:map>);\nvar:<c:ret>=var:<c:map>'),
      createItem("Map.unmodifiable", 'var:<c:map>=Map({"k1":"v1", "k2":"v2"});\nvar:<c:ret>=action:Map.unmodifiable(other:var:<c:map>);'), 
    ];
  }

}