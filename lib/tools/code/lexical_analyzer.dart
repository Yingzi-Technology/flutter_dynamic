/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-17 19:25:05 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-19 15:08:41
 */

part of '../code.dart';

/// DSL词法分析器
/// DSL Lexical analysis
class YZDynamicLexicalAnalysis {
  
  YZDynamicLexicalAnalysis._();

  //Math the format string such as "if(..1){..2}else if(..3){..4} else if(..5){..6} else {..7}" //3 substring
  static RegExp ifTagPattern = RegExp(r'^if\s*\((.+?)\)\s*\{\s*(.+?)\s*\}'); //start with if
  static RegExp ifPattern = RegExp(r'if\s*\((.+?)\)\s*\{\s*(.+?)\s*\}'); //..1..2..3..4..5..6
  static RegExp elsePattern = RegExp(r'else\s*{\s*(.+?)\s*\}'); //..7

  //Math the format string such as "switch (...) { case 1:{} case 2:{} default: {}}" //3 substring
  static RegExp switchPattern = RegExp(r'^switch\s*\((.+?)\)'); //start with switch
  static RegExp switchCasePattern = RegExp(r'case\s*(.+?)\s*:\s*\{\s*(.+?)\s*\}'); 
  static RegExp switchDefaultPattern = RegExp(r'\s*default\s*:\s*{\s*(.+?)\s*}\s*}$'); 

  //for (int (ivar) = (0); ivar < (10); ivar++) { (...)} // 4 substring
  //for (int (ivar) = (ivalue); ivar < (lenth); ivar+=(step)) { (...)} // 5 substring
  static RegExp forLoopPattern = RegExp(r'^for\s*\(\s*(?:int)?\s*(.+?)\s*=(.+?);(?:.+?)<\s*((?:(?:var)|(?:<))?.+?);.+?(?:=(.+?))?\)\s*\{(.+?)\}'); // start with for

  static RegExp whilePattern = RegExp(r'^while\s*\((.+?)\)\s*\{\s*(.+?)\s*\}'); // start with while

  static dynamic analyze(String str) {
    if (str == null) return null;

    var strTrim = str.trim();
    if (strTrim.isEmpty) return null;
    strTrim = strTrim.replaceAll(RegExp(r'[\f\n\r\t\v]'), ''); 

    Iterable<Match> matchesIfElse = ifTagPattern.allMatches(strTrim);
    if (matchesIfElse != null && matchesIfElse.isNotEmpty) {               
      return _analyzeIfElse(matchesIfElse, strTrim);
    }

    Iterable<Match> matchesSwitch = switchPattern.allMatches(strTrim);
    if (matchesSwitch != null && matchesSwitch.isNotEmpty) {          
      return _analyzeSwitchCase(matchesSwitch, strTrim);
    } 

    Iterable<Match> matchesForLoop = forLoopPattern.allMatches(strTrim);
    if (matchesForLoop != null && matchesForLoop.isNotEmpty) {          
      return _analyzeForloop(matchesForLoop, strTrim);
    }  
    
    Iterable<Match> matchesWhile = whilePattern.allMatches(strTrim);
    if (matchesWhile != null && matchesWhile.isNotEmpty) {               
      return _analyzeWhile(matchesWhile, strTrim);
    }          

    return null;
  }

  static YZDynamicActionConfig _analyzeIfElse(Iterable<Match> matches, String raw) {
    YZDynamicActionConfig action;

    List<Map<String, dynamic>> caseConditions = [];
    Iterable<Match> ifMatches = ifPattern.allMatches(raw);    
    if (ifMatches != null && ifMatches.isNotEmpty) {          
      for (var m in ifMatches) {
        String _case = m[1].trim();
        String _block = m[2];
        caseConditions.add({"if": _case, "block": _YZDynamicCodeActionTag + _block});
      }      
    }  

    Iterable<Match> elseMatches = elsePattern.allMatches(raw);
    String elseBlock;
    if (elseMatches != null && elseMatches.isNotEmpty) {          
      for (var m in elseMatches) {
        String _codeAction = m[1];
        elseBlock = _YZDynamicCodeActionTag + _codeAction;
      }      
    } 

    action = YZDynamicActionConfig(
      actionName: "Sys.ifElse",
      params: {
        "ifs": caseConditions,
        "else": elseBlock
      }
    );      

    return action;
  }

  static YZDynamicActionConfig _analyzeSwitchCase(Iterable<Match> matches, String raw) {
    YZDynamicActionConfig action;

    String condition;
    for (var m in matches) {
      condition = m[1];
    }    

    List<Map<String, dynamic>> caseConditions = [];
    Iterable<Match> caseMatches = switchCasePattern.allMatches(raw);    
    if (caseMatches != null && caseMatches.isNotEmpty) {          
      for (var m in caseMatches) {
        String _case = m[1].trim();
        String _block = m[2];
        caseConditions.add({"case": _case, "block": _YZDynamicCodeActionTag + _block});
      }      
    }  

    Iterable<Match> defaultMatches = switchDefaultPattern.allMatches(raw);
    String defaultBlock;
    if (defaultMatches != null && defaultMatches.isNotEmpty) {          
      for (var m in defaultMatches) {
        String _codeAction = m[1];
        defaultBlock = _YZDynamicCodeActionTag + _codeAction;
      }      
    } 

    action = YZDynamicActionConfig(
      actionName: "Sys.switchCase",
      params: {
        "switch": condition,
        "cases": caseConditions,
        "default": defaultBlock
      }
    );        

    return action;
  }  

  static YZDynamicActionConfig _analyzeForloop(Iterable<Match> matches, String raw) {
    YZDynamicActionConfig action;

    for (var m in matches) {
      String ivar = m[1];
      if (YZDynamicVariableUtil.isVariable(ivar)) {
        ivar = ivar.substring(ivar.lastIndexOf(':') + 1, ivar.length - 1);
      }

      String ivalue = m[2];
      String length = m[3];
      String step = m[4];
      String block = m[5];
      
      if (block != null) {
        block = _YZDynamicCodeActionTag + block;
      }
      action = YZDynamicActionConfig(
        actionName: "Sys.forLoop",
        params: {
          "ivar": ivar,
          "ivalue": ivalue,
          "step": step,  
          "length": length,
          "block": block
        }
      );
    }        

    return action;
  }

  static YZDynamicActionConfig _analyzeWhile(Iterable<Match> matches, String raw) {
    YZDynamicActionConfig action;

    for (var m in matches) {
      String condition = m[1];
      String block = m[2];
      
      if (condition != null) {
        condition = _YZDynamicCodeActionTag + condition;
      }

      if (block != null) {
        block = _YZDynamicCodeActionTag + block;
      }
      action = YZDynamicActionConfig(
        actionName: "Sys.while",
        params: {
          "condition": condition,
          "block": block
        }
      );
    }        

    return action;
  }     

}