/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-29 12:03:34 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 16:59:47
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

class YZListIsEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null || params['list'] == null) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    return list?.isEmpty;
  }

  @override
  String get actionName => 'List.isEmpty';

}

class YZListIsNotEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null || params['list'] == null) return null;
    List list = (params['list'] is List) ? params['list'] : null;

    return list?.isNotEmpty;
  }

  @override
  String get actionName => 'List.isNotEmpty';

}

class YZListLengthHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {
    
    if (params == null || params['list'] == null) return null;
    List list = (params['list'] is List) ? params['list'] : null;
    
    return list?.length;
  }

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

class YZListFirstHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;
    
    return list?.first;

  }

  @override
  String get actionName => 'List.first';

}

class YZListLastHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['list'] == null ) return null;
    List list = (params['list'] is List) ? params['list'] : null;
    
    return list?.last;

  }

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
    
    return list?.add(value);
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


//todo: replaceRange/fillRange/removeRange/setRange/getRange/retainWhere/removeWhere/shuffle/sort/cast/copyRange/castFrom/unmodifiable/from/of
