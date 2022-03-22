/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-29 12:03:34 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-10 16:00:48
 */

part of '../action.dart';

//action:List(value, value1, value2)->returnValue. PS: trans to action:List({"0": "value", "1": "value1"})->returnValue

class YZListHandler extends YZDynamicSysActionHandler{
  @override
  List func(Map params) {
    List result = [];
    params?.forEach((key, value) {
      result.add(value);
    });

    return result;
  }

  @override
  String get actionName => 'List';
}

class YZListGenerateHandler extends YZListHandler{
  
  @override
  String get actionName => 'List.generate';

}

// 获取对应下标的值
class YZListValueOfIndexHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    List list = (params['list'] is List) ? params['list'] : null;
    if (list == null) return null; 
    int key = (params['index'] is int) ? params['index'] : int.tryParse(params['index']);
    if (key == null) return null; 
    
    return list[key];

  }

  @override
  String get actionName => 'List.valueOfIndex';

}

class YZListIsEmptyHandler extends YZIterableIsEmptyHandler{
  @override
  String get actionName => 'List.isEmpty';
}

class YZListIsNotEmptyHandler extends YZIterableIsNotEmptyHandler{
  @override
  String get actionName => 'List.isNotEmpty';
}

class YZListLengthHandler extends YZIterableLengthHandler{
  @override
  String get actionName => 'List.length';
}

class YZListClearHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;
    
    return list?.clear();

  }

  @override
  String get actionName => 'List.clear';

}

class YZListFirstHandler extends YZIterableFirstHandler{
  @override
  String get actionName => 'List.first';
}

class YZListLastHandler extends YZIterableLastHandler{
  @override
  String get actionName => 'List.last';
}

class YZListAddHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    if (params == null || params['value'] == null ) return null;
    dynamic value = params['value'];
    
    list?.add(value);
  }

  @override
  String get actionName => 'List.add';

}

class YZListAddAllHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    if (params == null || params['value'] == null ) return null;
    dynamic value = params['value'];
    
    return list?.addAll(value);

  }

  @override
  String get actionName => 'List.addAll';

}

class YZListIndexOfHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    if (params['value'] == null ) return null;
    dynamic value = params['value'];

    int start;
    if (params['start'] != null )
    start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));   
    
    return list?.indexOf(value, start ?? 0);

  }

  @override
  String get actionName => 'List.indexOf';

}

class YZListLastIndexOfHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    if (params['value'] == null ) return null;
    dynamic value = params['value'];

    int start;
    if (params['start'] != null )
    start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));   
    
    return list?.lastIndexOf(value, start);

  }

  @override
  String get actionName => 'List.lastIndexOf';

}

class YZListInsertHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    if (params['value'] == null ) return null;
    dynamic value = params['value'];

    int index;
    if (params['index'] != null )
    index = ((params['index'] is int) ? params['index'] : int.tryParse(params['index']));   
    
    return list?.insert(index, value);

  }

  @override
  String get actionName => 'List.insert';

}

class YZListInsertAllHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    if (params['value'] == null ) return null;
    dynamic value = params['value'];

    int index;
    if (params['index'] != null )
    index = ((params['index'] is int) ? params['index'] : int.tryParse(params['index']));   
    
    return list?.insertAll(index, value);

  }

  @override
  String get actionName => 'List.insertAll';

}

class YZListSetAllHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    if (params['value'] == null ) return null;
    dynamic value = params['value'];

    int index;
    if (params['index'] != null )
    index = ((params['index'] is int) ? params['index'] : int.tryParse(params['index']));   
    
    return list?.setAll(index, value);

  }

  @override
  String get actionName => 'List.setAll';

}

class YZListRemoveHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null) return null;
    
    List list = (params['list'] is List) ? params['list'] : null;
    String value = params['value']?.toString();
    
    return list?.remove(value);

  }

  @override
  String get actionName => 'List.remove';

}

class YZListRemoveAtHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    List list = (params['list'] is List) ? params['list'] : null;
    int index;
    if (params['index'] != null )
    index = ((params['index'] is int) ? params['index'] : int.tryParse(params['index']));  
    
    return list?.removeAt(index);

  }

  @override
  String get actionName => 'List.removeAt';

}

class YZListRemoveLastHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    List list = (params['list'] is List) ? params['list'] : null;
    
    return list?.removeLast();

  }

  @override
  String get actionName => 'List.removeLast';

}

class YZListSublistHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    List list = (params['list'] is List) ? params['list'] : null;

    int start;
    if (params['start'] != null )
    start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start'])); 

    int end;
    if (params['end'] != null )
    end = ((params['end'] is int) ? params['end'] : int.tryParse(params['end']));       
    
    return list?.sublist(start, end);

  }

  @override
  String get actionName => 'List.sublist';

}

class YZListAsMapHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    List list = (params['list'] is List) ? params['list'] : null;

    return list?.asMap();

  }

  @override
  String get actionName => 'List.asMap';

}

// checked by yjz
class YZListReplaceRangeHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.replaceRange';

  @override
  dynamic func(Map params) {
    if(params == null || params['list'] == null) return;
    List list = (params['list'] is List) ? params['list'] : null;
    int start;
    if (params['start'] != null) {
      start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    }
    
    int end;
    if (params['end'] != null) {
      end = ((params['end'] is int) ? params['end'] : int.tryParse(params['end'])); 
    }
    
    dynamic replacement;
    if (params['replacement'] != null) {
      replacement = ((params['replacement'] is List || params['replacement'] is Set) ? params['replacement'] : null); 
    }

    list?.replaceRange(start, end, replacement);
  }
}

// checked by yjz
class YZListFillRangeHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.fillRange';

  @override
  dynamic func(Map params) {
    if(params == null || params['list'] == null) return;
    List list = (params['list'] is List) ? params['list'] : null;
    int start;
    if (params['start'] != null) {
      start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    }
    
    int end;
    if (params['end'] != null) {
      end = ((params['end'] is int) ? params['end'] : int.tryParse(params['end'])); 
    }
    
    dynamic fillValue;
    if (params['fillValue'] != null) {
      fillValue = params['fillValue']; 
      list?.fillRange(start, end, fillValue);
    } else {
      list?.fillRange(start, end);
    }
  }
}

// checked by yjz
class YZListRemoveRangeHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.removeRange';

  @override
  dynamic func(Map params) {
    if(params == null || params['list'] == null) return;
    List list = (params['list'] is List) ? params['list'] : null;
    int start;
    if (params['start'] != null) {
      start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    }
    
    int end;
    if (params['end'] != null) {
      end = ((params['end'] is int) ? params['end'] : int.tryParse(params['end'])); 
    }
    list?.removeRange(start, end);
  }
}

// checked by yjz
class YZListSetRangeHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.setRange';

  @override
  dynamic func(Map params) {
    if(params == null || params['list'] == null) return;
    List list = (params['list'] is List) ? params['list'] : null;
    int start;
    if (params['start'] != null) {
      start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    }
    
    int end;
    if (params['end'] != null) {
      end = ((params['end'] is int) ? params['end'] : int.tryParse(params['end'])); 
    }
    
    dynamic iterable = (params['iterable'] is List || params['iterable'] is Set) ? params['iterable'] : null;

    if (params['skipCount'] != null) {
      int skipCount = ((params['skipCount'] is int) ? params['skipCount'] : int.tryParse(params['skipCount'])); 
      list?.setRange(start, end, iterable, skipCount);
    } else {
      list?.setRange(start, end, iterable);
    }
  }
}

