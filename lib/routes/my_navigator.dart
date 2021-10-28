import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyNavigator extends StatelessWidget {
  final navigatorKey;
  final String name;
  final Widget widget;

  MyNavigator(
      {required this.navigatorKey, required this.name, required this.widget});

  @override
  Widget build(BuildContext context) {
    print('Building $name with navigatorKey: ' + navigatorKey.toString());
    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        return GetPageRoute(
          page: () => widget,
          routeName: '/$name',
        );
      },
    );
  }
}
