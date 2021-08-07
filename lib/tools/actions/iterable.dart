/*
 * @Author: yangyiting 
 * @Date: 2021-03-10 10:56:08 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-10 17:49:12
 * @Describe: 将 Iterable 中的方法集中，减少 Iterable、Set的重复逻辑编写
 */

import 'package:yz_flutter_dynamic/tools/common.dart';

// unchecked by yjz 抽象类不用实现，有实现类来实现它

// uncheck
class YZIterableHandler extends YZDynamicSysActionHandler{
  @override
  Map func(Map params) {
    return params;
  }

  @override
  String get actionName => 'Iterable';

}

// uncheck
class YZIterableLengthHandler extends YZDynamicSysActionHandler {
  @override
  int func(Map params) {
    if (params == null || params['iterable'] == null) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    return iterable?.length;
  }

  @override
  String get actionName => 'Iterable.length';
}

// uncheck
class YZIterableIsEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null || params['iterable'] == null) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;

    return iterable?.isEmpty;
  }

  @override
  String get actionName => 'Iterable.isEmpty';
}

// uncheck
class YZIterableIsNotEmptyHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {

    if (params == null || params['iterable'] == null) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;

    return iterable?.isNotEmpty;
  }

  @override
  String get actionName => 'Iterable.isNotEmpty';
}

// uncheck
class YZIterableFirstHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    
    return iterable?.first;

  }

  @override
  String get actionName => 'Iterable.first';
}

// uncheck
class YZIterableLastHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    
    return iterable?.last;
  }

  @override
  String get actionName => 'Iterable.last';
}

// uncheck
// A.followedBy(B):按顺序将B的元素放在A元素之后，返回一个Iterable
class YZIterableFollowedByHandler extends YZDynamicSysActionHandler {
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    Iterable other = (params['other'] is Iterable) ? params['other'] : null;
    if(iterable != null && other !=null) {
      return iterable?.followedBy(other);
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.followedBy';
}

// uncheck
class YZIterableContainsHandler extends YZDynamicSysActionHandler {
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    dynamic element = params['element'] ?? params['element'];
    if(iterable != null) {
      return iterable?.contains(element);
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.contains';
}

// uncheck
// 将集合中的元素用 separator 分割开，并返回一个字符串
class YZIterableJoinHandler extends YZDynamicSysActionHandler {
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    String separator = (params['separator'] is String) ? params['separator'].toString() : '';
    if(iterable != null) {
      return iterable?.join(separator);
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.join';
}

// uncheck
class YZIterableToListHandler extends YZDynamicSysActionHandler {
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    bool growable = (params['growable'] is bool) ? params['growable'] : true;
    if(iterable != null) {
      return iterable?.toList(growable: growable);
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.toList';
}

// uncheck
class YZIterableToSetHandler extends YZDynamicSysActionHandler {
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    if(iterable != null) {
      return iterable?.toSet();
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.toSet';
}

// uncheck
// 返回集合中的前 count 个元素
class YZIterableTakeHandler extends YZDynamicSysActionHandler {
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    int count = (params['count'] is int) ? params['count'] : int.tryParse(params['count']) ;
    if(iterable != null && count != null) {
      return iterable?.take(count);
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.take';
}

// uncheck
// 跳过集合中的前 count 个元素然后返回
class YZIterableSkipHandler extends YZDynamicSysActionHandler {
  @override
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    int count = (params['count'] is int) ? params['count'] : int.tryParse(params['count']) ;
    if(iterable != null && count != null) {
      return iterable?.skip(count);
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.skip';
}

// uncheck
class YZIterableElementAtHandler extends YZDynamicSysActionHandler {
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    int index = (params['index'] is int) ? params['index'] : int.tryParse(params['index']) ;
    if(iterable != null && index != null) {
      return iterable?.elementAt(index);
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.elementAt';
}

// uncheck
class YZIterableToStringHandler extends YZDynamicSysActionHandler {
  dynamic func(Map params) {
    if (params == null || params['iterable'] == null ) return null;
    Iterable iterable = (params['iterable'] is Iterable) ? params['iterable'] : null;
    if(iterable != null) {
      return iterable?.toString();
    }
    return null;
  }

  @override
  String get actionName => 'Iterable.toString';
}

/// todo:
/// 泛型：single/cast/castFrom/whereType
/// 函数：map/where/expand/forEach/reduce/fold/every/any/takeWhile/skipWhile/firstWhere/lastWhere/singleWhere
