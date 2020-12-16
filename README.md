# flutter_dynamic
flutter_dynamic 是一个能动态创建Flutter应用的引擎。
The flutter_dynamic is an engine that create flutter application dynamically .

## 目录 Table of contents
* [General-info概况](#General-info)
* [Install 安装](#Install)
* [Get-started 使用](#Get-started 使用)
* [Contact 联系](#Contact)

## General-info 概况

> 有时候在产品开发的过程中需要远程动态地创建表单或更新某个表单应用，但Flutter框架不像javascript动态语言可以远程下发并动态执行脚本，也不像Android或iOS平台的java或objective c语言支持动态热更新或动态语言特性等，甚至在Flutter中限制了Dart语言的反射特性，所以基于Flutter来做动态页面就显得很有局限性。开发flutter_dynamic引擎一是为了满足产品需要远程动态创建表单应用的需求，二是借此机会探索Flutter更广泛的动态特性实现方案；目前这个引擎还处在不断完善阶段，难免会有缺陷。

> 本引擎主要包括以下几个方面：
--提供高度类似Flutter系统的Widget类型，以满足构造UI所需的Widget库；并提供自定义Widget扩展引擎，满足开发者自定义基于本引擎解释的Widget类型；
--提供variable变量解释引擎，提供类似Dart基本类型语法，满足类似变量定义、类属性定义等；
--提供action方法解释引擎，提供类似Dart方法语法，满足类似方法调用；
--提供code代码解释引擎，提供类似Dart关系运算、逻辑运算、控制流程等语法，满足写基本的代码逻辑；
--提供event事件解释引擎，提供类似Flutter的事件处理；

## Install 安装
#### 1. Depend on it
Add this to your package's pubspec.yaml file:
```
dependencies:
  yingzi_flutter_dynamicpage:
  	git:
		url: https://github.com/fisherjoe/flutter_dynamic.git
		ref: master
```
Or 
Download or clone the code  to the local:
```
dependencies:
  yingzi_flutter_dynamicpage:
  	path: your/code/path
```
Or
Do as example of code.

#### 2. Use it

Use as common flutter plugin in  flutter project.

#### 3. Import it
Now in your Flutter code, you can use:
```dart
import 'package:yingzi_flutter_dynamicpage/yz_dynamicpage.dart';
```

## Get-started 使用
> flutter_dynamic是完全开源的，在代码中的example里也已经具有完整的示例，以下针对核心的流程一一说明：

#### Hello world

```dart
import 'package:flutter/material.dart';
import 'package:yingzi_flutter_dynamicpage/yz_dynamicpage.dart';

class Helloworld extends StatefulWidget {
  @override
  _HelloworldState createState() => _HelloworldState();
}

class _HelloworldState extends State<Helloworld> {
  @override
  Widget build(BuildContext context) {
    return YZDynamicPage.build(
      context, 
      hwDsl, 
    );
  }
}

Map hwDsl =
{
  "page": {
    "key": "",
    "type": "",
    "name": "",
    "presentMode": "navpage", 
    "routeTag": "",    
    "rootWidget": {
      "xKey": "",
      "widgetName": "Scaffold",
      "props": {
        "appBar": {
          "xKey": "",
          "widgetName": "AppBar",
          "props": {
            "title": {
              "widgetName": "Text",
              "props": {"data": "Navigator"}
            }
          }
        },
        "body": {
          "xKey": "",
          "widgetName": "SafeArea",
          "props": {
            "child": {
              "xKey": "_Text",
              "widgetName": "Text",
              "props": {
                "data": "Hello world"
              }
            }
          }
        }
      }      
    },
    "entrane": {}, 
    "props": {},
    "xVar": {
      "initData": "Init data"
    }, 
    "xActions": {}   
  }
};
```

## More Document ... ...
> Feel apologetic that we update the document slowly for the work time reason.

## Contact
Created by [@153768151@qq.com](https://github.com/fisherjoe) - feel free to contact me