// checked by yjz
class YZListGetRangeHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.getRange';

  @override
  dynamic func(Map params) {
    if(params == null || params['list'] == null) return null;
    List list = (params['list'] is List) ? params['list'] : null;
    int start;
    if (params['start'] != null) {
      start = ((params['start'] is int) ? params['start'] : int.tryParse(params['start']));
    }
    
    int end;
    if (params['end'] != null) {
      end = ((params['end'] is int) ? params['end'] : int.tryParse(params['end'])); 
    }
    return list?.getRange(start, end);
  }
  
}

// unchecked by yjz params里的值从dsl获取不一定是Random类型的值
class YZListShuffleHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.shuffle';

  @override
  dynamic func(Map params) {
    if(params == null || params['list'] == null) return; 
    List list = (params['list'] is List) ? params['list'] : null;
    if(params['random'] == null) {
      list.shuffle();
    } else {
      Random random = (params['random'] is Random) ? params['random'] : null;
      list.shuffle(random);
    }
  }
}

// checked by yjz，含泛型
class YZListCopyRangeHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.copyRange';

  @override
  dynamic func(Map params) {
    if(params == null || params['target'] == null 
    || params['at'] == null || params['source'] == null) return null;

    List target = (params['target'] is List) ? params['target'] : null;
    List source = (params['source'] is List) ? params['source'] : null;
    int at = int.tryParse(params['at']);
    int start = 0;
    int end = source?.length;
    if(params['start'] != null) {
      start = int.tryParse(params['start']);
    }
    if(params['end'] != null) {
      end = int.tryParse(params['end']);
    }
    List.copyRange(target, at, source, start, end);
  }
}

// checked by yjz
class YZListUnmodifiableHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.unmodifiable';

  @override
  dynamic func(Map params) {
    if(params == null || params['elements'] == null) return null; 
    dynamic elements = (params['elements'] is Iterable) ? params['elements'] : null;
    return List.unmodifiable(elements);
  }
}

// checked by yjz，含泛型
class YZListFromHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.from';

  @override
  dynamic func(Map params) {
    if(params == null || params['elements'] == null) return null; 
    dynamic elements = (params['elements'] is Iterable) ? params['elements'] : null;
    bool growable = true;
    if(params['growable'] != null) {
      growable = (params['growable'] is bool) ? params['growable'] : true;
    }
    return List.from(elements, growable: growable);
  }
}

// checked by yjz，含泛型
class YZListOfHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'List.of';

  @override
  dynamic func(Map params) {
    if(params == null || params['elements'] == null) return null; 
    dynamic elements = (params['elements'] is Iterable) ? params['elements'] : null;
    bool growable = true;
    if(params['growable'] != null) {
      growable = (params['growable'] is bool) ? params['growable'] : true;
    }
    return List.of(elements, growable: growable);
  }
}

// uncheck
class YZListFollowedByHandler extends YZIterableFollowedByHandler {
  @override
  String get actionName => 'List.followedBy';
}

// uncheck
class YZListContainsHandler extends YZIterableContainsHandler {
  @override
  String get actionName => 'List.contains';
}

// uncheck
class YZListJoinHandler extends YZIterableJoinHandler {
  @override
  String get actionName => 'List.join';
}

// uncheck
class YZListToSetHandler extends YZIterableToSetHandler {
  @override
  String get actionName => 'List.toSet';
}

// uncheck
class YZListTakeHandler extends YZIterableTakeHandler {
  @override
  String get actionName => 'List.take';
}

// uncheck
class YZListSkipHandler extends YZIterableSkipHandler {
  @override
  String get actionName => 'List.skip';
}

// uncheck
class YZListElementAtHandler extends YZIterableElementAtHandler {
  @override
  String get actionName => 'List.elementAt';
}

// uncheck
class YZListToStringHandler extends YZIterableToStringHandler {
  @override
  String get actionName => 'List.toString';
}

//todo: 
// 泛型：cast/castFrom/single
// 函数：retainWhere/removeWhere/sort/forEach/reduce/fold
