/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 12:00:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 16:26:07
 */

getDemoDsl(String code) {

  code = code.trim();

  var result;
  if (code.startsWith('userCode:')) {
    result = code;
  } else {
    result = '''code:
        $code
        var:<c:r>=`The result is: var:<c:ret>`;      
        action:Sys.print(var:<c:r>);        
        action:String(var:<c:ret>)
      ''';

    if (!code.startsWith("var")) {
      code = "var:<c:ret>=$code;";
    } else if (!code.endsWith(';')){
      code = '$code;';
    }      
  }

  var text = {
    "xKey": "_Text",
    "type": "sysWidget",
    "widgetName": "Text",
    "props": {
      "data": "var:<w:_Text.result>",
    },
    "xVar": {
      "result": result
    }
  };

  var tip = {
    "xKey": "_TextTip",
    "type": "sysWidget",
    "widgetName": "Text",
    "props": {
      "data": "如果希望显示语句结果，需要把语句结果赋值给<c:ret>，如<c:ret>=num.+(1,2)；\n\r输出结果如下：\n\r",
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
            "props": {"data": "Demo"}
          }
        }
      },
      "body": {
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
                      tip,
                      text,                        
                    ]
                  }
                }
              }
            }
          ]
        }
      }
    }      
  };

  Map demoDsl = 
  {
    "page": {
      "presentMode": "dialog",  
      "rootWidget": _dslRootWidget
    }
  };  

  return demoDsl;

}

