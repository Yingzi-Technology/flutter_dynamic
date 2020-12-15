/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-27 18:08:10 
 * @Last Modified by:   yz.yujingzhou 
 * @Last Modified time: 2020-11-27 18:08:10  
 */

part of '../action.dart';

// List/Map/Set
// 1、forEach方法 可以选择性打印数据和循环遍历
// 2、map方法 处理每一个集合中的对象，并返回一个结果
// 3、where方法 过滤集合中的值，并返回一个集合
// 4、any方法 判断集合中的值是否符合条件，只有有一个符合就返回true
// 5、every方法 判断集合中的值是否符合条件，只有都符合才返回true

//action:Set(value, value1, value2)->returnValue. PS: trans to action:Set({"0": "value", "1": "value1"})->returnValue
class YZSetHandler extends YZDynamicSysActionHandler{
  @override
  Set func(Map params) {
    Set result = {};
    params?.forEach((key, value) {
      result.add(value);
    });

    return result;
  }

  @override
  String get actionName => 'Set';
}

class YZSetContainsHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    String value = params['value']?.toString();
    
    return target?.contains(value);

  }

  @override
  String get actionName => 'Set.contains';

}

class YZSetAddHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['target'] == null ) return null;
    Set target = (params['target'] is Set) ? params['target'] : null;

    if (params == null || params['value'] == null ) return null;
    dynamic value = params['value'];
    
    return target?.add(value);

  }

  @override
  String get actionName => 'Set.add';

}

class YZSetAddAllHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['target'] == null ) return null;
    Set target = (params['target'] is Set) ? params['target'] : null;

    if (params == null || params['value'] == null ) return null;
    dynamic value = params['value'];
    
    return target?.addAll(value);

  }

  @override
  String get actionName => 'Set.addAll';

}

class YZSetRemoveHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    String value = params['value']?.toString();
    
    return target?.remove(value);

  }

  @override
  String get actionName => 'Set.remove';

}

class YZSetLookupHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    String value = params['value']?.toString();
    
    return target?.lookup(value);

  }

  @override
  String get actionName => 'Set.lookup';

}

class YZSetRemoveALlHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    Iterable value = (params['value'] is Iterable) ? params['value'] : null;
    
    return target?.removeAll(value);

  }

  @override
  String get actionName => 'Set.removeAll';

}

class YZSetRetainALlHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    Iterable value = (params['value'] is Iterable) ? params['value'] : null;
    
    return target?.retainAll(value);

  }

  @override
  String get actionName => 'Set.retainAll';

}

class YZSetContainsAllHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    Iterable value = (params['value'] is Iterable) ? params['value'] : null;
    
    return target?.containsAll(value);

  }

  @override
  String get actionName => 'Set.containsAll';

}

class YZSetIntersectionAllHandler extends YZDynamicSysActionHandler{
  @override
  Set func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    Set value = (params['value'] is Set) ? params['value'] : null;
    
    return target?.intersection(value);

  }

  @override
  String get actionName => 'Set.intersection';

}

class YZSetUnionHandler extends YZDynamicSysActionHandler{
  @override
  Set func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    Set value = (params['value'] is Set) ? params['value'] : null;
    
    return target?.union(value);

  }

  @override
  String get actionName => 'Set.union';

}

class YZSetDifferenceHandler extends YZDynamicSysActionHandler{
  @override
  Set func(Map params) {

    if (params == null) return null;
    
    Set target = (params['target'] is Set) ? params['target'] : null;
    Set value = (params['value'] is Set) ? params['value'] : null;
    
    return target?.difference(value);

  }

  @override
  String get actionName => 'Set.difference';

}

class YZSetClearHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map params) {

    if (params == null || params['target'] == null ) return null;
    Set target = (params['target'] is Set) ? params['target'] : null;
    
    return target?.clear();

  }

  @override
  String get actionName => 'Set.clear';

}

class YZSetToSetHandler extends YZDynamicSysActionHandler{
  @override
  Set func(Map params) {

    if (params == null || params['target'] == null ) return null;
    Set target = (params['target'] is Set) ? params['target'] : null;
    
    return target?.toSet();

  }

  @override
  String get actionName => 'Set.toSet';

}

//todo: 