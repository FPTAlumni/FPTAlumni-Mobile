import 'package:flutter/material.dart';

class MyKeys {
  GlobalKey<NavigatorState> home = GlobalKey(debugLabel: 'home');
  GlobalKey<NavigatorState> jobs = GlobalKey(debugLabel: 'jobs');
  GlobalKey<NavigatorState> referral =
      GlobalKey(debugLabel: 'referral');
  GlobalKey<NavigatorState> profile =
  GlobalKey(debugLabel: 'profile');

  List<GlobalKey> getKeys() => [home, jobs, referral, profile];
}
