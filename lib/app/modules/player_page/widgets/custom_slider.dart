import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

class CustomSlider extends GetWidget<PlayerPageController> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return SizedBox(
          height: 24.r,
          child: SliderTheme(
            data: SliderThemeData(
              trackShape: CustomTrackShape(),
              trackHeight: 2,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
              overlayColor: Colors.white24,
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
            ),
            child: Obx(() => Slider(
              min: 0,
              max: controller.musicDuration.value.inSeconds.toDouble(),
              value: controller.currentDuration.value.inSeconds.toDouble(),
              activeColor: Colors.white,
              inactiveColor: Colors.white38,
              thumbColor: Colors.white,
              onChanged: (value) {
                controller.currentDuration.value = Duration(seconds: value.toInt());
              },
              onChangeStart: (_) {
                controller.pauseMusic();
              },
              onChangeEnd: (value) {
                controller.currentDuration.value = Duration(seconds: value.toInt());
                controller.seekDuration(value.toInt());
              },
            )),
          ),
        );
      }
    );
  }
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 1;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}