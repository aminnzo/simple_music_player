import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';
import 'package:simple_music_player/app/widgets/background/circle_blur_painter.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsBase.background,
      child: Stack(
        children: [
          Positioned(
            bottom: 150.r,
            left: 30.r,
            child: CustomPaint(
              foregroundPainter: CircleBlurPainter(
                  circleWidth: 150.r,
                  blurSigma: 100.r,
                  circleColor: ColorsBase.accent.withOpacity(0.3),
              ),
            ),
          ),
          Positioned(
            top: 150.r,
            right: 30.r,
            child: CustomPaint(
              foregroundPainter: CircleBlurPainter(
                circleWidth: 150.r,
                blurSigma: 100.r,
                circleColor: ColorsBase.primary.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
