/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-29 12:03:20 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 15:36:19
 */

part of '../action.dart';


class YZStringHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;

    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value.toString();
        break;
      }      
    }

    return ret;
  }

  @override
  String get actionName => 'String';
}

class YZStringIsEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;

    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value?.toString();
        break;
      }      
    }

    if (ret == null) {
      return true;
    }
    return ret.isEmpty;
  }

  @override
  String get actionName => 'String.isEmpty';

}

class YZStringIsNotEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;

    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value.toString();
        break;
      }      
    }

    return ret.isNotEmpty;
  }

  @override
  String get actionName => 'String.isNotEmpty';

}

class YZStringPlusHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    String ret;
    params.forEach((key, value) {
      dynamic addend = value.toString();
      if (addend == null) return;
      ret = (ret ?? '') + addend;
    });
    
    return ret;
  }

  @override
  String get actionName => 'String.+';

}

class YZStringLengthHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {
    if (params == null) return null;

    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value.toString();
        break;
      }      
    }

    return ret?.length;
  }

  @override
  String get actionName => 'String.length';

}

class YZStringCompareToHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String other = params['other']?.toString();

    if (value == null || other == null) {
      for (var v in params.values) {
        if (value == null) {
          value = v.toString();
          continue;
        }
        if (other == null) {
          other = v.toString();
          break;
        }  
      } 
    }   
    
    return value?.compareTo(other);
  }

  @override
  String get actionName => 'String.compareTo';

}

class YZStringIndexOfHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String patternStr = params['pattern']?.toString() ?? '';
    Pattern pattern = patternStr.startsWith('r') ? RegExp(patternStr) : patternStr;
    int start;
    if (params['start'] != null )
    start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    
    return value?.indexOf(pattern, start ?? 0);
  }

  @override
  String get actionName => 'String.indexOf';

}

class YZStringLastIndexOfHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String patternStr = params['pattern']?.toString() ?? '';
    Pattern pattern = patternStr.startsWith('r') ? RegExp(patternStr) : patternStr;
    int start;
    if (params['start'] != null )
    start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    
    return value?.lastIndexOf(pattern, start);
  }

  @override
  String get actionName => 'String.lastIndexOf';

}

class YZStringContainsHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String otherStr = params['other']?.toString() ?? '';
    Pattern other = otherStr.startsWith('r') ? RegExp(otherStr) : otherStr;
    int start;
    if (params['start'] != null )
    start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    
    return value?.contains(other, start ?? 0);
  }

  @override
  String get actionName => 'String.contains';

}


class YZStringEndsWithHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String other = params['other']?.toString();
    
    return value?.endsWith(other);
  }

  @override
  String get actionName => 'String.endsWith';

}

class YZStringStartsWithHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String other = params['other']?.toString();
    int start;
    if (params['start'] != null )
    start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    
    return value?.startsWith(other, start ?? 0);
  }

  @override
  String get actionName => 'String.startsWith';

}

class YZStringPadLeftHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String padding = params['padding']?.toString();
    int width = ((params['width'] is int) ? params['width'] : int.tryParse(params['width']));
    
    return value?.padLeft(width, padding ?? ' ');
  }

  @override
  String get actionName => 'String.padLeft';

}

class YZStringPadRightHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String padding = params['padding']?.toString();
    int width = ((params['width'] is int) ? params['width'] : int.tryParse(params['width']));
    
    return value?.padRight(width, padding ?? ' ');
  }

  @override
  String get actionName => 'String.padRight';

}

class YZStringReplaceAllHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String replace = params['replace']?.toString();
    String fromStr = params['from']?.toString() ?? '';
    Pattern from = fromStr.startsWith('r') ? RegExp(fromStr) : fromStr;
    
    return value?.replaceAll(from, replace);
  }

  @override
  String get actionName => 'String.replaceAll';

}

class YZStringReplaceFirstHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String to = params['replace']?.toString();
    String fromStr = params['from']?.toString() ?? '';
    Pattern from = fromStr.startsWith('r') ? RegExp(fromStr) : fromStr;
    int startIndex;
    if (params['startIndex'] != null )
    startIndex = ((params['startIndex'] is int) ? params['startIndex'] : int.tryParse(params['startIndex']));
    
    return value?.replaceFirst(from, to, startIndex ?? 0);
  }

  @override
  String get actionName => 'String.replaceFirst';

}

class YZStringReplaceRangeHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String replacement = params['replace']?.toString();
    int start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    int end = ((params['end'] is int) ? params['end'] : int.tryParse(params['end']));
    
    return value?.replaceRange(start, end, replacement);
  }

  @override
  String get actionName => 'String.replaceRange';

}

class YZStringSubstringHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    int startIndex = ((params['startIndex'] is int) ? params['startIndex'] : int.tryParse(params['startIndex']));

    int endIndex;
    if (params['endIndex'] != null )
    endIndex = ((params['endIndex'] is int) ? params['endIndex'] : int.tryParse(params['endIndex'])); 
    
    return value?.substring(startIndex, endIndex);
  }

  @override
  String get actionName => 'String.substring';

}

class YZStringToLowerCaseHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();

    return value?.toLowerCase();
  }

  @override
  String get actionName => 'String.toLowerCase';

}

class YZStringToUpperCaseHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value.toString();
        break;
      }      
    }     

    return ret?.toUpperCase();
  }

  @override
  String get actionName => 'String.toUpperCase';

}

class YZStringTrimHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value.toString();
        break;
      }      
    }     

    return ret?.trim();
  }

  @override
  String get actionName => 'String.trim';

}

class YZStringTrimLeftHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value.toString();
        break;
      }      
    }      

    return ret?.trimLeft();
  }

  @override
  String get actionName => 'String.trimLeft';

}

class YZStringTrimRightHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;
    
    String ret = params['value']?.toString();
    if (ret == null) {
      for (var value in params.values) {
        ret = value.toString();
        break;
      }      
    }     

    return ret?.trimRight();
  }

  @override
  String get actionName => 'String.trimRight';

}

class YZStringSplitHandler extends YZDynamicSysActionHandler{
  @override
  List<String> func(Map params) {
    if (params == null) return null;
    
    String value = params['value']?.toString();
    String patternStr = params['pattern']?.toString() ?? '';
    Pattern pattern = patternStr.startsWith('r') ? RegExp(patternStr) : patternStr;

    return value?.split(pattern);
  }

  @override
  String get actionName => 'String.split';

}

class YZStringAllMatchesHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'String.allMatches';

  @override
  dynamic func(Map params) {
    if(params == null) return null;
    String value = params['value']?.toString();
    String string = params['string']?.toString();
    int start;
    if(params['start'] != null) {
      start = int.tryParse(params['start']?.toString());
      return value?.allMatches(string, start);
    }
    return value?.allMatches(string);
  }
}

class YZStringMatchAsPrefix extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'String.matchAsPrefix';

  // FIXME: 原方法返回类型后有 ? ，代表可空？
  @override
  dynamic func(Map params) {
    if(params == null) return null;
    String value = params['value']?.toString();
    String string = params['string']?.toString();
    int start;
    if(params['start'] != null) {
      start = int.tryParse(params['start']?.toString());
      return value?.matchAsPrefix(string, start);
    }
    return value?.matchAsPrefix(string);
  }
  
}

//todo: replaceAllMapped/replaceFirstMapped/splitMapJoin