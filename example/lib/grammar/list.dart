/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 17:07:20
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTList extends StatefulWidget {
  @override
  _UTListState createState() => _UTListState();
}

class _UTListState extends UTBaseState<UTList> {

  String get getTitle => "List";

  List<Widget> getItem() {
    return [
      createItem("List", "action:List(1,2,a,b);"), 
      createItem("List.valueOfIndex", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.valueOfIndex(list:var:<c:list>, index:1);"), 
      createItem("List.isEmpty", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.isEmpty(list:var:<c:list>));"), 
      createItem("List.isNotEmpty", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.isNotEmpty(list:var:<c:list>));"),
      createItem("List.length", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.length(list:var:<c:list>));"), 
      createItem("List.clear", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.clear(list:var:<c:list>));"), 
      createItem("List.first", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.first(list:var:<c:list>));"), 
      createItem("List.last", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.last(list:var:<c:list>));"), 
      createItem("List.add", "var:<c:list>=List(1,2,a,b);\naction:List.add(list:var:<c:list>, value:c));\nvar:<c:ret>=var:<c:list>"), 
      createItem("List.addAll", "var:<c:list>=List(1,2,a,b);\nvar:<c:other>=List(c,d);\naction:List.addAll(list:var:<c:list>, value:<c:other>));\nvar:<c:ret>=var:<c:list>"), 
      createItem("List.indexOf", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.indexOf(list:var:<c:list>, value:a, start:0));"), 
      createItem("List.lastIndexOf", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.lastIndexOf(list:var:<c:list>, value:a));"), 
      createItem("List.insert", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.insert(list:var:<c:list>, index:2, value:d));\nvar:<c:ret>=var:<c:list>"), 
      createItem("List.insertAll", "var:<c:list>=List(1,2,a,b);\nvar:<c:other>=List(c,d);\naction:List.insertAll(list:var:<c:list>, index:2, value:<c:other>));\nvar:<c:ret>=var:<c:list>"),  
      createItem("List.setAll", "var:<c:list>=List(1,2,a,b);\nvar:<c:other>=List(c,d);\naction:List.setAll(list:var:<c:list>, index:2, value:<c:other>));\nvar:<c:ret>=var:<c:list>"),   
      createItem("List.remove", "var:<c:list>=List(1,2,a,b);\naction:List.remove(list:var:<c:list>, value:a));\nvar:<c:ret>=var:<c:list>"),  
      createItem("List.removeAt", "var:<c:list>=List(1,2,a,b);\naction:List.removeAt(list:var:<c:list>, index:2));\nvar:<c:ret>=var:<c:list>"),     
      createItem("List.removeLast", "var:<c:list>=List(1,2,a,b);\naction:List.removeLast(list:var:<c:list>));\nvar:<c:ret>=var:<c:list>"),  
      createItem("List.sublist", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.sublist(list:var:<c:list>, start:1, end:3));"),  
      createItem("List.asMap", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.asMap(list:var:<c:list>));"),         
    ];
  }

}