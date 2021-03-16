/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-10-26 16:50:20 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-01 14:36:33
 */

part of '../action.dart';

/*
 * Define some default system public actions
 * 定义一些系统默认的公开actions
 */

///定义变量或初始化
///Defined variable or init value
class YZSysReturnHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    if (params == null) return null;

    dynamic value = params['value'];
    if (value == null) { //或取第一个值
      for (var v in params.values) {
        value = v;
        break;
      } 
    }   

    return value;    
  }

  @override
  String get actionName => 'Sys.return';

}

class YZSysBoolHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    if (params == null) return false;

    dynamic value = params['value'];
    if (value == null) { //或取第一个值
      for (var v in params.values) {
        value = v;
        break;
      } 
    }     
    if (value == null) return false;

    if (value is bool) return value;
    return value == "true" ? true : false;    
  }

  @override
  String get actionName => 'Sys.bool';

}

class YZSysBoolToStringHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    if(params == null) return null;
    dynamic value = params['value'];
    if (value == null) { //或取第一个值
      for (var v in params.values) {
        value = v;
        break;
      } 
    } 

    if(value == 'true') return 'true';
    if(value == 'false') return 'false';

    return null;
  }

  @override
  String get actionName => 'Sys.bool.toString';
}

class YZBoolHandler extends YZSysBoolHandler{

  @override
  String get actionName => 'bool';

}

class YZSysEqHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
    
    if (params == null) return null;
    dynamic opt1 = params['value'];
    dynamic opt2 = params['value1'];

    if (opt1 == null || opt2 == null) {
      for (var v in params.values) {
        if (opt1 == null) {
          opt1 = v;
          continue;
        }
        if (opt2 == null) {
          opt2 = v;
          break;
        }  
      } 
    }     
    
    return opt1 == opt2;
    
  }

  @override
  String get actionName => 'Sys.==';

}


class YZSysNeqHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
  
    if (params == null) return null;
    dynamic opt1 = params['value'];
    dynamic opt2 = params['value1'];

    if (opt1 == null || opt2 == null) {
      for (var v in params.values) {
        if (opt1 == null) {
          opt1 = v;
          continue;
        }
        if (opt2 == null) {
          opt2 = v;
          break;
        }  
      } 
    } 
    
    return opt1 != opt2;

  }

  @override
  String get actionName => 'Sys.!=';

}

class YZSysGtHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
  
    if (params == null) return null;
    dynamic opt1 = (params['value'] != null ? num.tryParse(params['value']) : null);
    dynamic opt2 = (params['value1'] != null ? num.tryParse(params['value1']) : null);

    if (opt1 == null || opt2 == null) {
      for (var v in params.values) {
        if (opt1 == null) {
          opt1 = ((v is num) ?v : num.tryParse(v));
          continue;
        }
        if (opt2 == null) {
          opt2 = ((v is num) ?v : num.tryParse(v));
          break;
        }  
      } 
    } 

    if (!(opt1 is num)) throw 'Error opt1 type must be num';
    if (!(opt2 is num)) throw 'Error opt2 type must be num';    

    return opt1 > opt2;

  }

  @override
  String get actionName => 'Sys.>';

}

class YZSysEgtHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
  
    if (params == null) return null;
    dynamic opt1 = (params['value'] != null ? num.tryParse(params['value']) : null);
    dynamic opt2 = (params['value1'] != null ? num.tryParse(params['value1']) : null);

    if (opt1 == null || opt2 == null) {
      for (var v in params.values) {
        if (opt1 == null) {
          opt1 = ((v is num) ?v : num.tryParse(v));
          continue;
        }
        if (opt2 == null) {
          opt2 = ((v is num) ?v : num.tryParse(v));
          break;
        }  
      } 
    } 

    if (!(opt1 is num)) throw 'Error opt1 type must be num';
    if (!(opt2 is num)) throw 'Error opt2 type must be num';  

    return opt1 >= opt2;

  }

  @override
  String get actionName => 'Sys.>=';

}

class YZSysLtHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    dynamic opt1 = (params['value'] != null ? num.tryParse(params['value']) : null);
    dynamic opt2 = (params['value1'] != null ? num.tryParse(params['value1']) : null);

    if (opt1 == null || opt2 == null) {
      for (var v in params.values) {
        if (opt1 == null) {
          opt1 = ((v is num) ?v : num.tryParse(v));
          continue;
        }
        if (opt2 == null) {
          opt2 = ((v is num) ?v : num.tryParse(v));
          break;
        }  
      } 
    } 

    if (!(opt1 is num)) throw 'Error opt1 type must be num';
    if (!(opt2 is num)) throw 'Error opt2 type must be num';  

    return opt1 < opt2;

  }

  @override
  String get actionName => 'Sys.<';

}

class YZSysEltHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {
  
    if (params == null) return null;
    dynamic opt1 = (params['value'] != null ? num.tryParse(params['value']) : null);
    dynamic opt2 = (params['value1'] != null ? num.tryParse(params['value1']) : null);

    if (opt1 == null || opt2 == null) {
      for (var v in params.values) {
        if (opt1 == null) {
          opt1 = ((v is num) ?v : num.tryParse(v));
          continue;
        }
        if (opt2 == null) {
          opt2 = ((v is num) ?v : num.tryParse(v));
          break;
        }  
      } 
    } 

    if (!(opt1 is num)) throw 'Error opt1 type must be num';
    if (!(opt2 is num)) throw 'Error opt2 type must be num';  

    return opt1 <= opt2;

  }

  @override
  String get actionName => 'Sys.<=';

}

class YZSysIsNullHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    dynamic value = params['value'];
    if (value == null) { //获取第一个值
      for (var v in params.values) {
        value = v;
        break;
      } 
    }     

    return value == null;    
  
  }

  @override
  String get actionName => 'Sys.isNull';

}

class YZSysPrintHandler extends YZDynamicSysActionHandler{
  @override
  dynamic func(Map params) {

    if (params == null) return null;
    dynamic value = params['value'];
    if (value == null) { //获取第一个值
      for (var v in params.values) {
        value = v;
        break;
      } 
    }     
    print(value);
  }

  @override
  String get actionName => 'Sys.print';

}

class YZSysInverterHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
  
    if (params == null) return null;

    dynamic opt1 = params['value'];
    if (opt1 == null) { //获取第一个值
      for (var v in params.values) {
        opt1 = v;
        break;
      } 
    }  

    opt1 = (opt1 is bool) ?opt1 : null;

    return !opt1;

  }

  @override
  String get actionName => 'Sys.!';

}

class YZSysAndHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
  
    if (params == null) return null;

    bool ret = true;
    params.forEach((key, value) {
      bool opt = ((value is bool) ? value : false);
      if (opt == null) return false;
      ret = ret && opt;
    });
    
    return ret;

  }

  @override
  String get actionName => 'Sys.&&';

}

class YZSysOrHandler extends YZDynamicSysActionHandler{
  @override
  bool func(Map params) {
  
    if (params == null) return null;

    bool ret = false;
    params.forEach((key, value) {
      bool opt = ((value is bool) ? value : false);
      if (opt == null) return false;
      ret = ret || opt;
    });
    
    return ret;

  }

  @override
  String get actionName => 'Sys.||';

}