/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:09:56 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-01 09:34:31
 */

import 'package:flutter/material.dart';
import 'package:yingzi_flutter_dynamicpage_example/grammar/bool.dart';

import 'controlflow.dart';
import 'list.dart';
import 'map.dart';
import 'number.dart';
import 'operators_lo.dart';
import 'operators_re.dart';
import 'string.dart';
import 'user_code.dart';

import 'package:yz_flutter_dynamic/main.dart';

class UnitTestingList extends StatefulWidget {
  @override
  _UnitTestingListState createState() => _UnitTestingListState();
}

class _UnitTestingListState extends State<UnitTestingList> {

  @override
  void initState() {
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('语法列表')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createTitle('内建类型(Built-in types)'),
              createItem('Number', UTNumber()),
              createItem('String', UTString()),
              createItem('List', UTList()),
              createItem('Map', UTMap()),  
              createItem('bool', UTBool()),              
              createTitle('运算符(Operators)'),             
              createItem('关系运算符(Equality and relational operators)', UTRelationalOperators()),  
              createItem('逻辑运算符(Logical operators)', UTLogicalOperators()),  
              createTitle('控制流程(Control flow statements)'),    
              createItem('if and else', UTIfElse()), 
              createItem('switch case', UTSwitchCase()),   
              createItem('forloop', UTForloop()),    
              createItem('while', UTWhile()),    
              createTitle('User Code'),                                 
              createItem('User Code', UTUserCode()),  
            ],
          ),
        )
      ),
    );
  }

  Widget createTitle(String title) {
    return Container(
            child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            margin: EdgeInsets.only(bottom: 10),
          );
  }

  Widget createItem(String subTitle, Widget widget) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlatButton(
            onPressed: (){                
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
                return widget;
              }));  
            }, 
            child: Align(child: Text(subTitle, style: TextStyle(color: Colors.lightBlue)), alignment: Alignment.centerLeft) 
          ),
          Divider()          
        ],
      ),
    );
  }

}