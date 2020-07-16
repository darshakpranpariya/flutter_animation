import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Animation in flutter",
      home: AnimationPage(),
    );
  }
}