import 'package:flutter/material.dart';
import 'package:omed_cieo/routes.dart';
import 'package:omed_cieo/splashpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      initialRoute: SplashPage.routeName,
      routes: routes,
    );
  }
}