/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-27 18:08:10 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-10 11:51:50
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
  Set? func(Map? params) {
    Set result = {};
    params?.forEach((key, value) {
      result.add(value);
    });

    return result;
  }

  @override
  String get actionName => 'Set';
}

// uncheck
class YZSetContainsHandler extends YZIterableContainsHandler{
  @override
  String get actionName => 'Set.contains';
}

class YZSetAddHandler extends YZDynamicSysActionHandler{
  @override
  dynamic? func(Map? params) {

    if (params == null || params['target'] == null ) return null;
    Set? target = (params['target'] is Set) ? params['target'] : null;

    if (params['value'] == null ) return null;
    dynamic value = params['value'];
    
    return target?.add(value);

  }

  @override
  String get actionName => 'Set.add';

}

class YZSetAddAllHandler extends YZDynamicSysActionHandler{
  @override
  dynamic? func(Map? params) {

    if (params == null || params['target'] == null ) return null;
    Set? target = (params['target'] is Set) ? params['target'] : null;

    if (params['value'] == null ) return null;
    dynamic value = params['value'];
    
    return target?.addAll(value);

  }

  @override
  String get actionName => 'Set.addAll';

}

class YZSetRemoveHandler extends YZDynamicSysActionHandler{
  @override
  bool? func(Map? params) {

    if (params == null) return null;
    
    Set? target = (params['target'] is Set) ? params['target'] : null;
    String? value = params['value']?.toString();
    
    return target?.remove(value);

  }

  @override
  String get actionName => 'Set.remove';

}

// 按对象查询，返回查询到的对象
class YZSetLookupHandler extends YZDynamicSysActionHandler{
  @override
  dynamic? func(Map? params) {

    if (params == null) return null;
    
    Set? target = (params['target'] is Set) ? params['target'] : null;
    String? value = params['value']?.toString();
    
    return target?.lookup(value);

  }

  @override
  String get actionName => 'Set.lookup';

}

// 从集合中删除 elements 对象里的每一个元素
class YZSetRemoveALlHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map? params) {
    if (params == null) return null;
    Set? target = (params['target'] is Set) ? params['target'] : null;
    Iterable value = params['value'] as Iterable;
    target?.removeAll(value);
  }

  @override
  String get actionName => 'Set.removeAll';

}

// 如果集合中含有 elements 中的元素，则保留，否则删除
class YZSetRetainALlHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map? params) {
    if (params == null) return null;
    Set? target = (params['target'] is Set) ? params['target'] : null;
    Iterable value = params['value'] as Iterable;
    return target?.retainAll(value);
  }

  @override
  String get actionName => 'Set.retainAll';

}

// 集合中是否包含 other 中的所有元素，是则返回 true，否则返回 false
class YZSetContainsAllHandler extends YZDynamicSysActionHandler{
  @override
  bool? func(Map? params) {

    if (params == null) return null;
    
    Set? target = (params['target'] is Set) ? params['target'] : null;
    Iterable value = params['value'] as Iterable;
    
    return target?.containsAll(value);

  }

  @override
  String get actionName => 'Set.containsAll';

}

// 交集
class YZSetIntersectionAllHandler extends YZDynamicSysActionHandler{
  @override
  Set? func(Map? params) {

    if (params == null) return null;
    
    Set? target = (params['target'] is Set) ? params['target'] : null;
    Set value = params['value'] as Set;
    
    return target?.intersection(value);

  }

  @override
  String get actionName => 'Set.intersection';

}

// 并集
class YZSetUnionHandler extends YZDynamicSysActionHandler{
  @override
  Set? func(Map? params) {

    if (params == null) return null;
    
    Set? target = (params['target'] is Set) ? params['target'] : null;
    Set value = params['value'] as Set;
    
    return target?.union(value);

  }

  @override
  String get actionName => 'Set.union';

}

// 差集
class YZSetDifferenceHandler extends YZDynamicSysActionHandler{
  @override
  Set? func(Map? params) {

    if (params == null) return null;
    
    Set? target = (params['target'] is Set) ? params['target'] : null;
    Set value = params['value'] as Set;
    
    return target?.difference(value);

  }

  @override
  String get actionName => 'Set.difference';

}

class YZSetClearHandler extends YZDynamicSysActionHandler{
  @override
  void func(Map? params) {

    if (params == null || params['target'] == null ) return null;
    Set? target = (params['target'] is Set) ? params['target'] : null;
    
    target?.clear();

  }

  @override
  String get actionName => 'Set.clear';

}

class YZSetToSetHandler extends YZIterableToSetHandler{
  @override
  String get actionName => 'Set.toSet';
}

// uncheck
class YZSetElementAtHandler extends YZIterableElementAtHandler {
  @override
  String get actionName => "Set.elementAt";
}

// uncheck
class YZSetLengthHandler extends YZIterableLengthHandler {
  @override
  String get actionName => "Set.length";
}

// uncheck
class YZSetIsEmptyHandler extends YZIterableIsEmptyHandler {
  @override
  String get actionName => "Set.isEmpty";
}

// uncheck
class YZSetIsNotEmptyHandler extends YZIterableIsNotEmptyHandler {
  @override
  String get actionName => "Set.isNotEmpty";
}

// uncheck
class YZSetFirstHandler extends YZIterableFirstHandler {
  @override
  String get actionName => "Set.first";
}

// uncheck
class YZSetLastHandler extends YZIterableLastHandler {
  @override
  String get actionName => "Set.last";
}

// uncheck
class YZSetFollowedByHandler extends YZIterableFollowedByHandler {
  @override
  String get actionName => "Set.followedBy";
}

// uncheck
class YZSetJoinHandler extends YZIterableJoinHandler {
  @override
  String get actionName => "Set.join";
}

// uncheck
class YZSetToListHandler extends YZIterableToListHandler {
  @override
  String get actionName => "Set.toList";
}

// uncheck
class YZSetTakeHandler extends YZIterableTakeHandler {
  @override
  String get actionName => "Set.take";
}

// uncheck
class YZSetSkipHandler extends YZIterableSkipHandler {
  @override
  String get actionName => "Set.skip";
}

// uncheck
class YZSetToStringHandler extends YZIterableToStringHandler {
  @override
  String get actionName => "Set.toString";
}

// checked by yjz
class YZSetIteratorHandler extends YZDynamicSysActionHandler{
  @override
  dynamic? func(Map? params) {
    if (params == null || params['target'] == null ) return null;
    Set? target = (params['target'] is Set) ? params['target'] : null;
    return target?.iterator;
  }

  @override
  String get actionName => 'Set.iterator';
}

// checked by yjz
class YZSetFromHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'Set.from';

  @override
  dynamic? func(Map? params) {
    if(params == null || params['elements'] == null) return null; 
    dynamic elements = (params['elements'] is Iterable) ? params['elements'] : null;
    return Set.from(elements);
  }
}

// checked by yjz
class YZSetOfHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'Set.of';

  @override
  dynamic? func(Map? params) {
    if(params == null || params['elements'] == null) return null; 
    dynamic elements = (params['elements'] is Iterable) ? params['elements'] : null;
    return Set.of(elements);
  }
}

// checked by yjz
class YZSetIdentityHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'Set.identity';

  @override
  dynamic? func(Map? params) {
    return Set.identity();
  }
}


/// todo: 
/// 函数：any/every/expand/firstWhere/removeWhere/fold/forEach/lastWhere/map/reduce
///      /singleWhere/skipWhere/takeWhile/where/castfrom
/// 泛型：cast/whereType/single
