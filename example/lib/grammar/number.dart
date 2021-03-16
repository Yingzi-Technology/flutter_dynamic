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
      createItem("double", "action:double(123);"),
      createItem("num", "action:num(123);"),
      createItem("num.+", "action:num.+(1, 2);"),
      createItem("num.-", "action:num.-(2, 1, 1);"),
      createItem("num./", "action:num./(5, 2);"),
      createItem("num.parse", "action:num.parse(123);"),
      createItem("num.tryParse", "action:num.tryParse(123);"),
      createItem("num.isInfinite", "action:num.isInfinite(123);"),
      createItem("num.isFinite", "action:num.isFinite(123);"),
      createItem("num.isNegative", "action:num.isNegative(-123);"),
      createItem("num.abs", "action:num.abs(-123);"),   
      createItem("num.clamp", "action:num.clamp(1, lowerLimit:2, upperLimit:3);"),    
      createItem("num.ceil", "action:num.ceil(1.5);"),   
      createItem("num.ceilToDouble", "action:num.ceilToDouble(1.5);"),   
      createItem("num.compareTo", "action:num.compareTo(1, 2);"),    
      createItem("num.floor", "action:num.floor(1.5);"),                          
      createItem("num.round", "action:num.round(1.5);"),
      createItem("num.roundToDouble", "action:num.roundToDouble(1.5);"),
      createItem("num.toDouble", "action:num.toDouble(1);"),
      createItem("num.toInt", "action:num.toInt(1.5);"),
      createItem("num.truncate", "action:num.truncate(1.5);"),
      createItem("num.truncateToDouble", "action:num.truncateToDouble(1.5);"),
      createItem("num.toString", "action:num.toString(1.5);"),
      createItem("num.toStringAsExponential", "action:num.toStringAsExponential(1.5);"),
      createItem("num.toStringAsFixed", "action:num.toStringAsFixed(1.5, 2);"),
      createItem("num.toStringAsPrecision", "action:num.toStringAsPrecision(1.5, 3);"),                            
    ];
  }

}