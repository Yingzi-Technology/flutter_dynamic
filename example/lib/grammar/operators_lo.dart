/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 18:20:56
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTLogicalOperators extends StatefulWidget {
  @override
  _UTLogicalOperatorsState createState() => _UTLogicalOperatorsState();
}

class _UTLogicalOperatorsState extends UTBaseState<UTLogicalOperators> {

  String get getTitle => "Logical operators";

  List<Widget> getItem() {
    return [
      createItem("Sys.!", 'var:<c:isBool>=bool(false);\nvar:<c:ret>=action:Sys.!(var:<c:isBool>);'), 
      createItem("Sys.&&", 'var:<c:bl1>=bool(true);var:<c:bl2>=bool(true);var:<c:ret>=action:Sys.&&(var:<c:bl1>,var:<c:bl2>);'),    
      createItem("Sys.||", 'var:<c:bl1>=bool(true);var:<c:bl2>=bool(false);var:<c:ret>=action:Sys.||(var:<c:bl1>,var:<c:bl2>);'),              
    ];
  }

}