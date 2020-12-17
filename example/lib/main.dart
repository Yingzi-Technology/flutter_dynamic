/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-03 09:35:13     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-16 17:41:19
**/   
import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'demo/config.dart';
import 'demo/dsl.dart';
import 'demo/helloworld.dart';
import 'grammar/unittesting.dart';

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
    
    print('----------${bool.fromEnvironment("dart.vm.product")}');

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
                    YZDynamic.handle(
                      context, demoDsl, 
                      preConfig: YZDynamicPagePreConfig(
                        params: [
                          YZDynamicVariable(name: "pigId", value: "1987764234"),
                          YZDynamicVariable(name: "key1", value: "value001"),
                          YZDynamicVariable(name: "key2", value: "value002"),
                        ],                        
                      )
                    );
                  }, 
                  child: Text('Present Nav Page')
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
                  child: Text('Present Nav Form Page')
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
                  child: Text('Present Dialog Page')
                ), 
                FlatButton(
                  color: Colors.black12,
                  onPressed: (){                
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
                      return YZDynamic.build(context, demoDsl, preConfig: null);
                    }));  
                  }, 
                  child: Text('Present Page With Custom mode')
                )
              ],
            )
          );
        }),
      ),
    );
  }
}
