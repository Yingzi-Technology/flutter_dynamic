/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-21 16:54:50 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-21 17:58:51
 */

Map bestPraticeDsl = _dslRootWidget;

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

var _textFieldA = {
  "xKey": "_TextFieldA", 
  "widgetName": "TextField",      
  "props": { 
    "value": "I am TextFieldA",
    "style": {
      "color": "0xff000000",
      "fontWeight": "bold"
    },
    "keyboardType": "number",
    "decoration" : {          
      "hint": "I am TextFieldA"
    }        
  }   
};

var _textFieldB = {
  "xKey": "_TextFieldB", 
  "widgetName": "TextField",      
  "props": { 
    "style": {
      "color": "0xff000000",
      "fontWeight": "bold"
    },
    "decoration" : {          
      "hint": "I am TextFieldB"
    }        
  }   
};

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
