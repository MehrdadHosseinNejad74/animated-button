import 'package:flutter/material.dart';
import 'package:key_animatoin/screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Button',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
