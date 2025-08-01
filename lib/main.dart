import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:productlist/feature/home/view/Home_screen_view.dart';
import 'package:productlist/theme/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (_ , child) {
    return GetMaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Product list..',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreenView()
    );
  });}
}
