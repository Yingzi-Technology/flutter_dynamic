/*
 * @Author: yangyiting 
 * @Date: 2021-03-24 10:39:25 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-24 17:50:04
 * @Describe: math
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTMath extends StatefulWidget {
  @override
  _UTMathState createState() => _UTMathState();
}

class _UTMathState extends UTBaseState<UTMath> {

  String get getTitle => "Math";

  List<Widget> getItem() {
    return [
      createItem("Math.sqrt", "var:<c:number>=action:num(123);\n<c:ret>=action:Math.sqrt(value:var:<c:number>);"),
      createItem("Math.exp", "var:<c:number>=action:num(3);\n<c:ret>=action:Math.exp(value:var:<c:number>);"),  
      createItem("Math.log", "var:<c:number>=action:num(123);\n<c:ret>=action:Math.log(value:var:<c:number>);"),
      createItem("Math.min", "var:<c:value1>=action:num(228);\nvar:<c:value2>=action:num(188);\n<c:ret>=action:Math.min(value1:var:<c:value1>,value2:var:<c:value2>);"), 
      createItem("Math.max", "var:<c:value1>=action:num(228);\nvar:<c:value2>=action:num(188);\n<c:ret>=action:Math.max(value1:var:<c:value1>,value2:var:<c:value2>);"),  
      createItem("Math.pow", "var:<c:value>=action:num(5);\nvar:<c:exponent>=action:num(3);\n<c:ret>=action:Math.pow(value:var:<c:value>,exponent:var:<c:exponent>);"), 
      createItem("Math.sin", "var:<c:value>=action:num(228);\n<c:ret>=action:Math.sin(value:var:<c:value>);"),   
      createItem("Math.cos", "var:<c:value>=action:num(228);\n<c:ret>=action:Math.cos(value:var:<c:value>);"),   
      createItem("Math.tan", "var:<c:value>=action:num(228);\n<c:ret>=action:Math.tan(value:var:<c:value>);"),
      createItem("Math.asin", "var:<c:value>=action:num(0.5);\n<c:ret>=action:Math.asin(value:var:<c:value>);"),   
      createItem("Math.acos", "var:<c:value>=action:num(0.5);\n<c:ret>=action:Math.acos(value:var:<c:value>);"),   
      createItem("Math.atan", "var:<c:value>=action:num(0.5);\n<c:ret>=action:Math.atan(value:var:<c:value>);"),
      createItem("Math.atan2", "var:<c:value1>=action:num(0.5);\nvar:<c:value2>=action:num(0.5);\n<c:ret>=action:Math.atan2(value1:var:<c:value1>,value2:var:<c:value2>);"),  
      createItem("Math.e", "<c:ret>=action:Math.e()"), 
      createItem("Math.ln10", "<c:ret>=action:Math.ln10()"), 
      createItem("Math.ln2", "<c:ret>=action:Math.ln2()"), 
      createItem("Math.log2e", "<c:ret>=action:Math.log2e()"), 
      createItem("Math.log10e", "<c:ret>=action:Math.log10e()"), 
      createItem("Math.pi", "<c:ret>=action:Math.pi()"), 
      createItem("Math.sqrt1_2", "<c:ret>=action:Math.sqrt1_2()"),              
      createItem("Math.sqrt2", "<c:ret>=action:Math.sqrt2()"), 
    ];
  }

}