import 'package:flutter/material.dart';
import 'package:forumapp/views/login_page.dart';
import 'package:forumapp/views/widgets/home.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forum App',
      //TODO:: CAMBIAR A LOGIN PAGE
      //home: LoginPage(),
      home: HomePage(),
    );
  }
}
