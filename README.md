# flutter_dynamic
flutter_dynamic 是一个能动态创建Flutter应用的引擎。flutter_dynamic不但支持写UI，还支持写代码逻辑。    
EN: The flutter_dynamic is an engine that create flutter application dynamically. flutter_dynamic not only supports writing UI, but also writing code logic.

* [中文文档](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/README_CH.md)     
* [English Document](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/README.md) 

* [Github地址](https://github.com/Yingzi-Technology/flutter_dynamic)
* [153768151@qq.com](https://github.com/fisherjoe) - feel free to contact me

[![Stargazers over time](https://starchart.cc/Yingzi-Technology/flutter_dynamic.svg)](https://starchart.cc/Yingzi-Technology/flutter_dynamic)

## Best practice
> Dynamically create similar UI and interactive pages. If you have read the document, you can follow us step by step to create an interesting dynamic page. [Best practice](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/doc/bestpratice.md)


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

> In the process of product development, pages need to be dynamically created remotely. But the Flutter framework is not like the javascript dynamic language that can remotely issue and dynamically execute scripts, nor is it like the Android or iOS platform's java or objective c language that supports dynamic hot updates or dynamic language features, and even limits the reflection of the Dart language in Flutter Features, so dynamic pages based on Flutter are very limited. The flutter_dynamic engine was developed to meet the needs of products that need to dynamically create form applications remotely, and the second is to take this opportunity to explore the implementation of Flutter's broader dynamic characteristics; currently this engine is still in the stage of continuous improvement, and it is inevitable that there will be defects.  

> This engine mainly includes the following aspects:  
--Provide a Widget type that is highly similar to the Flutter system to meet the Widget library required to construct a UI; and provide a custom Widget extension engine to meet the needs of developers to customize the Widget type based on this engine's interpretation;  
--Provide variable variable interpretation engine, provide basic type syntax similar to Dart, satisfy similar variable definition, class attribute definition, etc.;  
--Provide action method interpretation engine, provide similar Dart method syntax, satisfy similar method calls;  
--Provide code code interpretation engine, provide similar Dart relational operations, logical operations, control flow and other grammars to satisfy basic code logic;  
--Provide event event interpretation engine, provide event processing similar to Flutter;  

## Install
#### step 1. Depend on it
Add this to your package's pubspec.yaml file:
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
> flutter_dynamic is completely open source, and there are complete examples in the example in the code. The following is a description of the core process:

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
> We think that any page or component of Flutter is a StatefulWidget, so when we create a new page or component, we treat it as a StatefulWidget. The page is the same as StatefulWidget.

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
> The above code completely presents a json data for constructing a widget. The value of rootWidget describes the root node Container of the widget, and returns the Container wrapped by the StatefulWidget. The following will mainly explain each attribute one by one:  

- `xKey`：The globalkey of widget to find the widget.

- `widgetName`: The type of widget.

- `xEvents`:  The event of the widget support "onClick" type now. The value support grammar as [Grammar 语法](#Grammar)

- `xVar`: Define the variable of widget.

- `props`: The properties of the widget which property is the same as system of widget's property. There are two types of props value such as : 
	- **string**:  The type of  property value  like "color" "width" should use string type {"widget":"100", "color": "#ff000000"}. Specially the type of EdgeInsets will be "[10, 20, 30, 40]" for "[left, top, right, bottom]". The enum of type will be like "multiline" for TextInputType.multiline
	- **map**: The type of property value like "Size" will be {"color":"", "width":""}.

***step2: How to create page***
> Creating page UI is the same as creating widget UI. At the same time, their json data is also common. Widget is a simplified version of page.

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

> The above code completely presents a json data that constructs a page. Some of the page attributes are inconsistent with widgets, as explained below:

- `key`：The globalkey of page.

- `presentMode`: The present mode of page. The  value is "dialog / navpage".Use for YZDynamic.handle invocation only.

- `state`: The lifecycle of page which is as good as the system StatefulWidget.

- `xVar`: Define the variable of widget.

- `rootWidget`: The root widget of page. It is similay to the return widget of StatefulWidget's build method.

***step3: How to write code***
> flutter_dynamic provides a set of pseudo-code code that imitates the Dart language, through which more complex logic of the page can be realized. The code can define variables, control the process, obtain data between different components, call the Flutter system api, and so on. The code can be used in the following places of json data: [Grammar 语法](#Grammar)


- code of property: such as event config {"eventType": "onClick", "code": \`\`\` [code...] \`\`\`}
- other value: start with "code:", such as {"color": \`\`\` code: [code...] \`\`\`}


***step4: How to use variables***
> Pseudo-code code variables have four scopes: page scope, component scope, code block scope; the ways to use variables are: &lt;p:variableName&gt;, &lt;w:variableName&gt;, &lt;c: variableName&gt;. There are the following ways to initialize variables:

- Defined in the xVar attribute of the page/widget object, such as: "xVar": {"variableName": "variableValue"}；
- Defined in code, such as: \`\`\`&lt;c:variableName&gt;=Int(10); &lt;w:variableName2&gt;=String(Hellow world)\`\`\`；

Note: The pseudo-code code variable has no variable type. If the type is not mandatory when assigning, it will automatically default to a string, and will be automatically converted according to specific needs when used.

***step5: How to implement event***
> The engine provides a set of simple event handling mechanism xEvent. The event processing mechanism can define events and realize the logic of events.
The logic of the event is realized by pseudo-code code.



##  Grammar
In the example of the source code, there is pseudo code syntax for writing dynamic pages, as shown in the figure:  

![Simulator Screen Shot - iPhone 12 - 2020-12-17 at 09.22.41.png](https://upload-images.jianshu.io/upload_images/3868052-917c8c2720d84fe9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/360)


## Widgets
> Currently we support the following widgets.

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
> When the components provided by the engine do not meet the usage requirements, you can add custom components by extending the components. The way to customize components is as follows, or refer to [Container](https://github.com/Yingzi-Technology/flutter_dynamic/blob/master/lib/widgets/container.dart)：

Define CustomerWidget
```dart
/// CustomerWidget handler
class YZCustomerWidgetHandler extends YZDynamicBasicWidgetHandler {

  @override
  String get widgetName => 'CustomerWidget';

  @override
  Widget build(Map json, {Key key, BuildContext buildContext}) {
    return _Builder(json, key:key);
  }
  
}

class _Builder extends YZDynamicBaseWidget {

  final Map json;

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
> When the pseudo-code syntax provided by the engine does not meet the usage requirements, you can add a custom syntax by extending the action.  

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
