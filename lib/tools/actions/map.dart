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
  Map func(Map params) {
    return params;
  }

  @override
  String get actionName => 'Map';

}

class YZMapValueOfKeyHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    Map map = (params['map'] is Map) ? params['map'] : null;
    if (map == null) return null; 
    String key = params['key']?.toString();
    if (key == null) return null; 
    
    return map[key];

  }

  @override
  String get actionName => 'Map.valueOfKey';

}

class YZMapIsEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null || params['map'] == null || !(params['map'] is Map)) return true;
    return (params['map'] as Map).isEmpty;
  }

  @override
  String get actionName => 'Map.isEmpty';

}

class YZMapIsNotEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null || params['map'] == null || !(params['map'] is Map)) return false;
    return (params['map'] as Map).isNotEmpty;
  }

  @override
  String get actionName => 'Map.isNotEmpty';

}

class YZMapLengthHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {
    
    if (params == null || params['map'] == null || !(params['map'] is Map)) return null;
    Map map = params['map'] as Map;
    
    return map?.length;
  }

  @override
  String get actionName => 'Map.length';

}

class YZMapContainsValueHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null) return null;
    
    Map map = (params['map'] is Map) ? params['map'] : null;
    String value = params['value']?.toString();
    
    return map?.containsValue(value);

  }

  @override
  String get actionName => 'Map.containsValue';

}

class YZMapContainsKeyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null) return null;
    
    Map map = (params['map'] is Map) ? params['map'] : null;
    String key = params['key']?.toString();
    
    return map?.containsKey(key);

  }

  @override
  String get actionName => 'Map.containsKey';

}

class YZMapRemoveKeyHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    Map map = (params['map'] is Map) ? params['map'] : null;
    String key = params['key']?.toString();
    
    return map?.remove(key);

  }

  @override
  String get actionName => 'Map.remove';

}

class YZMapClearHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    Map map = (params['map'] is Map) ? params['map'] : null;
    
    return map?.clear();

  }

  @override
  String get actionName => 'Map.clear';

}
