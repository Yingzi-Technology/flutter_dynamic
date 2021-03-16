/*  
* @Author: yz.yujingzhou     
* @Date: 2020-09-13 22:53:58     
 * @Last Modified by: yz.yujingzhou
 * @Last Modified time: 2020-11-26 18:11:40
**/   

import 'statefulwidget.dart';
import 'statelesswidget.dart';

import 'app_bar.dart';
import 'basic.dart';
import 'basic/handler.dart';
import 'button.dart';
import 'column.dart';
import 'container.dart';
import 'dialog.dart';
import 'expanded.dart';
import 'image.dart';
import 'padding.dart';
import 'row.dart';
import 'safe_area.dart';
import 'scaffold.dart';
import 'scroll_view.dart';
import 'text.dart';
import 'text_field.dart';
import 'divider.dart';

/// All handlers for register
List<YZDynamicBasicWidgetHandler> yzAllDynamicWidgetHandlers = [
  YZContainerHandler(),
  YZTextHandler(),
  YZTextFieldHandler(),
  YZColumnHandler(),
  YZExpandedHandler(),
  YZImageHandler(),
  YZPaddingHandler(),
  YZRowHandler(),
  YZSafeAreaHandler(),
  YZSingleChildScrollViewHandler(),
  YZScaffoldHandler(),
  YZAppBarHandler(),
  YZRawMaterialButtonHandler(),
  YZSizedBoxHandler(),
  YZDialogHandler(),
  YZStatefulWidgetHandler(),
  YZStatelessWidgetHandler(),
  YZDividerHandler(),
];
