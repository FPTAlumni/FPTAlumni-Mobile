import 'package:flutter/material.dart';

class MyKeys {
  static final GlobalKey<NavigatorState> home = GlobalKey(debugLabel: 'home');
  static final GlobalKey<NavigatorState> jobs = GlobalKey(debugLabel: 'jobs');
  static final GlobalKey<NavigatorState> referral =
      GlobalKey(debugLabel: 'referral');
  static final GlobalKey<NavigatorState> profile =
  GlobalKey(debugLabel: 'profile');

  static List<GlobalKey> getKeys() => [home, jobs, referral, profile];
}
