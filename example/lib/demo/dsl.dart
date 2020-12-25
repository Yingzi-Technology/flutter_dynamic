/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-18 11:36:25 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 17:58:24
 */

//-----------------flutter content----------------
/// Map里的正则表达式特殊字符需要转换，如$" 变成 \$"否则会报错
Map demoDsl =
{
  "page": {
    "key": "",
    "type": "",
    "name": "",
    "presentMode": "navpage", 
    "routeTag": "",    
    "rootWidget": _dslRootWidget,
    "entrane": {}, 
    "props": {},
    "xVar": {
      "initData": "Initialize Value"
    }, 
    "xActions": {}   
  }
};

Map dialogDsl = 
{
  "page": {
    "key": "",
    "type": "",
    "name": "",
    "presentMode": "dialog", 
    "routeTag": "",    
    "rootWidget": _dslRootWidget
  }
};

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
            "props": {"data": "自定义动态页导航"}
          }
        }
      },
      "body": {
        "xKey": "",
        "widgetName": "SafeArea",
        "props": {
          "child": {
            "xKey": "",
            "widgetName": "Padding",
            "props": {
              "padding": "[0,30,0,0]",
              "child": {
                "xKey": "",
                "widgetName": "Column",
                "props": {
                  "children": [
                    {
                      "xKey": "",
                      "widgetName": "SingleChildScrollView",
                      "props": {
                        "child": {
                          "xKey": "",
                          "widgetName": "Column",
                          "props": {
                            "children": [    
                              {
                                "xKey": "_StatefulWidget",
                                "widgetName": "StatefulWidget",
                                "props": {
                                  "build": container
                                }
                              },  
                              sizedBox,
                              textField,
                              sizedBox,
                              rawMaterialButton,
                              sizedBox,
                              text,
                              sizedBox,
                              forloop                          
                            ]
                          }
                        }
                      }
                    }
                  ]
                }
              }
            }
          }
        }
      }
    }      
  };
  

var sizedBox = {
  "xKey": "_SizedBox",
  "widgetName": "SizedBox",
  "props": {
    "height": "15"
  }
};

var text = {
  "xKey": "_Text",
  "type": "sysWidget",
  "widgetName": "Text",
  "props": {
    "data": "Click for 'TextField' value",
    "color": "0xff123456",
    "backgroundColor": "0xff00ff00",
    "fontSize": "16",
    "fontWeight": "bold",
    "lineHeight": "1.2",
    "maxLines": "2"
  },
  "xEvents": [
    {
      "eventType": "onClick",
      "code": '''
        var:<w:_Text>=var:<w:_TextField>;
        action:<w:_Text>.setState()
      '''
    }
  ]
};

var container = {
    "xKey": "_Container",
    "widgetName": "Container",
    "props": {
    "color": "0xfff2f2f2",
    "alignment": "topLeft",
    "margin": "[10, 0, 10, 0]",
    "height": "50",
    "child": {
      "type": "sysWidget",
      "widgetName": "Text",
      "props": {
        "data": "'Text' widget inside 'Container'",
        "color": "0xff123456",
        "backgroundColor": "0xff00ff00",
        "fontSize": "16",
        "fontWeight": "bold",
        "lineHeight": "1.2",
        "maxLines": "2"
      }
    }
  }
};

var textField = {
  "xKey": "_TextField", 
  "widgetName": "TextField",      
  "props": { 
    "style": {
      "color": "0xff000000",
      "fontWeight": "bold"
    },
    "keyboardType": "number",
    "value": "var:<g:person.name>",
    "decoration" : {          
      "hint": "'TextField' hint: Please enter value",
      "border": {
        "color": "0xffffff00",
        "width": "2"
      }
    }        
  }   
};

