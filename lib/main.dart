import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //nếu chỗ này để Colors.black, icon màu đen sẽ bị ẩn.
        primaryColor: Colors.blue.shade300,
      ),
      initialRoute: Routes.MAIN,
      getPages: AppPages.routes,
    );
  }
}
