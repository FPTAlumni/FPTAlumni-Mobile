import 'package:flutter/material.dart';

class MyKeys {
  static final GlobalKey<NavigatorState> home = GlobalKey(debugLabel: 'home');
  static final GlobalKey<NavigatorState> jobs = GlobalKey(debugLabel: 'jobs');
  static final GlobalKey<NavigatorState> groups =
      GlobalKey(debugLabel: 'groups');
  static final GlobalKey<NavigatorState> menu = GlobalKey(debugLabel: 'menu');

  static List<GlobalKey> getKeys() => [home, jobs, groups, menu];
}
