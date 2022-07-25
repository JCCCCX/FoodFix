import 'package:flutter/material.dart';
import 'package:foodfix/function/login/login_main_page.dart';
import 'package:foodfix/student/student_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodFix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF04008d),
        primarySwatch: Colors.indigo,
      ),
      home: const LoginMainPage(),
    );
  }
}
