/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-11-27 18:22:39 
 * @Last Modified by: yangyiting
 * @Last Modified time: 2021-03-01 14:35:30
 */

part of '../action.dart';

/// Storing all system handlers for register
/// 存放系统所有action的地方，注册的时候从这里取，看 commom.dart 里的 【reginsterPageExitHandler】
List<YZDynamicActionHandler> yzAllDynamicExitHandlers = [
     
  //router   
  YZRouterPopHandler(),

  //List
  YZListHandler(),
  YZListValueOfIndexHandler(),
  YZListGenerateHandler(),
  YZListIsEmptyHandler(),
  YZListIsNotEmptyHandler(),
  YZListLengthHandler(),
  YZListClearHandler(),
  YZListFirstHandler(),
  YZListLastHandler(),
  YZListAddHandler(),
  YZListAddAllHandler(),
  YZListIndexOfHandler(),
  YZListLastIndexOfHandler(),
  YZListInsertHandler(),
  YZListInsertAllHandler(),
  YZListSetAllHandler(),
  YZListRemoveHandler(),
  YZListRemoveAtHandler(),
  YZListRemoveLastHandler(),
  YZListSublistHandler(),
  YZListAsMapHandler(),

  //String
  YZStringHandler(),
  YZStringIsEmptyHandler(),   
  YZStringIsNotEmptyHandler(),
  YZStringPlusHandler(),
  YZStringLengthHandler(),
  YZStringCompareToHandler(),
  YZStringIndexOfHandler(),
  YZStringLastIndexOfHandler(),
  YZStringContainsHandler(),
  YZStringEndsWithHandler(),
  YZStringStartsWithHandler(),
  YZStringPadLeftHandler(),
  YZStringPadRightHandler(),
  YZStringReplaceAllHandler(),
  YZStringReplaceFirstHandler(),
  YZStringReplaceRangeHandler(),
  YZStringSubstringHandler(),
  YZStringToLowerCaseHandler(),
  YZStringToUpperCaseHandler(),
  YZStringTrimHandler(),
  YZStringTrimLeftHandler(),
  YZStringTrimRightHandler(),
  YZStringSplitHandler(), 
  YZStringAllMatchesHandler(),
  YZStringMatchAsPrefix(), 

  //RegExp
  YZRegExpHasMatchHandler(),  

  //Number
  YZIntHandler(),
  YZDoubleHandler(),
  YZNumHandler(),  
  YZPlusHandler(),
  YZMultiHandler(),
  YZSubHandler(),
  YZDivHandler(),
  YZParseHandler(),
  YZTryParseHandler(),
  YZIsNaNHandler(),
  YZIsInfiniteHandler(),
  YZIsFiniteHandler(),
  YZIsNegativeHandler(),
  YZAbsHandler(),
  YZClampHandler(),
  YZCeilHandler(),
  YZCeilToDoubleHandler(),
  YZCompareToHandler(),
  YZFloorHandler(),
  YZFloorToDoubleHandler(),
  YZRoundHandler(),
  YZRoundToDoubleHandler(),
  YZToDoubleHandler(),
  YZToIntHandler(),
  YZTruncateHandler(),
  YZTruncateToDoubleHandler(),
  YZToStringHandler(),
  YZToStringAsExponentialHandler(),
  YZToStringAsFixedHandler(),
  YZToStringAsPrecisionHandler(),  

  //Map
  YZMapHandler(),
  YZMapValueOfKeyHandler(),
  YZMapIsEmptyHandler(),
  YZMapIsNotEmptyHandler(),
  YZMapLengthHandler(),
  YZMapContainsValueHandler(),
  YZMapContainsKeyHandler(),
  YZMapRemoveKeyHandler(),
  YZMapClearHandler(),  

  //Set
  YZSetHandler(),
  YZSetContainsHandler(),
  YZSetAddHandler(),
  YZSetAddAllHandler(),
  YZSetRemoveHandler(),
  YZSetLookupHandler(),
  YZSetRemoveALlHandler(),
  YZSetRetainALlHandler(),
  YZSetContainsAllHandler(),
  YZSetIntersectionAllHandler(),
  YZSetUnionHandler(),
  YZSetDifferenceHandler(),
  YZSetClearHandler(),
  YZSetToSetHandler(),  

  //control flow
  YZIfElseHandler(),
  YZSwitchCaseHandler(), 
  YZForLoopHandler(),
  YZWhileHandler(),

  //Sys
  YZBoolHandler(),
  YZSysBoolHandler(),
  YZSysBoolToStringHandler(),
  YZSysReturnHandler(),
  YZSysPrintHandler(),
  YZSysEqHandler(),
  YZSysNeqHandler(),
  YZSysGtHandler(),
  YZSysEgtHandler(),
  YZSysLtHandler(),
  YZSysEltHandler(),
  YZSysIsNullHandler(),
  YZSysInverterHandler(),
  YZSysAndHandler(),
  YZSysOrHandler(),
];
