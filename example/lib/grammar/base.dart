/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-02 14:43:45 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 17:42:52
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'dsl.dart';

class UTBaseState<T extends StatefulWidget> extends State<T> {

  external List<Widget> getItem();
  external String get getTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.getTitle)),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: this.getItem(),
          )
        )
      ),
    );
  }

  Widget createItem(String kw, String code) {
    TextEditingController control = TextEditingController.fromValue(
            TextEditingValue(
              text: 
              '''$code'''
            )
          );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(              
          margin: EdgeInsets.only(bottom: 10),
          child: FlatButton(
            color: Colors.black12,
            child: Text(kw, style: TextStyle(fontSize: 14, color: Colors.lightBlue)),
            onPressed: (){
              YZDynamic.handle(
                context, getDemoDsl(control.text)
              );                  
            }                    
          )
        ),
        TextField( 
          maxLines: null,  
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero
          ),
          scrollPadding: EdgeInsets.zero,           
          textAlign: TextAlign.start,
          controller: control,
        )        
      ],
    );
  }

}