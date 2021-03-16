/*
 * @Description: Divider分割线
 * @Author: chenlijiao
 * @Date: 2021-02-25 20:19:26
 * @LastEditors: chenlijiao
 * @LastEditTime: 2021-02-26 18:25:28
 */

import 'dart:ui';
import 'package:yz_flutter_dynamic/main.dart';
import 'package:yz_flutter_dynamic/widgets/basic/handler.dart';
import 'basic/utils.dart';
import 'basic/widget.dart';

class YZDividerHandler extends YZDynamicBasicWidgetHandler {
  @override
  String get widgetName => 'Divider';

  @override
  Widget build(Map<String, dynamic> json,
      {Key key, BuildContext buildContext}) {
    return _Builder(json, key: key);
  }
}

class _Builder extends YZDynamicBaseWidget {
  final Map<String, dynamic> json;

  _Builder(this.json, {Key key}) : super(json, key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends YZDynamicWidgetBasicState<_Builder> {
  YZDividerConfig props;

  double _thickness;
  double _height;
  double _indent;
  double _endIndent;
  Color _color;

  @override
  void initState() {
    super.initState();

    //Deal with props / 处理控件属性
    props = YZDividerConfig.fromJson(super.config.props) ?? {};
    _color = YZDinamicWidgetUtils.colorAdapter(props.color);
    _height = YZDinamicWidgetUtils.doubleAdapter(props.height);
    _thickness = YZDinamicWidgetUtils.doubleAdapter(props.thickness);
    _indent = YZDinamicWidgetUtils.doubleAdapter(props.indent);
    _endIndent = YZDinamicWidgetUtils.doubleAdapter(props.endIndent);
  }

  @override
  Widget build(BuildContext context) {
    Widget _widget;

    Divider _subwidget = Divider(
      color: _color,
      height: _height,
      thickness: _thickness,
      indent: _indent,
      endIndent: _endIndent,
    );

    //Deal with events / 处理事件
    _widget = super.buildWithEvents(_subwidget, super.config.xEvents);

    return _widget;
  }

  @override
  void registerActions() {
    //Deal with action / 处理事件实现
    actionFunctions['setState'] = stateSetter;
  }

  void stateSetter({
    Map params,
    YZDynamicRequest request,
    List<YZDynamicActionRule> rules,
    Map localVariables,
    State state,
  }) {
    print('Execute xAction: ${this.runtimeType} setState');
    if (mounted) {
      setState(() {});
    }
  }
}

class YZDividerConfig {
  String color;
  String height;
  String thickness;
  String indent;
  String endIndent;

  YZDividerConfig(
      {this.color, this.height, this.thickness, this.endIndent, this.indent});

  YZDividerConfig.fromJson(Map<dynamic, dynamic> json) {
    json ??= {};
    color = json['color'];
    height = json['height'];
    thickness = json['thickness'];
    indent = json['indent'];
    endIndent = json['endIndent'];
  }
}
