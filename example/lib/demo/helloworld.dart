/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-16 17:29:08 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-07-15 13:53:26
 */

import 'dart:convert';

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
      json.decode(json.encode(hwDsl)),
      // _listViewDsl
    );
  }
}

Map hwDsl = {
  "xKey": "",
  "widgetName": "Scaffold",
  "props": {
    "appBar": {
      "xKey": "",
      "widgetName": "AppBar",
      "props": {
        "title": {
          "widgetName": "Text",
          "props": {
            "data": "Navigator Adapter",
            "fontColor": "0xffff00ff", 
            "bgColor": "0xff00ff00",
            "fontSize" : "18",
            "fontWeight" : "bold",
            "textAlign" : "right",
            "overflow" : "",
            "maxLines" : "",
          }
        }
      }
    },
    "body": {
      "xKey": "",
      "widgetName": "SafeArea",
      "props": {
        "child": {
          "xKey": "_Container",
          "widgetName": "Container",
          "props": {
            "child": {
              "xKey": "_Text",
              "widgetName": "Text",
              "props": {"data": "Hello world"}
            }
          },
          "xEvents": [
            {
              "eventType": "onClick",
              "code": '''
      action:yzToast(tip:'123')
      '''
            },     
            {
              "eventType": "onLongPress",
              "actions": [
                {
                  "name": "action01",
                  "targetKey": ""
                },   
                {
                  "name": "action02",
                  "targetKey": ""
                }                   
              ]
            },             
            {
              "name": "a",
              "eventType": "onClick",
              "code": '''
      action:yzToast(tip:'123')
      '''
            },
            {
              "name": "b",
              "eventType": "onClick",
              "code": '''
      action:yzToast(tip:'123')
      '''
            },
            {
              "name": "b",
              "eventType": "onLongPress",
              "actions": [
                {
                  "name": "action1",
                  "targetKey": ""
                },   
                {
                  "name": "action2",
                  "targetKey": ""
                }                   
              ]
            }                  
          ]          
        }
      }
    }
  }
};

//wrap demo
Map wrapDsl = {
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
      "widgetName": "Wrap",
      "props": {
        "children": [text, text, text, text, text, text, text, text],
        "spacing": "10",
        "runSpacing": "10"
      }
    }
  }
};

var text = {
  "widgetName": "Container",
  "props": {
    "padding": "[10, 10, 0, 0]",
    "height": "44",
    "width": "54",
    "color": "0xfff5f5f5",
    "child": {
      "widgetName": "Text",
      "props": {"data": "Data of Text widget", "color": "0xfff1f1f1"}      
    }
  }
};

//stack positioned demo
Map stackPositionedDsl = {
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
      "widgetName": "Stack",
      "props": {
        "children": [ct, psd],
      }
    }
  }
};

var ct = {
  "widgetName": "Container",
  "props": {
    "height": "100",
    "width": "100",
    "color": "0xff33D43D",
    "child": {
      "widgetName": "Text",
      "props": {"data": "", "color": "0xfff1f1f1"}
    }
  }
};

var psd = {
  "widgetName": "Positioned",
  "props": {
    "top": "10",
    "left": "0",
    "child": {
      "widgetName": "Text",
      "props": {"data": "1234", "color": "0xff333333"}
    }
  }
};

Map offstageDsl = {
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
      "widgetName": "Offstage",
      "props": {
        "offstage": "true",
        "child": {
          "widgetName": "Text",
          "props": {"data": "123", "color": "0xfff1f1f1"}
        }
      }
    }
  }
};

Map alignDsl = {
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
      "widgetName": "Container",
      "props": {
        "height": "200",
        "width": "200",
        "color": "0xff33D43D",
        "child": {
          "widgetName": "Align",
          "props": {
            "alignment": "topCenter",
            "child": {
              "widgetName": "Text",
              "props": {"data": "123", "color": "0xfff1f1f1"}
            }
          }
        }
      }
    }
  }
};

Map centerDsl = {
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
      "widgetName": "Container",
      "props": {
        "height": "200",
        "width": "200",
        "color": "0xff33D43D",
        "child": {
          "widgetName": "Center",
          "props": {
            "child": {
              "widgetName": "Text",
              "props": {"data": "123", "color": "0xfff1f1f1"}
            }
          }
        }
      }
    }
  }
};

//stack ListView demo
Map listViewDsl = {
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
      "widgetName": "ListView",
      "props": {
        "children": [
          ct,
          text,
          ct,
          text,
          ct,
          text,
          ct,
          text,
          ct,
          text,
          ct,
          text
        ],
      }
    }
  }
};

//复选框demo
Map checkboxDsl = {
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
          "xKey": "Checkbox",
          "widgetName": "Checkbox",
          "props": {
            "value": "true",
            "activeColor": "0xff33D43D",
          }
        }
      }
    }
  }
};

//单选框demo
Map radioDsl = {
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
          "xKey": "Radio",
          "widgetName": "Radio",
          "props": {
            "value": "12",
            "groupValue": "122",
            "activeColor": "0xff33D43D",
            "focusColor": "0xffF56D58",
            "hoverColor": "0xff1C67FF",
          }
        }
      }
    }
  }
};

Map gestureDetectorDsl = {
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
      "widgetName": "Container",
      "props": {
        "height": "200",
        "width": "200",
        "color": "0xff33D43D",
        "child": {
          "widgetName": "GestureDetector",
          "props": {
            "child": {
              "widgetName": "Text",
              "props": {"data": "GestureDetector", "color": "0xfff1f1f1"}
            },
            "behavior": "opaque",
          },
          "xEvents": [
            {
              "eventType": "onClick",
              "code": '''
      action:yzToast(tip:'123')
      '''
            }
          ]
        }
      }
    }
  }
};
