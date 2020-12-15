/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-14 21:37:16     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-09-14 21:43:09
**/   

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

}

enum YZDinamicPageMode {
  dialog,
  navpage,
}