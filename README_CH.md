# flutter_dynamic
flutter_dynamic 是一个能动态创建Flutter应用的引擎。flutter_dynamic不但支持写UI，还支持写代码逻辑。  
EN: The flutter_dynamic is an engine that create flutter application dynamically. flutter_dynamic not only supports writing UI, but also writing code logic.

* [中文文档](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/README_CH.md)     
* [English Document](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/README.md)

* [Github地址](https://github.com/Yingzi-Technology/flutter_dynamic)
* [153768151@qq.com](https://github.com/fisherjoe) - feel free to contact me

## Best practice
> 动态创建类似有UI和交互的页面。如果你已经阅读了该文档，可以跟着我们一步步创建一个有趣的动态页面。[Best practice](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/doc/bestpratice.md)

<img src="https://upload-images.jianshu.io/upload_images/3868052-24e08253efeff413.gif?imageMogr2/auto-orient/strip" width="320px"/>

## 目录 Table of contents
* [General-info概况](#General-info)
* [Install 安装](#Install)
* [Get-started 使用](#Get-started)
* [Grammar 语法](#Grammar)
* [Widgets 组件](#Widgets)
* [Customize-Widget 自定义组件](#Customize-Widget)
* [Customize-Grammar 自定义语法](#Customize-Grammar)
* [Contact 联系](#Contact)

## General-info

> 有时候在产品开发的过程中需要远程动态地创建表单或更新某个表单应用，但Flutter框架不像javascript动态语言可以远程下发并动态执行脚本，也不像Android或iOS平台的java或objective c语言支持动态热更新或动态语言特性等，甚至在Flutter中限制了Dart语言的反射特性，所以基于Flutter来做动态页面就显得很有局限性。开发flutter_dynamic引擎一是为了满足产品需要远程动态创建表单应用的需求，二是借此机会探索Flutter更广泛的动态特性实现方案；目前这个引擎还处在不断完善阶段，难免会有缺陷。  

> 本引擎主要包括以下几个方面：  
--提供高度类似Flutter系统的Widget类型，以满足构造UI所需的Widget库；并提供自定义Widget扩展引擎，满足开发者自定义基于本引擎解释的Widget类型；  
--提供variable变量解释引擎，提供类似Dart基本类型语法，满足类似变量定义、类属性定义等；  
--提供action方法解释引擎，提供类似Dart方法语法，满足类似方法调用；  
--提供code代码解释引擎，提供类似Dart关系运算、逻辑运算、控制流程等语法，满足写基本的代码逻辑；  
--提供event事件解释引擎，提供类似Flutter的事件处理；   

## Install
#### step 1. Depend on it
```
dependencies:
  yz_flutter_dynamic:
    git:
      url: https://github.com/fisherjoe/flutter_dynamic.git
      ref: master
```
Or 
Download or clone the code  to the local:
```
dependencies:
  yz_flutter_dynamic:
    path: your/code/path
```
Or
Do as example of code.

#### step 2. Use it

Use as common flutter plugin in  flutter project.

#### step 3. Import it
Now in your Flutter code, you can use:
```dart
import 'package:yz_flutter_dynamic/main.dart';
```

## Get-started
> flutter_dynamic是完全开源的，在代码中的example里也已经具有完整的示例，以下针对核心的流程说明：

#### Hello world

```dart
import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

class Helloworld extends StatefulWidget {
  @override
  _HelloworldState createState() => _HelloworldState();
}

class _HelloworldState extends State<Helloworld> {
  @override
  Widget build(BuildContext context) {
    return YZDynamic.buildWidget(
      context, 
      hwDsl, 
    );
  }
}

Map hwDsl =
{
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
};
```
### How to create your dynamic widget
>我们认为Flutter的任何页面或组件都是StatefulWidget，所以当我们无论创建一个新页面或组件时我们都把它当作一个StatefulWidget来看待。页面和StatefulWidget是一样。

***step1: How to create widget UI***

invoke
```dart
YZDynamic.buildPage(context, json, preConfig: preConfig);
```

json
```dart
{
  "xKey": "globalKeyOfWidget", 
  "widgetName": "Container",      
  "props": { 
  "padding": "[10, 10, 0, 0]",
  "height": "44",
  "child": {
    "widgetName": "Text", 
    "props": {
      "data": "Data of Text widget",
      "color": "0xfff1f1f1"
    }    
  }
  },
  "xEvents": [
  {
    "eventType": "onClick",
    "code": '''
      [code...]      
    '''
  },
  "xVar": {
  
  }
  ]           
}
```
> 上面的代码较完整地呈现了一个构造一个widget的json数据。其中rootWidget的值描述了该widget的根结点Container，返回StatefulWidget包裹的Container。下面将主要对各属性一一说明：  

- `xKey`：The globalkey of widget to find the widget.

- `widgetName`: The type of widget.

- `xEvents`:  The event of the widget support "onClick" type now. The value support grammar as [Grammar 语法](#Grammar)

- `xVar`: Define the variable of widget.

- `props`: The properties of the widget which property is the same as system of widget's property. There are two types of props value such as : 
	- **string**:  The type of  property value  like "color" "width" should use string type {"widget":"100", "color": "#ff000000"}. Specially the type of EdgeInsets will be "[10, 20, 30, 40]" for "[left, top, right, bottom]". The enum of type will be like "multiline" for TextInputType.multiline
	- **map**: The type of property value like "Size" will be {"color":"", "width":""}.

***step2: How to create page***
> 创建page UI和创建widget UI是一样的，同时它们的json数据也是通用的，widget是page的简单化版。 

invoke build page
```dart
YZDynamic.buildPage(context, json, preConfig: preConfig);
```

invoke present page
```dart
YZDynamic.handle(context, json, preConfig: preConfig)
```

json
```dart
{
    "page": {
        "key": "",
        "presentMode": "",
        "state": {
            "initState": [ 
            ], 
            "build": [ 
            ],
            "dispose": [ 
            ]
        },
        "xVar":{},
        "rootWidget": {}
    }
}
```

> 上面的代码较完整地呈现了一个构造一个page的json数据。  page属性里有些和widget不致，下面一一说明：  

- `key`：The globalkey of page.

- `presentMode`: The present mode of page. The  value is "dialog / navpage".Use for YZDynamic.handle invocation only.

- `state`: The lifecycle of page which is as good as the system StatefulWidget.

- `xVar`: Define the variable of widget.

- `rootWidget`: The root widget of page. It is similay to the return widget of StatefulWidget's build method.

***step3: How to write code***
> flutter_dynamic提供了一套仿Dart语言的伪代码code, 通过伪代码code可以实现页面更加复杂的逻辑。code可以定义变量、控制流程、获取不同组件之间数据、调用Flutter system api等等能力。json数据的以下地方可以使用code：[Grammar 语法](#Grammar)


- code of property: such as event config {"eventType": "onClick", "code": \`\`\` [code...] \`\`\`}
- other value: start with "code:", such as {"color": \`\`\` code: [code...] \`\`\`}


***step4: How to use variables***
> 伪代码code变量有四种作用域：分别是页面作用域、组件作用域、code块作用域；使用变量的方式分别是：&lt;p:variableName&gt;、&lt;w:variableName&gt;、&lt;c:variableName&gt;。有如下方式可以初始化变量：

- 在page/widget对象的xVar属性中定义，如："xVar": {"variableName": "variableValue"}；
- 在code中定义，如：\`\`\`&lt;c:variableName&gt;=Int(10); &lt;w:variableName2&gt;=String(Hellow world)\`\`\`；

注意：伪代码code变量没有变量类型。如果赋值时没有强制说明类型则自动默认为字符串，使用的时候会根据特定需要自动转换。

***step5: How to implement event***
> 引擎提供了一套简单的事件处理机制xEvent。通过事件处理机制可以定义事件及实现事件的逻辑。
事件的逻辑是通过伪代码code来实现的。


##  Grammar
在源代码的example里有写动态页面的伪代码语法，如图所示：

![Simulator Screen Shot - iPhone 12 - 2020-12-17 at 09.22.41.png](https://upload-images.jianshu.io/upload_images/3868052-917c8c2720d84fe9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/360)

## Widgets
> 目前我们支持如下Widget。  

[Container](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Text](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[TextField](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Column](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Expanded](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Image](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Padding](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Row](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[SafeArea](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[SingleChildScrollView](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Scaffold](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[AppBar](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[RawMaterialButton](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[SizedBox](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  
[Dialog](https://github.com/Yingzi-Technology/flutter_dynamic/tree/master/lib/widgets)  

## Customize-Widget
> 当引擎提供的组件不满足使用需求时，可以通过扩展组件的方式添加自定义的组件。自定义组件的方式如下，或者参考 [Container](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/lib/widgets/container.dart)：

Define CustomerWidget
```dart
/// CustomerWidget handler
class YZCustomerWidgetHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'CustomerWidget';

  @override
  Widget build(Map<String, dynamic> json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget {

  final Map<String, dynamic> json;

  _Builder(this.json, {Key key}): super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {

  //Deal with props / 处理控件属性
  Map props;
  Alignment _alignment;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = super.config.props;
    _alignment = YZDinamicWidgetUtils.alignmentAdapter(props["alignment"]);   
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    CustomerWidget _subwidget = CustomerWidget(
      alignment: _alignment,
    );  

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
    actionFunctions['setState'] = stateSetter; 
  }

  void stateSetter({
      Map params, 
      YZDynamicRequest request,
      List<YZDynamicActionRule> rules,
      Map localVariables,
      State state,
    }) {
    print('Execute xAction: ${this.runtimeType} setState');
    if (mounted) {
      setState(() {});
    }
  }

}
```

Register CustomerWidget
```dart
YZDynamicCommon.reginsterWidgetHandler(YZCustomerWidgetHandler)
```

User CustomerWidget
```dart
{
  "xKey": "globalKeyOfWidget", 
  "widgetName": "CustomerWidget",      
  "props": { 
 	 "alignment": "[10, 10, 0, 0]"
  },
  "xEvents": [
  {
    "eventType": "onClick",
    "code": '''
      [code...]      
    '''
  },
  "xVar": {
  
  }
  ]           
}
```


## Customize-Grammar
> 当引擎提供的伪代码语法不满足使用需求时，可以通过扩展action的方式添加自定义的语法。  

Define action
```dart
/*
 * Custum action
 * 自定义 action 
 */
class YZToastHandler extends YZDynamicPublicActionHandler{
  @override
  void action(BuildContext context, {
      Map params, 
      YZDynamicRequest request,
      List<YZDynamicActionRule> rules,
      Map localVariables,
      State state,
    }) {
      String tip = params['tip'];
      Fluttertoast.showToast(
        msg: tip,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  String get actionName => 'yzToast';

}
```

Register action
```dart
YZDynamicCommon.reginsterPublicActionHandler(YZToastHandler());
```

User action
```dart
yzToast(tip:content);
```


## Contact
Created by [153768151@qq.com](https://github.com/fisherjoe) - feel free to contact me
