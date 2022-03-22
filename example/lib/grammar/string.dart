/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 17:43:44
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTString extends StatefulWidget {
  @override
  _UTStringState createState() => _UTStringState();
}

class _UTStringState extends UTBaseState<UTString> {

  String get getTitle => "String";

  List<Widget> getItem() {
    return [
      createItem("String", "<c:ret>=action:String(Hello world!);"),  
      createItem("String.isEmpty", "<c:ret>=action:String.isEmpty(Hello world!);"),
      createItem("String.isNotEmpty", "<c:ret>=action:String.isNotEmpty(Hello world!);"),
      createItem("String.+", "<c:ret>=action:String.+(Hello, world, !);"),       
      createItem("String.length", "<c:ret>=action:String.length(Hello world!);"),  
      createItem("String.compareTo", "<c:ret>=action:String.compareTo(a,b);"),                          
      createItem("String.indexOf", "<c:ret>=action:String.indexOf(value:abc,pattern:b);"),
      createItem("String.lastIndexOf", "<c:ret>=action:String.lastIndexOf(value:abcbc,pattern:b);"),                          
      createItem("String.contains", "<c:ret>=action:String.contains(value:abc,other:b));"),
      createItem("String.endsWith", "<c:ret>=action:String.endsWith(value:abc,other:c));"),
      createItem("String.startsWith", "<c:ret>=action:String.startsWith(value:abc,other:c);"),
      createItem("String.padLeft", "<c:ret>=action:String.padLeft(value:abc, padding:c, width:5);"),
      createItem("String.padRight", "<c:ret>=action:String.padRight(value:abc,padding:c, width:5);"),
      createItem("String.replaceAll", "<c:ret>=action:String.replaceAll(value:acbc,from:c, replace:d);"),
      createItem("String.replaceFirst", "<c:ret>=action:String.replaceFirst(value:acbc,from:c, replace:d);"),
      createItem("String.replaceRange", "<c:ret>=action:String.replaceRange(value:acbc, start:1,end:3, replace:d);"),
      createItem("String.substring", "<c:ret>=action:String.substring(value:acbc, startIndex:1,endIndex:3);"),
      createItem("String.toLowerCase", "<c:ret>=action:String.toLowerCase(value:AbC);"),
      createItem("String.toUpperCase", "<c:ret>=action:String.toUpperCase(value:AbC);"),
      createItem("String.trim", "<c:ret>=action:String.trim(value: AbC );"),
      createItem("String.trimLeft", "<c:ret>=action:String.trimLeft(value: AbC );"),
      createItem("String.trimRight", "<c:ret>=action:String.trimRight(value: AbC );"),
      createItem("String.split", "<c:ret>=action:String.split(value:AbC, pattern:b);"),
      createItem("String.allMatches", "<c:ret>=action:String.allMatches(value:AbC,string:Ab);"),
      createItem("String.matchAsPrefix", "<c:ret>=action:String.matchAsPrefix(value:AbC,string:b);"),
    ];
  }

}