import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:key_animatoin/widget/animated_border.dart';
import 'package:key_animatoin/widget/start_button.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _borderAnimationController;
  AnimationController _buttonAnimationController;

  @override
  void initState() {
    super.initState();

    //Animated Border Controller
    _borderAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    //Button Border Controller
    _buttonAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _borderAnimationController.addStatusListener((status) {
      if (_borderAnimationController.status == AnimationStatus.completed) {
        _buttonAnimationController.reverse();
        _borderAnimationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    _borderAnimationController.dispose();
    _buttonAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff29304D),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            AnimatedBorder(_borderAnimationController),
            StartButton(
                buttonAnimationController: _buttonAnimationController,
                onTap: () {
                  _borderAnimationController.forward();
                })
          ],
        ));
  }
}
