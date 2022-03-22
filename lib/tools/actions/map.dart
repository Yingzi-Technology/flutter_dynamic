/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-27 18:06:01 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-12-02 15:48:51
 */

part of '../action.dart';


///Map action的params 是Map本身
///Map action's params is Map itself
class YZMapHandler extends YZDynamicSysActionHandler{
  @override
  Map? func(Map? params) {
    return params;
  }

  @override
  String get actionName => 'Map';
}

class YZMapEntryHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if(params == null) return null;
    dynamic key = params['key'] ?? params['key'];
    dynamic value = params['value'] ?? params['value'];
    return MapEntry(key, value);
  }

  @override
  String get actionName => 'MapEntry';
}

class YZMapValueOfKeyHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {

    if (params == null) return null;
    
    Map? map = (params['map'] is Map) ? params['map'] : null;
    if (map == null) return null; 
    String? key = params['key']?.toString();
    if (key == null) return null; 
    
    return map[key];

  }

  @override
  String get actionName => 'Map.valueOfKey';

}

class YZMapIsEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map? params) {
    if (params == null || params['map'] == null || !(params['map'] is Map)) return true;
    return (params['map'] as Map).isEmpty;
  }

  @override
  String get actionName => 'Map.isEmpty';

}

class YZMapIsNotEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map? params) {
    if (params == null || params['map'] == null || !(params['map'] is Map)) return false;
    return (params['map'] as Map).isNotEmpty;
  }

  @override
  String get actionName => 'Map.isNotEmpty';

}

class YZMapLengthHandler extends YZDynamicSysActionHandler{
  @override
  int? func(Map? params) {
    
    if (params == null || params['map'] == null || !(params['map'] is Map)) return null;
    Map map = params['map'] as Map;
    
    return map.length;
  }

  @override
  String get actionName => 'Map.length';

}

class YZMapContainsValueHandler extends YZDynamicSysActionHandler{
  @override
  bool? func(Map? params) {

    if (params == null) return null;
    
    Map map = (params['map'] is Map) ? params['map'] : null;
    String? value = params['value']?.toString();
    
    return map.containsValue(value);

  }

  @override
  String get actionName => 'Map.containsValue';

}

class YZMapContainsKeyHandler extends YZDynamicSysActionHandler{
  @override
  bool? func(Map? params) {

    if (params == null) return null;
    
    Map? map = (params['map'] is Map) ? params['map'] : null;
    String? key = params['key']?.toString();
    
    return map?.containsKey(key);

  }

  @override
  String get actionName => 'Map.containsKey';

}

class YZMapRemoveKeyHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {

    if (params == null) return null;
    
    Map? map = (params['map'] is Map) ? params['map'] : null;
    String? key = params['key']?.toString();
    
    return map?.remove(key);

  }

  @override
  String get actionName => 'Map.remove';

}

class YZMapClearHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Map? map = (params['map'] is Map) ? params['map'] : null;
    return map?.clear();
  }

  @override
  String get actionName => 'Map.clear';
}

class YZMapKeysHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Map map = (params['map'] is Map) ? params['map'] : null;
    return map.keys;
  }

  @override
  String get actionName => 'Map.keys';
}

class YZMapValuesHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Map map = (params['map'] is Map) ? params['map'] : null;
    return map.values;
  }

  @override
  String get actionName => 'Map.values';
}

class YZMapEntriesHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Map map = (params['map'] is Map) ? params['map'] : null;
    return map.entries;
  }

  @override
  String get actionName => 'Map.entries';
}

class YZMapAddAllHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {

    if (params == null || params['map'] == null ) return null;
    Map? map = (params['map'] is Map) ? params['map'] : null;
    Map other = (params['other'] is Map) ? params['other'] : null;
    map?.addAll(other);
  }

  @override
  String get actionName => 'Map.addAll';
}

// checked by yjz
// FIXME: 不传入泛型如何解决这个问题
class YZMapAddEntriesHandler extends YZDynamicSysActionHandler{
  @override
  dynamic? func(Map? params) {

    if (params == null || params['map'] == null ) return null;
    Map? map = (params['map'] is Map) ? params['map'] : null;
    Iterable newIterable = (params['newEntries'] is Iterable) ? params['newEntries'] : null;
    Iterable<MapEntry<dynamic,dynamic>>? newEntries;
    newEntries = newIterable.whereType<MapEntry<dynamic,dynamic>>();
    map?.addEntries(newEntries);
  }

  @override
  String get actionName => 'Map.addEntries';
}

class YZMapToStringHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null || params['map'] == null ) return null;
    Map? map = (params['map'] is Map) ? params['map'] : null;
    
    return map?.toString();
  }

  @override
  String get actionName => 'Map.toString';
}

class YZMapFromHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null || params['other'] == null ) return null;
    Map other = (params['other'] is Map) ? params['other'] : null;
    return Map.from(other);
  }

  @override
  String get actionName => 'Map.from';
}

class YZMapOfHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null || params['other'] == null ) return null;
    Map other = (params['other'] is Map) ? params['other'] : null;
    return Map.of(other);
  }

  @override
  String get actionName => 'Map.of';
}

// checked by yjz
class YZMapIdentityHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    return Map.identity();
  }

  @override
  String get actionName => 'Map.identity';
}

// checked by yjz
class YZMapFromEntriesHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Iterable? entries = (params['entries'] is Iterable) ? params['entries'] : null;
    if(entries == null) return null;
    entries.forEach((element) {
      if(!(element is MapEntry)) return null;
    });
    return Map.fromEntries(entries as Iterable<MapEntry>);
  }

  @override
  String get actionName => 'Map.fromEntries';
}

// checked by yjz
// todo: 还可以传入 key 和 value，但它们是两个 function
class YZMapFromIterableHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Iterable? entries = (params['entries'] is Iterable) ? params['entries'] : null;
    if(entries == null) return null;
    return Map.fromIterable(entries);
  }

  @override
  String get actionName => 'Map.fromIterable';
}

// checked by yjz
class YZMapFromIterablesHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Iterable? keys = (params['keys'] is Iterable) ? params['keys'] : null;
    Iterable? values = (params['values'] is Iterable) ? params['values'] : null;
    // keys 和 values 的长度要求一致
    if(keys == null || values == null) return null;
    return Map.fromIterables(keys, values);
  }

  @override
  String get actionName => 'Map.fromIterables';
}

// checked by yjz
class YZMapUnmodifiablesHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map? params) {
    if (params == null) return null;
    Map other = (params['other'] is Map) ? params['other'] : null;
    return Map.unmodifiable(other);
  }

  @override
  String get actionName => 'Map.unmodifiable';
}


/// todo: 
/// 函数：forEach/map/putIfAbsent/removeWhere/update/updateAll
/// 泛型：cast/castFrom/