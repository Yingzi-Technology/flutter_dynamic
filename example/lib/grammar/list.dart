/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-10 16:12:22
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
      createItem("List.isEmpty", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.isEmpty(iterable:var:<c:list>));"), 
      createItem("List.isNotEmpty", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.isNotEmpty(iterable:var:<c:list>));"),
      createItem("List.length", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.length(iterable:var:<c:list>));"), 
      createItem("List.clear", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.clear(list:var:<c:list>));"), 
      createItem("List.first", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.first(iterable:var:<c:list>));"), 
      createItem("List.last", "var:<c:list>=List(1,2,a,b);\nvar:<c:ret>=action:List.last(iterable:var:<c:list>));"), 
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
      createItem("List.fillRange", "var:<c:list>=List(1,2,3,4);\nvar:<c:fillValue>=List(8,9);\naction:List.fillRange(list:var:<c:list>,start:0,end:2,fillValue:var:<c:fillValue>);\nvar:<c:ret>=var:<c:list>"),
      createItem("List.removeRange", "var:<c:list>=List(1,2,3,4);\naction:List.removeRange(list:var:<c:list>,start:0,end:1);\nvar:<c:ret>=var:<c:list>"),
      createItem("List.setRange", "var:<c:list>=List(1,2,3,4);\nvar:<c:iterable>=List(9,8);\naction:List.setRange(list:var:<c:list>,start:0,end:1,iterable:<c:iterable>,skipCount:1);\nvar:<c:ret>=var:<c:list>"),
      createItem("List.replaceRange", "var:<c:list>=List(1,2,3,4);\nvar:<c:replacement>=List(5,6,7,8,9);\naction:List.replaceRange(start:1,end:3,list:var:<c:list>,replacement:var:<c:replacement>);\nvar:<c:ret>=var:<c:list>"),
      createItem("List.getRange", "var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:List.getRange(list:var:<c:list>,start:1,end:3);"),
      createItem("List.shuffle", "var:<c:list>=List(1,2,3,4);\naction:List.shuffle(list:var:<c:list>);\nvar:<c:ret>=var:<c:list>"),
      createItem("List.copyRange", "var:<c:target>=List(1,2,3,4);\nvar:<c:source>=List(a,b,c,d);\naction:List.copyRange(target:var:<c:target>,at:1,source:var:<c:source>,start:0,end:2);\nvar:<c:ret>=var:<c:target>"),
      createItem("List.unmodifiable", "var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:List.unmodifiable(elements:var:<c:list>);"),
      createItem("List.from", "var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:List.from(elements:var:<c:list>);"),
      createItem("List.of", "var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:List.of(elements:var:<c:list>);"),
      createItem("List.followedBy", "var:<c:list>=List(1,2,3,4);\nvar:<c:other>=List(lala);var:<c:ret>=action:List.followedBy(iterable:var:<c:list>, other:var:<c:other>);"),
      createItem("List.contains", "var:<c:list>=List(aa,a,ab,bc);\nvar:<c:element>=String(a);\nvar:<c:ret>=action:List.contains(iterable:var:<c:list>, element:var:<c:element>)"),
      createItem("List.join", "var:<c:list>=List(a,b,c,d);\nvar:<c:separator>=String(-);\nvar:<c:ret>=action:List.join(iterable:var:<c:list>,separator:var:<c:separator>)"),
      createItem("List.toSet", "var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:List.toSet(iterable:var:<c:list>);"),
      createItem("List.take", "var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:List.take(iterable:var:<c:list>,count:2);"),
      createItem("List.skip", "var:<c:list>=List(1,2,3,4);\nvar:<c:ret>=action:List.skip(iterable:var:<c:list>,count:2);"),
      createItem("List.elementAt", "var:<c:list>=List(a,b,c,d);\nvar:<c:ret>=action:List.elementAt(iterable:var:<c:list>,index:2);"),
      createItem("List.toString", "var:<c:list>=List(a,b,c,d);\nvar:<c:ret>=action:List.toString(iterable:var:<c:list>);"),
    ];
  }

}