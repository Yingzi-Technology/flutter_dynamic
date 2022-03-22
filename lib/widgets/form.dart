/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-13 21:03:33     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-03 11:37:43
**/   

import 'package:flutter/material.dart';

/// encapsulation of Form
class YZForm extends Form {

  YZForm({
    Key? key,
    Widget? child,
    AutovalidateMode? autovalidateMode,
    WillPopCallback? onWillPop,
    VoidCallback? onChanged,
  }) : assert(child != null),
       super(
          key: key,
          child: child!,
          autovalidateMode: autovalidateMode,
          onWillPop: onWillPop,
          onChanged: onChanged
       );  
}