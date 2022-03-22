/* 
 * @Author: yz.yujingzhou 
 * @Date: 2020-12-25 11:22:29 
 * @Last Modified by:   yz.yujingzhou 
 * @Last Modified time: 2020-12-25 11:22:29  
 */

import 'package:yz_flutter_dynamic/main.dart';
import 'base.dart';

class YZUserCodeHandler extends YZDynamicUserActionHandler{
  @override
  dynamic userCode(BuildContext context, {
    String userCode, 
    Map localVariables,
    State state,
  }){

    print(userCode);

  }
}

class UTUserCode extends StatefulWidget {
  @override
  _UTUserCodeState createState() => _UTUserCodeState();
}

class _UTUserCodeState extends UTBaseState<UTUserCode> {

  String get getTitle => "User Code";

  List<Widget> getItem() {
    return [
      createItem("User Code", 
      '''userCode:
      var:<c:total>=int(0);
      while (Sys.<=(<c:total>, int(10))) {
        var:<c:total>=num.+(<c:total>, 1);       
      };         
      var:<c:ret>=var:<c:total>;
      action:String(var:<c:ret>)
      ''')                   
    ];
  }

}