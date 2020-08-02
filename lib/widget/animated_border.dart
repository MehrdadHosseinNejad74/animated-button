import 'dart:math';

import 'package:flutter/cupertino.dart';

class AnimatedBorder extends AnimatedWidget {

  final AnimationController controller;

  AnimatedBorder(this.controller) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: CirclePaint(
          color: controller
              .drive(
                  ColorTween(begin: Color(0xff2573D5), end: Color(0xff29304D)))
              .value,
          angle: controller
              .drive(Tween<double>(begin: 0, end: 1))
              .drive(CurveTween(curve: Curves.ease))
              .value,
          radius: size.width * 0.44 / 2,
          center: Offset(size.width / 2, size.height / 2)),
    );
  }
}

class CirclePaint extends CustomPainter {
  final double angle;
  final Offset center;
  final double radius;
  final Color color;

  CirclePaint({this.color, this.angle, this.center, this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(center: center, radius: radius);
    final startAngle = -pi / 2;
    final sweepAngle = 2 * pi * angle;
    final useCenter = false;
    final paint = Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
