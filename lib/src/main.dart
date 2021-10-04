import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:task/src/theme.dart';
import 'package:task/src/views/home_page.dart';
import 'package:task/src/views/success_page.dart';
import 'package:task/src/views/timer_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Themes.light,
      initialRoute: "/",
      getPages: [
        GetPage(name:"/", page:()=>Home()),
        GetPage(name:"/timer", page:()=>Timer()),
        GetPage(name:"/success", page:()=>Success())
      ],
    );
  }
}

