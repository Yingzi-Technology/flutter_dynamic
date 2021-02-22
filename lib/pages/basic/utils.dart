/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-14 21:37:16     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2021-01-27 14:59:17
**/   

import 'dart:ui';

class YZDinamicPageUtils {

  static pageMode(String pagetMode) {
    switch (pagetMode) {
      case 'dialog':
        return YZDinamicPageMode.dialog;
        break;
      default:
        return YZDinamicPageMode.navpage;
    }
  }

  ///adapt dsl color to the flutter color 0xff123456
  static Color colorAdapter(String colorString){
    Color color;
    if (colorString != null) {
      int v = int.tryParse(colorString);
      color = v != null ? Color(v) : null;
    }

    return color;
  }   

}

enum YZDinamicPageMode {
  dialog,
  navpage,
}