var rawMaterialButton = {
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
  },
  "xEvents": [
    {
      "eventType": "onClick",
      "code": '''
        switch(<w:_TextField>) {
          case 1:{
            action:scheme/yzToast?tip=>>case1 once;
            action:scheme/yzToast?tip=>>case1 twice
          }
          case 2:{
            action:scheme/yzToast?tip=>>case2
          }
          default:{            
            action:scheme/yzToast?tip=>>default
          }
        };
        var:<c:isEq>=action:Sys.==({"value":"1", "value1":"<w:_TextField>"});
        if(<c:isEq>){
          action:scheme/Sys.print?value=eq
        }else{
          action:scheme/Sys.print?value=not eq
        }
      '''
    },
    {
      "eventType": "onLongPress",
      "code": '''
        var:<c:isTextFieldNotEmpty>=action:String.isNotEmpty({"value":"var:<w:_TextField>"});
        if(<c:isTextFieldNotEmpty>){
          var:<w:_TextField>=LongPress _TextField is Not Empty;
          action:scheme/yzToast?tip=_TextField is Not Empty!
        }else{
          var:<w:_TextField>=LongPress _TextField is Empty;
          action:scheme/yzToast?tip=_TextField is Empty!
        }
      '''
    }       
  ]
};

var forloop = {
  "xKey": "_forloop",
  "widgetName": "RawMaterialButton",
  "props": {
    "fillColor": "0xfff2f2f2",
    "padding": "[10,0,10,0]",
    "child": {
      "type": "sysWidget",
      "widgetName": "Text",
      "props": {
        "data": "ForLoop(Input TextField or lenth)",
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
        var:<c:length>=<w:_TextField>;
        var:<c:result>=100;
        for (int i = 0, i < var:<c:length>, i+=2) {
          <c:result>=action:scheme/num.+?value=<c:result>&value1=<c:i>;
          action:scheme/Sys.print?value=<c:i>
        };  
        action:scheme/Sys.print?value=<c:result>
      '''
    }
  ]
};

//-----------------special form content----------------

Map formDsl = {
  "page": {
    "key": "resetPhone",
    "type": "formpage",
    "name": "",
    "presentMode": "navpage",
    "routeTag": "",
    "entrane": { }, 
    "props": { },
    "xVar": {
      "index":"1",
      "total": "",
      "pageOldPhone": "<p:oldPhone>"      
    },
    "xActions": {}      
  }, 
  "navbar": {
    "xKey": "navbar", 
    "widgetName": "navbar",      
    "props": { 
      "title": "更换手机号码"
    }      
  },  
  "submit": {

  },
  "children": [   
    {
      "xKey": "phoneInput", 
      "widgetName": "TextField",      
      "props": { 
        "style": {
          "color": "0xff333333",
          "fontWeight": "bold"
        },
        "keyboardType": "number",
        "decoration" : {          
          "hint": "请输入手机号码",
          "border": {
            "color": "0xffffff00",
            "width": "2"
          }
        }        
      }            
    }, 
    {
      "xKey": "id0033", 
      "widgetName": "Container",      
      "props": { 
        "color": "0xfff1f1f1",
        "alignment": "topLeft",
        "padding": "[10, 10, 0, 0]",
        "height": "44",
        "child": {
            "type": "sysWidget",
            "widgetName": "Text", 
            "props": {
              "data": "点击获取手机号码",
              "color": "0xfff1f1f1",
              "backgroundColor": "0xfff1f1f1",
              "fontSize": "16",
              "fontWeight": "bold",
              "lineHeight": "1.2",
              "maxLines": "2"
            }    
        }, 
        "children": []
      },
      "xEvents": [
        {
          "name": "",
          "eventType": "onClick",
          "code": '''
            var:<c:printStr>=action:String.+({"value":"Click事件直接执行获取手机号码：","value1":"<w:phoneInput>"});
            var:<c:printStr>=`Print:var:<c:printStr>`;
            action:Sys.print({"value":"var:<c:printStr>"});
            var:<w:phoneOutput>=var:<w:phoneInput>;
            action:{"targetKey":"phoneOutput","name":"setState"};
            var:<p:total>=action:num.+({"value":"<p:index>","value1":"2"});
            action:Sys.print({"value":"<p:total>"})            
            '''
        }  
      ]           
    },
    {      
      "widgetName": "Container",      
      "props": { 
        "color": "0xfff1f1f1",
        "alignment": "topLeft",
        "padding": "[10, 10, 0, 0]",
        "height": "50",
        "child": {
            "xKey": "phoneOutput", 
            "type": "sysWidget",
            "widgetName": "Text", 
            "props": {
              "data": "显示输入的手机号码",
              "fontSize": "16",
              "fontWeight": "bold",
              "lineHeight": "1.2"
            }    
        }
      }
    }        
  ] 
};