/*
 * @Author: yangyiting 
 * @Date: 2021-03-01 09:29:56 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-01 11:38:37
 */

import 'package:flutter/material.dart';

import 'base.dart';

class UTBool extends StatefulWidget {
  @override
  _UTBoolState createState() => _UTBoolState();
}

class _UTBoolState extends UTBaseState<UTBool> {

  String get getTitle => "bool";

  List<Widget> getItem() {
    return [
      createItem('bool', '<c:ret>=action:bool(true)'), 
      createItem('Sys.bool', '<c:ret>=action:Sys.bool(true)'), 
      createItem('Sys.bool', '<c:ret>=action:Sys.bool(false)'),  
      createItem('Sys.bool.toString', '<c:ret>=action:bool.toString(false)'),     
    ];
  }

}