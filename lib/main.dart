import 'package:flutter/material.dart';
import 'Screens/SplashScreen.dart';

final String version= "1.0.0";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Animated Login Page',
      home: SplashScreen(),
    );
  }
}