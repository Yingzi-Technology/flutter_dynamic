/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-03 09:35:13     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-25 11:41:49
**/   
import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'demo/bestpratice.dart';
import 'demo/config.dart';
import 'demo/dsl.dart';
import 'demo/helloworld.dart';
import 'grammar/unittesting.dart';
import 'grammar/user_code.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();

    //Register the third part widget
    dynamicpageConfigDemo();
    
    YZDynamicCommon.addGlobalVariable("person", {"name" : "Tom", "sex": "male"});
    YZDynamicCommon.reginsterPublicActionHandler(YZUserCodeHandler());

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: StatefulBuilder(builder: (BuildContext context, StateSetter stateSetter){
          return Center(
            child: Column(
              children: <Widget>[
               FlatButton(
                  color: Colors.black12,
                  onPressed: (){                
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
                      return UnitTestingList();
                    }));  
                  }, 
                  child: Text('Grammar and Unit testing\n\r(语法和示例)')
                ),                   
               FlatButton(
                  color: Colors.black12,
                  onPressed: (){                
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
                      return Helloworld();
                    }));  
                  }, 
                  child: Text('Hello world')
                ),   
                FlatButton(
                  color: Colors.black12,
                  onPressed: (){                
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
                      return YZDynamic.buildWidget(context, bestPraticeDsl, preConfig: null);
                    }));  
                  }, 
                  child: Text('Best Practice (最佳实践)')
                ),        
                Divider(thickness: 2),                                
                FlatButton(
                  color: Colors.black12,
                  onPressed: (){
                    YZDynamic.handle(
                      context, demoDsl, 
                      preConfig: YZDynamicPagePreConfig(
                        params: [
                          YZDynamicVariable(name: "key1", value: "value001"),
                          YZDynamicVariable(name: "key2", value: "value002"),
                        ],                        
                      )
                    );
                  }, 
                  child: Text('Demo: Present Nav Page')
                ),
                FlatButton(
                  color: Colors.black12,
                  onPressed: (){
                    YZDynamic.handle(
                      context, formDsl, 
                      preConfig: YZDynamicPagePreConfig(
                        params: [
                          YZDynamicVariable(name: "oldPhone", value: "13812345678")
                        ],                        
                      )
                    );
                  }, 
                  child: Text('Demo: Present Nav Form Page')
                ),
                FlatButton(
                  color: Colors.black12,
                  onPressed: (){                
                    YZDynamic.handle(
                      context, dialogDsl, 
                      preConfig: YZDynamicPagePreConfig(
                        params: [
                          YZDynamicVariable(name: "pigId", value: "1987764234"),
                          YZDynamicVariable(name: "key1", value: "value001"),
                          YZDynamicVariable(name: "key2", value: "value002"),
                        ],                        
                      )
                    );
                  }, 
                  child: Text('Demo: Present Dialog Page')
                ), 
                FlatButton(
                  color: Colors.black12,
                  onPressed: (){                
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
                      return YZDynamic.buildPage(context, demoDsl, preConfig: null);
                    }));  
                  }, 
                  child: Text('Demo: Present Page With Custom mode')
                )
              ],
            )
          );
        }),
      ),
    );
  }
}
