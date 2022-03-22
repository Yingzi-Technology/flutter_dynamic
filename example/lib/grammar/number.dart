/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 14:49:05
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTNumber extends StatefulWidget {
  @override
  _UTNumberState createState() => _UTNumberState();
}

class _UTNumberState extends UTBaseState<UTNumber> {

  String get getTitle => "Number";

  List<Widget> getItem() {
    return [
      createItem("int", "<c:ret>=action:int(123);"),
      createItem("double", "<c:ret>=action:double(123);"),
      createItem("num", "<c:ret>=action:num(123);"),
      createItem("num.+", "<c:ret>=action:num.+(1, 2);"),
      createItem("num.-", "<c:ret>=action:num.-(2, 1, 1);"),
      createItem("num./", "<c:ret>=action:num./(5, 2);"),
      createItem("num.%", "<c:ret>=action:num.%(5, 2);"),
      createItem("num.+=", "var:<c:var1>=num(5);\nvar:<c:var2>=num(2);\n<c:ret>=action:num.+=(ret:var:<c:var1>, opt:var:<c:var2>);\n"),
      createItem("num.-=", "var:<c:var1>=num(5);\nvar:<c:var2>=num(2);\n<c:ret>=action:num.-=(ret:var:<c:var1>, opt:var:<c:var2>);"),
      createItem("num.*=", "var:<c:var1>=num(5);\nvar:<c:var2>=num(2);\n<c:ret>=action:num.*=(ret:var:<c:var1>, opt:var:<c:var2>);"),
      createItem("num./=", "var:<c:var1>=num(5);\nvar:<c:var2>=num(2);\n<c:ret>=action:num./=(ret:var:<c:var1>, opt:var:<c:var2>);"),
      createItem("num.parse", "<c:ret>=action:num.parse(123);"),
      createItem("num.tryParse", "<c:ret>=action:num.tryParse(123);"),
      createItem("num.isInfinite", "<c:ret>=action:num.isInfinite(123);"),
      createItem("num.isFinite", "<c:ret>=action:num.isFinite(123);"),
      createItem("num.isNegative", "<c:ret>=action:num.isNegative(-123);"),
      createItem("num.abs", "<c:ret>=action:num.abs(-123);"),   
      createItem("num.clamp", "<c:ret>=action:num.clamp(1, lowerLimit:2, upperLimit:3);"),    
      createItem("num.ceil", "<c:ret>=action:num.ceil(1.5);"),   
      createItem("num.ceilToDouble", "<c:ret>=action:num.ceilToDouble(1.5);"),   
      createItem("num.compareTo", "<c:ret>=action:num.compareTo(1, 2);"),    
      createItem("num.floor", "<c:ret>=action:num.floor(1.5);"),                          
      createItem("num.round", "<c:ret>=action:num.round(1.5);"),
      createItem("num.roundToDouble", "<c:ret>=action:num.roundToDouble(1.5);"),
      createItem("num.toDouble", "<c:ret>=action:num.toDouble(1);"),
      createItem("num.toInt", "<c:ret>=action:num.toInt(1.5);"),
      createItem("num.truncate", "<c:ret>=action:num.truncate(1.5);"),
      createItem("num.truncateToDouble", "<c:ret>=action:num.truncateToDouble(1.5);"),
      createItem("num.toString", "<c:ret>=action:num.toString(1.5);"),
      createItem("num.toStringAsExponential", "<c:ret>=action:num.toStringAsExponential(1.5);"),
      createItem("num.toStringAsFixed", "<c:ret>=action:num.toStringAsFixed(1.5, 2);"),
      createItem("num.toStringAsPrecision", "<c:ret>=action:num.toStringAsPrecision(1.5, 3);"),                            
    ];
  }

}