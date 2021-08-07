/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-27 18:07:36 
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-27 18:30:41
 */

part of '../action.dart';

class YZIntHandler extends YZDynamicSysActionHandler{
  @override
  int func(Map params) {

    if (params == null) return null;
    int ret;
    for (var value in params.values) {
      ret = ((value is int) ? value : int.tryParse(value));
      break;
    }

    return ret;
  }

  @override
  String get actionName => 'int';

}

class YZDoubleHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {

    if (params == null) return null;
    double ret;
    for (var value in params.values) {
      ret = ((value is double) ? value : double.tryParse(value));
      break;
    }

    return ret;
  }

  @override
  String get actionName => 'double';

}

class YZNumHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {

    if (params == null) return null;
    num ret;
    for (var value in params.values) {
      ret = ((value is num) ? value : num.tryParse(value));
      break;
    }

    return ret;
  }

  @override
  String get actionName => 'num';

}

class YZPlusHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;
    num ret;
    params.forEach((key, value) {
      num opt = ((value is num) ? value : num.tryParse(value));
      if (opt == null) return;
      ret = (ret ?? 0) + opt;
    });
    
    return ret;
  }

  @override
  String get actionName => 'num.+';
}

class YZSubHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    params.forEach((key, value) {
      num opt = ((value is num) ? value : num.tryParse(value));
      if (opt == null) return;
      if (ret == null) {
        ret = opt;
        return;
      } 
      ret = ret - opt;
    });
    
    return ret;
  }

  @override
  String get actionName => 'num.-';

}

class YZMultiHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;
    num ret;
    params.forEach((key, value) {
      num addend = ((value is num) ? value : num.tryParse(value));
      if (addend == null) return;
      ret = (ret ?? 1) * addend;
    });
    
    return ret;
  }

  @override
  String get actionName => 'num.*';

}

class YZDivHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    params.forEach((key, value) {
      num opt = ((value is num) ? value : num.tryParse(value));
      if (opt == null) return;
      if (ret == null) {
        ret = opt;
        return;
      } 
      ret = ret / opt;
    });
    
    return ret;
  }

  @override
  String get actionName => 'num./';

}

// uncheck: 取余 
class YZRemainderHandler extends YZDynamicSysActionHandler {
  @override
  String get actionName => 'num.%';

  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    params.forEach((key, value) {
      num opt = ((value is num) ? value : num.tryParse(value));
      if (opt == null) return;
      if (ret == null) {
        ret = opt;
        return;
      } 
      ret = ret % opt;
    });
    
    return ret;
  }
}

// uncheck: +=
class YZPlusEqualHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret = (params['ret'] is num) ? params['ret'] : num.tryParse(params['ret']);
    num opt = (params['opt'] is num) ? params['opt'] : num.tryParse(params['opt']);
    
    ret += opt;
    
    return ret;
  }

  @override
  String get actionName => 'num.+=';
}

// uncheck: -=
class YZSubEqualHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret = (params['ret'] is num) ? params['ret'] : num.tryParse(params['ret']);
    num opt = (params['opt'] is num) ? params['opt'] : num.tryParse(params['opt']);
    
    ret -= opt;
    
    return ret;
  }

  @override
  String get actionName => 'num.-=';
}

// uncheck: *=
class YZMultiEqualHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret = (params['ret'] is num) ? params['ret'] : num.tryParse(params['ret']);
    num opt = (params['opt'] is num) ? params['opt'] : num.tryParse(params['opt']);
    
    ret *= opt;
    
    return ret;
  }

  @override
  String get actionName => 'num.*=';
}

// uncheck: /=
class YZDivEqualHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret = (params['ret'] is num) ? params['ret'] : num.tryParse(params['ret']);
    num opt = (params['opt'] is num) ? params['opt'] : num.tryParse(params['opt']);
    
    ret /= opt;
    
    return ret;
  }

  @override
  String get actionName => 'num./=';
}

class YZParseHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    String ret;
    for (var value in params.values) {
      ret = value;
      break;
    }    
    
    return num.parse(ret);
  }

  @override
  String get actionName => 'num.parse';

}

class YZTryParseHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    String ret;
    for (var value in params.values) {
      ret = value;
      break;
    }    
    
    return num.tryParse(ret);
  }

  @override
  String get actionName => 'num.tryParse';

}

class YZIsNaNHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }     
    
    return ret?.isNaN;
  }

  @override
  String get actionName => 'num.isNaN';

}

class YZIsInfiniteHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    } 
    
    return ret?.isInfinite;
  }

  @override
  String get actionName => 'num.isInfinite';

}

class YZIsFiniteHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    } 
    
    return ret?.isFinite;
  }

  @override
  String get actionName => 'num.isFinite';

}

class YZIsNegativeHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }     
    
    return ret?.isNegative;
  }

  @override
  String get actionName => 'num.isNegative';

}

class YZAbsHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    } 
    
    return ret?.abs();
  }

  @override
  String get actionName => 'num.abs';

}

class YZClampHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    } 
    num lowerLimit = ((params['lowerLimit'] is num) ? params['lowerLimit'] : num.tryParse(params['lowerLimit']));
    num upperLimit = ((params['upperLimit'] is num) ? params['upperLimit'] : num.tryParse(params['upperLimit']));
    
    return ret?.clamp(lowerLimit, upperLimit);
  }

  @override
  String get actionName => 'num.clamp';

}

class YZCeilHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    } 
    
    return ret?.ceil();
  }

  @override
  String get actionName => 'num.ceil';

}

class YZCeilToDoubleHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    } 
    
    return ret?.ceilToDouble();
  }

  @override
  String get actionName => 'num.ceilToDouble';

}

class YZCompareToHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num value, other;
    for (var v in params.values) {
      if (value == null) {
        value = ((v is num) ?v : num.tryParse(v));
        continue;
      }
      if (other == null) {
        other = ((v is num) ?v : num.tryParse(v));
        break;
      }     
    }
    
    return value?.compareTo(other);
  }

  @override
  String get actionName => 'num.compareTo';

}

class YZFloorHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    } 
    
    return ret?.floor();
  }

  @override
  String get actionName => 'num.floor';

}

class YZFloorToDoubleHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.floorToDouble();
  }

  @override
  String get actionName => 'num.floorToDouble';

}

class YZRoundHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.round();
  }

  @override
  String get actionName => 'num.round';

}

class YZRoundToDoubleHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.roundToDouble();
  }

  @override
  String get actionName => 'num.roundToDouble';

}

class YZToDoubleHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.toDouble();
  }

  @override
  String get actionName => 'num.toDouble';

}

class YZToIntHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.toInt();
  }

  @override
  String get actionName => 'num.toInt';

}

class YZTruncateHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.truncate();
  }

  @override
  String get actionName => 'num.truncate';

}

class YZTruncateToDoubleHandler extends YZDynamicSysActionHandler{
  @override
  num func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.truncateToDouble();
  }

  @override
  String get actionName => 'num.truncateToDouble';

}

class YZToStringHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.toString();
  }

  @override
  String get actionName => 'num.toString';

}

class YZToStringAsExponentialHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;

    num ret;
    for (var value in params.values) {
      ret = ((value is num) ?value : num.tryParse(value));
      break;
    }
    
    return ret?.toStringAsExponential();
  }

  @override
  String get actionName => 'num.toStringAsExponential';

}

class YZToStringAsFixedHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;

    num value; int fractionDigits;
    for (var v in params.values) {
      if (value == null) {
        value = ((v is num) ?v : num.tryParse(v));
        continue;
      }
      if (fractionDigits == null) {
        fractionDigits = ((v is int) ?v : int.tryParse(v));
        break;
      }  
    }
    
    return value?.toStringAsFixed(fractionDigits);
  }

  @override
  String get actionName => 'num.toStringAsFixed';

}

class YZToStringAsPrecisionHandler extends YZDynamicSysActionHandler{
  @override
  String func(Map params) {
    if (params == null) return null;

    num value; int fractionDigits;
    for (var v in params.values) {
      if (value == null) {
        value = ((v is num) ?v : num.tryParse(v));
        continue;
      }
      if (fractionDigits == null) {
        fractionDigits = ((v is int) ?v : int.tryParse(v));
        break;
      }  
    }
    
    return value?.toStringAsPrecision(fractionDigits);
  }

  @override
  String get actionName => 'num.toStringAsPrecision';

}
