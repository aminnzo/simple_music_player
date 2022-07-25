import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_music_player/app/player/getx_player_controller.dart';
import 'package:simple_music_player/app/ui/pages/player_page/widgets/player_appbar.dart';
import 'package:simple_music_player/app/ui/theme/index.dart';
import 'package:simple_music_player/app/widgets/background/custom_background.dart';
import 'package:simple_music_player/app/widgets/text_base.dart';
import 'package:simple_music_player/app/widgets/vector_asset.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: CustomBackground()),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const PlayerAppbar(),
                  // SizedBox(height: 20.h),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 68.w),
                  //   child: AspectRatio(
                  //     aspectRatio: 1 / 1.2,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(20.r),
                  //       child: Obx(
                  //         () => ImageAsset(
                  //           image: controller.model.value.image,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 34.h),
                  const ArtistAndSongName(),
                  // const Spacer(flex: 2),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 68.w),
                  //   child: Column(
                  //     children: [
                  //       const CustomSlider(),
                  //       Obx(
                  //         () => Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             TextBase(
                  //               timerText(controller.currentDuration.value),
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 13.sp,
                  //               color: Colors.white38,
                  //             ),
                  //             TextBase(
                  //               timerText(controller.musicDuration.value),
                  //               fontWeight: FontWeight.w500,
                  //               fontSize: 13.sp,
                  //               color: Colors.white38,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const Spacer(flex: 1),
                  // player controller buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const RepeatButton(),
                      SizedBox(width: 10.r),
                      const PreviousSongButton(),
                      SizedBox(width: 10.r),
                      const PlayButton(),
                      SizedBox(width: 10.r),
                      const NextSongButton(),
                      SizedBox(width: 10.r),
                      const ShuffleButton(),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String timerText(Duration duration) {
    final leftMin = duration.inMinutes;
    final leftSecs = duration.inSeconds % 60;
    return '${leftMin <= 10 ? '0' '$leftMin' : '$leftMin'}'
        ':'
        '${leftSecs >= 10 ? '$leftSecs' : '0' '$leftSecs'}';
  }
}

class ArtistAndSongName extends GetView<GetXPlayerController> {
  const ArtistAndSongName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextBase(
            controller.currentSongTitleNotifier.value,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 3.r),
          TextBase(
            "artist name",
            fontWeight: FontWeight.w500,
            fontSize: 13.sp,
            color: Colors.white54,
          ),
        ],
      ),
    );
  }
}

class RepeatButton extends GetView<GetXPlayerController> {
  const RepeatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Icon icon;
      switch (controller.repeatButtonNotifier.value) {
        case RepeatState.off:
          icon = const Icon(Icons.repeat, color: Colors.grey);
          break;
        case RepeatState.repeatSong:
          icon = const Icon(Icons.repeat_one);
          break;
        case RepeatState.repeatPlaylist:
          icon = const Icon(Icons.repeat);
          break;
      }
      return IconButton(
        icon: icon,
        onPressed: controller.repeat,
      );
    });
  }
}

class PreviousSongButton extends GetView<GetXPlayerController> {
  const PreviousSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap:
            (controller.isFirstSongNotifier.value) ? null : controller.previous,
        child: VectorAsset(
          icon: 'ic_backward',
          size: 32.r,
        ),
      ),
    );
  }
}

class PlayButton extends GetView<GetXPlayerController> {
  const PlayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.playButtonNotifier.value) {
        case ButtonState.loading:
          return Container(
            width: 78.r,
            height: 78.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsBase.gray,
            ),
            child: const Center(child: CircularProgressIndicator()),
          );
        case ButtonState.paused:
          return Container(
            width: 78.r,
            height: 78.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsBase.gray,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.play_arrow),
                iconSize: 32.0,
                onPressed: controller.play,
              ),
            ),
          );
        case ButtonState.playing:
          return Container(
            width: 78.r,
            height: 78.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ColorsBase.gray,
            ),
            child: Center(
              child: IconButton(
                icon: const Icon(Icons.pause),
                iconSize: 32.0,
                onPressed: controller.pause,
              ),
            ),
          );
      }
    });
  }
}

class NextSongButton extends GetView<GetXPlayerController> {
  const NextSongButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: (controller.isLastSongNotifier.value) ? null : controller.next,
        child: VectorAsset(
          icon: 'ic_forward',
          size: 32.r,
        ),
      ),
    );
  }
}

class ShuffleButton extends GetView<GetXPlayerController> {
  const ShuffleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IconButton(
        icon: (controller.isShuffleModeEnabledNotifier.value)
            ? const Icon(Icons.shuffle)
            : const Icon(Icons.shuffle, color: Colors.grey),
        onPressed: controller.shuffle,
      ),
    );
  }
}
