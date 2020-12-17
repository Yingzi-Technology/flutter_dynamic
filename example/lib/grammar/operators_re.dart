/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 18:08:46
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTRelationalOperators extends StatefulWidget {
  @override
  _UTRelationalOperatorsState createState() => _UTRelationalOperatorsState();
}

class _UTRelationalOperatorsState extends UTBaseState<UTRelationalOperators> {

  String get getTitle => "Equality and relational operators";

  List<Widget> getItem() {
    return [
      createItem("Sys.==", 'action:Sys.==(a,b);'), 
      createItem("Sys.!=", 'action:Sys.!=(a,b);'),    
      createItem("Sys.>", 'action:Sys.>(1,2);'),     
      createItem("Sys.>=", 'action:Sys.>=(1,2);'),   
      createItem("Sys.<", 'action:Sys.<(1,2);'),     
      createItem("Sys.<=", 'action:Sys.<=(1,2);'),           
    ];
  }

}