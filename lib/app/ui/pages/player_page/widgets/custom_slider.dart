import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_music_player/app/widgets/audio_video_progress_bar.dart';
import 'package:simple_music_player/app/player/getx_player_controller.dart';

class CustomSlider extends GetView<GetXPlayerController> {
  const CustomSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressBar(
        progress: controller.progressNotifier.value.current,
        buffered: controller.progressNotifier.value.buffered,
        total: controller.progressNotifier.value.total,
        onSeek: controller.seek,
        barHeight: 4,
        barCapShape: BarCapShape.round,
        baseBarColor: Colors.white38,
        bufferedBarColor: Colors.white12,
        progressBarColor: Colors.white,
        thumbColor: Colors.white,
        timeLabelTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13.sp,
          color: Colors.white38,
        ),
        timeLabelPadding: 10.0,
        thumbRadius: 8,
        thumbGlowRadius: 16,
      ),
    );
  }
}
