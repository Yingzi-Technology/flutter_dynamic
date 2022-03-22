/*
 * @Author: yangyiting 
 * @Date: 2021-03-10 17:54:26 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-10 18:21:12
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTSet extends StatefulWidget {
  @override
  _UTSetState createState() => _UTSetState();
}

class _UTSetState extends UTBaseState<UTSet> {

  String get getTitle => "Set";

  List<Widget> getItem() {
    return [
      createItem("Set", "var:<c:ret>=action:Set(1,2,a,b);"), 
      createItem("Set.contains", "var:<c:iterable>=Set(aa,a,ab,bc);\nvar:<c:element>=String(a);\nvar:<c:ret>=action:Set.contains(iterable:var:<c:iterable>, element:var:<c:element>)"),
      createItem("Set.add", "var:<c:target>=Set(1,2,a,b);\naction:Set.add(target:var:<c:target>, value:c);\nvar:<c:ret>=var:<c:target>"), 
      createItem("Set.addAll", "var:<c:target>=Set(1,2,a,b);\nvar:<c:other>=Set(c,d);\naction:Set.addAll(target:var:<c:target>, value:<c:other>));\nvar:<c:ret>=var:<c:target>"), 
      createItem("Set.remove", "var:<c:target>=Set(1,2,a,b);\naction:Set.remove(target:var:<c:target>, value:a);\nvar:<c:ret>=var:<c:target>"),  
      createItem("Set.lookup", "var:<c:target>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.lookup(target:var:<c:target>,value:a)"),
      createItem("Set.removeAll", "var:<c:target>=Set(1,2,a,b);\nvar:<c:value>=Set(1,2);\naction:Set.removeAll(target:var:<c:target>,value:var:<c:value>);\nvar:<c:ret>=var:<c:target>"),
      createItem("Set.retainAll", "var:<c:target>=Set(1,2,a,b);\nvar:<c:value>=Set(1,2);\naction:Set.retainAll(target:var:<c:target>,value:var:<c:value>);\nvar:<c:ret>=var:<c:target>"),
      createItem("Set.containsAll", "var:<c:target>=Set(1,2,a,b);\nvar:<c:value>=Set(1,2);\nvar:<c:ret>=action:Set.containsAll(target:var:<c:target>,value:var:<c:value>);"),
      createItem("Set.intersection", "var:<c:target>=Set(1,2,a,b);\nvar:<c:value>=Set(1,2);\nvar:<c:ret>=action:Set.intersection(target:var:<c:target>,value:var:<c:value>);"),
      createItem("Set.union", "var:<c:target>=Set(1,2,a,b);\nvar:<c:value>=Set(1,2,c);\nvar:<c:ret>=action:Set.union(target:var:<c:target>,value:var:<c:value>);"),
      createItem("Set.difference", "var:<c:target>=Set(1,2,a,b);\nvar:<c:value>=Set(1,2,c);\nvar:<c:ret>=action:Set.difference(target:var:<c:target>,value:var:<c:value>);"),
      createItem("Set.clear", "var:<c:target>=Set(1,2,a,b);\naction:Set.clear(target:var:<c:target>);\nvar:<c:ret>=var:<c:target>"),
      createItem("Set.toSet", "var:<c:target>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.toSet(iterable:var:<c:target>);"),
      createItem("Set.toList", "var:<c:target>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.toList(iterable:var:<c:target>);"),
      createItem("Set.elementAt", "var:<c:target>=Set(a,b,c,d);\nvar:<c:ret>=action:Set.elementAt(iterable:var:<c:target>,index:2);"),
      createItem("Set.length", "var:<c:iterable>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.length(iterable:var:<c:iterable>));"), 
      createItem("Set.isEmpty", "var:<c:iterable>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.isEmpty(iterable:var:<c:iterable>));"), 
      createItem("Set.isNotEmpty", "var:<c:iterable>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.isNotEmpty(iterable:var:<c:iterable>));"),
      createItem("Set.first", "var:<c:iterable>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.first(iterable:var:<c:iterable>));"), 
      createItem("Set.last", "var:<c:iterable>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.last(iterable:var:<c:iterable>));"), 
      createItem("Set.followedBy", "var:<c:iterable>=Set(1,2,3,4);\nvar:<c:other>=Set(lala);var:<c:ret>=action:Set.followedBy(iterable:var:<c:iterable>, other:var:<c:other>);"),
      createItem("Set.join", "var:<c:iterable>=Set(a,b,c,d);\nvar:<c:separator>=String(-);\nvar:<c:ret>=action:Set.join(iterable:var:<c:iterable>,separator:var:<c:separator>)"),
      createItem("Set.take", "var:<c:iterable>=Set(1,2,3,4);\nvar:<c:ret>=action:Set.take(iterable:var:<c:iterable>,count:2);"),
      createItem("Set.skip", "var:<c:iterable>=Set(1,2,3,4);\nvar:<c:ret>=action:Set.skip(iterable:var:<c:iterable>,count:2);"),
      createItem("Set.toString", "var:<c:iterable>=Set(a,b,c,d);\nvar:<c:ret>=action:Set.toString(iterable:var:<c:iterable>);"),
      createItem("Set.iterator", "var:<c:target>=Set(1,2,a,b);\nvar:<c:ret>=action:Set.iterator(target:var:<c:target>));"), 
      createItem("Set.from", "var:<c:elements>=Set(1,2,3,4);\nvar:<c:ret>=action:Set.from(elements:var:<c:elements>);"),
      createItem("Set.of", "var:<c:elements>=Set(1,2,3,4);\nvar:<c:ret>=action:Set.of(elements:var:<c:elements>);"),
      createItem("Set.identity", "var:<c:ret>=action:Set.identity();"),
    ];
  }

}