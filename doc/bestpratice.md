## Best Practice (最佳实践)
> 此文档我们将一步步按展示如何使用flutter_dynamic完成动态创建页面的过程。如果想看真实的效果，请运行example工程里的Best Practice。  


<img src="https://upload-images.jianshu.io/upload_images/3868052-25b56bac819efb4a.gif?imageMogr2/auto-orient/strip" width="320px"/>


### Step 1
> 先创建具有两个输入框和一个按扭的描述UI的数据；


TextFieldA
```dart
var _textFieldA = {
  "xKey": "_TextFieldA", 
  "widgetName": "TextField",      
  "props": { 
    "style": {
      "color": "0xff000000",
      "fontWeight": "bold"
    },
    "keyboardType": "number",
    "value": "Input",
    "decoration" : {          
      "hint": "I am TextFieldA",
      "border": {
        "color": "0xffffff00",
        "width": "2"
      }
    }        
  }   
};
```

TextFieldB
```dart
var _textFieldB = {
  "xKey": "_TextFieldB", 
  "widgetName": "TextField",      
  "props": { 
    "style": {
      "color": "0xff000000",
      "fontWeight": "bold"
    },
    "value": "Input",
    "decoration" : {          
      "hint": "I am TextFieldB",
      "border": {
        "color": "0xffffff00",
        "width": "2"
      }
    }        
  }   
};
```

button
```dart
var _button = {
  "xKey": "_RawMaterialButton",
  "widgetName": "RawMaterialButton",
  "props": {
    "fillColor": "0xfff2f2f2",
    "padding": "[10,0,10,0]",
    "child": {
      "type": "sysWidget",
      "widgetName": "Text",
      "props": {
        "data": "'RawMaterialButton'. Click",
        "color": "0xff123456",
        "backgroundColor": "0xff00ff00",
        "fontSize": "16",
        "fontWeight": "bold",
        "lineHeight": "1.2"
      }
    }
  }
};
```

### Step 2
> 为了更好地演示效果，我们需要将Step 1的json数据放在Scaffold类型的Material widget里，并通过单独的页面来展示它：


```dart
var _dslRootWidget = {
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
          "xKey": "",
          "widgetName": "Column",
          "props": {
            "children": [
              _textFieldA,
              _textFieldB,
              _button                
            ]
          }
        }
      }
    }
  }      
};
```

### Step 3
> 通过Step 1和Step 2，我们就可以创建一个完整的UI了。具体效果见example/lib/main.dart里的Best Practice演示效果：

```dart

Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext contex){
	return YZDynamic.buildWidget(context, bestPraticeDsl, preConfig: null);
}));

```

### Step 4
> 如果点击button的时候需要获取TextFieldA和TextFieldB的值，我们该如何实现呢？很简单，在button json里加入如下定义就可以了：

event
```dart
 "xEvents": [
    {
      "eventType": "onClick",
      "code": '''
      <c:valueA>=<w:_TextFieldA>;
      action:yzToast(tip:<c:valueA>)
      '''
    }       
  ]

```

and button json will show as:
```dart
var _button = {
  "xKey": "_RawMaterialButton",
  "widgetName": "RawMaterialButton",
  "props": {
    "fillColor": "0xfff2f2f2",
    "padding": "[10,0,10,0]",
    "child": {
      "type": "sysWidget",
      "widgetName": "Text",
      "props": {
        "data": "Button",
        "color": "0xff123456",
        "backgroundColor": "0xff00ff00",
        "fontSize": "16",
        "fontWeight": "bold",
        "lineHeight": "1.2"
      }
    }
  },
  "xEvents": [
    {
      "eventType": "onClick",
      "code": '''
      <c:valueA>=<w:_TextFieldA>;
      action:yzToast(tip:<c:valueA>)
      '''
    }       
  ]
}; 
```

### Step 5
> Building more wonderful application, Please read [Document](https://github.com/Yingzi-Technology/flutter_dynamic)
