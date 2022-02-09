import 'package:flutter/material.dart';

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter({
    required this.circleWidth,
    required this.blurSigma,
    required this.circleColor,
  });

  final double circleWidth;
  final double blurSigma;
  final Color circleColor;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width, size.height),
      circleWidth,
      Paint()
        ..color = circleColor
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma),
    );

  }

  @override
  bool shouldRepaint(CircleBlurPainter oldDelegate) => false;
}
