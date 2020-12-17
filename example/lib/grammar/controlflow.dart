/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-01 11:20:04 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 18:20:56
 */

import 'package:flutter/material.dart';
import 'package:yz_flutter_dynamic/main.dart';

import 'base.dart';

class UTIfElse extends StatefulWidget {
  @override
  _UTIfElseState createState() => _UTIfElseState();
}

class _UTIfElseState extends UTBaseState<UTIfElse> {

  String get getTitle => "if else operators";

  List<Widget> getItem() {
    return [
      createItem("if", 
      '''
      var:<c:condication>=bool(true);
      if (<c:condication>) {
        var:<c:print>=if;
        var:<c:ret>=var:<c:print>
      }          
      '''), 
      createItem("if else", 
      '''
      var:<c:condication>=bool(true);
      if (<c:condication>) {
        var:<c:print>=if;
        var:<c:ret>=var:<c:print>
      } else {
        var:<c:print>=else;
        var:<c:ret>=var:<c:print>      
      }         
      '''), 
      createItem("if else if",       
      '''
      var:<c:condication>=bool(true);
      var:<c:condication2>=bool(false);
      var:<c:print>=;
      if (<c:condication>) {
        var:<c:print>=if;
        var:<c:ret>=var:<c:print>
      } else if (var:<c:condication2>) {
        var:<c:print>=elseif;
        var:<c:ret>=var:<c:print>
      } else {
        var:<c:print>=else;
        var:<c:ret>=var:<c:print>
      }         
      ''')                   
    ];
  }

}


class UTSwitchCase extends StatefulWidget {
  @override
  _UTSwitchCaseState createState() => _UTSwitchCaseState();
}

class _UTSwitchCaseState extends UTBaseState<UTSwitchCase> {

  String get getTitle => "switch case operators";

  List<Widget> getItem() {
    return [
      createItem("switch case", 
      '''
      var:<c:condication>=int(2);
      switch (<c:condication>) {
        case 1: {
          var:<c:print>=1;
          var:<c:ret>=var:<c:print>;
          break;
        }
        case int(2): {
          var:<c:print>=2;
          var:<c:ret>=var:<c:print>;
          break;          
        }
        default: {
          var:<c:print>=default;
          var:<c:ret>=var:<c:print>;
          break;          
        }
      }          
      ''')                   
    ];
  }

}

class UTForloop extends StatefulWidget {
  @override
  _UTForloopState createState() => _UTForloopState();
}

class _UTForloopState extends UTBaseState<UTForloop> {

  String get getTitle => "forloop operators";

  List<Widget> getItem() {
    return [
      createItem("for", 
      '''
      var:<c:list>=List(a,b,c);
      var:<c:length>=int(3);
      for (<c:i> = 0; i < var:<c:length>; <c:i>++) {
        var:<c:print>=action:List.valueOfIndex(list:<c:list>, index:<c:i>);
        var:<c:ret>=var:<c:print>;
      }         
      ''')                   
    ];
  }

}

class UTWhile extends StatefulWidget {
  @override
  _UTWhileState createState() => _UTWhileState();
}

class _UTWhileState extends UTBaseState<UTWhile> {

  String get getTitle => "while operators";

  List<Widget> getItem() {
    return [
      createItem("while", 
      '''
      var:<c:total>=int(0);
      while (Sys.<=(<c:total>, int(10))) {
        var:<c:total>=num.+(<c:total>, 1);       
      };         
      var:<c:ret>=var:<c:total>;
      ''')                   
    ];
  }

}