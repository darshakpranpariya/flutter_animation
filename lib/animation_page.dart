import 'package:flutter/material.dart';
import 'dart:math' as math;


class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> 
with SingleTickerProviderStateMixin{

  AnimationController animController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animController = AnimationController(duration:Duration(seconds: 15),
    vsync: this,
    );

    final curvedAnimation = CurvedAnimation(
      parent: animController,
      curve: Curves.bounceIn,
      reverseCurve: Curves.easeOut,
    );

    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(curvedAnimation)
    ..addListener(() {
      setState(() {
      });
    })
    ..addStatusListener((status) {
      if(status==AnimationStatus.completed){
        animController.reverse();
      }
      else{
        animController.forward();
      }
    });

    animController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.rotate(
        angle: animation.value,
        child: Center(
          child: Container(
            margin: EdgeInsets.all(20),
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('asset/logo.png'),
                fit: BoxFit.fill
              ),
            ),
          ),
        ),
      ),
    );
  }
}
