/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-26 16:50:20 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-24 17:38:54
 */

part of '../action.dart';


// uncheck:平方根
class YZMathSqrtHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? sqrt(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.sqrt';
}

// uncheck:e的value次方
class YZMathExpHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? exp(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.exp';
}

// uncheck:对数
class YZMathLogHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? log(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.log';
}

// uncheck:最小值
class YZMathMinHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    if (params == null || params['value1'] == null || params['value2'] == null) return null;
    num ret1 = (params['value1'] is num) ? params['value1'] : null;
    num ret2 = (params['value2'] is num) ? params['value2'] : null;
    return min(ret1, ret2);
  }

  @override
  String get actionName => 'Math.min';
}

// uncheck:最大值
class YZMathMaxHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    if (params == null || params['value1'] == null || params['value2'] == null) return null;
    num ret1 = (params['value1'] is num) ? params['value1'] : null;
    num ret2 = (params['value2'] is num) ? params['value2'] : null;
    return max(ret1, ret2);
  }

  @override
  String get actionName => 'Math.max';
}

// uncheck:幂，value的exponent次方
class YZMathPowHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    if (params == null || params['value'] == null || params['exponent'] == null) return null;
    num ret1 = (params['value'] is num) ? params['value'] : null;
    num ret2 = (params['exponent'] is num) ? params['exponent'] : null;
    return pow(ret1, ret2);
  }

  @override
  String get actionName => 'Math.pow';
}

// uncheck: sin(传入参数为弧度)
class YZMathSinHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? sin(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.sin';
}

// uncheck: cos(传入参数为弧度)
class YZMathCosHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? cos(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.cos';
}

// uncheck: tan(传入参数为弧度)
class YZMathTanHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? tan(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.tan';
}

// uncheck: asin,返回的是一个数值的反正弦弧度值
class YZMathASinHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? asin(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.asin';
}

// uncheck: acos,返回的是一个数值的反余弦弧度值
class YZMathACosHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? acos(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.acos';
}

// uncheck: atan,返回的是一个数值的反正切弧度值
class YZMathATanHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value'] == null) return null;
    double ret = (params['value'] is num) ? atan(params['value']) : null;
    return ret;
  }

  @override
  String get actionName => 'Math.atan';
}

// uncheck:反正切
class YZMathATan2Handler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    if (params == null || params['value1'] == null || params['value2'] == null) return null;
    num ret1 = (params['value1'] is num) ? params['value1'] : null;
    num ret2 = (params['value2'] is num) ? params['value2'] : null;
    return atan2(ret1, ret2);
  }

  @override
  String get actionName => 'Math.atan2';
}

/// 一些常数的值：

// e:
class YZMathEHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return e;
  }

  @override
  String get actionName => 'Math.e';
}

// ln10:
class YZMathLn10Handler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return ln10;
  }

  @override
  String get actionName => 'Math.ln10';
}

// ln2:
class YZMathLn2Handler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return ln2;
  }

  @override
  String get actionName => 'Math.ln2';
}

// log2e:
class YZMathLog2eHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return log2e;
  }

  @override
  String get actionName => 'Math.log2e';
}

// log10e:
class YZMathLog10eHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return log10e;
  }

  @override
  String get actionName => 'Math.log10e';
}

// pi:
class YZMathPiHandler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return pi;
  }

  @override
  String get actionName => 'Math.pi';
}


// sqrt1_2: 1/2的算数平方根
class YZMathSqrt12Handler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return sqrt1_2;
  }

  @override
  String get actionName => 'Math.sqrt1_2';
}

// sqrt2: 2的算数平方根
class YZMathSqrt2Handler extends YZDynamicSysActionHandler{
  @override
  double func(Map params) {
    return sqrt2;
  }

  @override
  String get actionName => 'Math.sqrt2';
}