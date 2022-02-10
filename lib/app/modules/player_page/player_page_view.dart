import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

class PlayerPage extends GetView<PlayerPageController> {
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
                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 68.w),
                    child: AspectRatio(
                      aspectRatio: 1 / 1.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Obx(() => ImageAsset(
                            image: controller.model.value.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34.h),
                  Obx(() => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextBase(
                          controller.model.value.musicName,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(height: 3.r),
                        TextBase(
                          controller.model.value.artistName,
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: Colors.white54,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 68.w),
                    child: Column(
                      children: [
                        const CustomSlider(),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBase(
                                timerText(controller.currentDuration.value),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                color: Colors.white38,
                              ),
                              TextBase(
                                timerText(controller.musicDuration.value),
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                color: Colors.white38,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => controller.prevMusic(),
                        child: VectorAsset(
                          icon: 'ic_backward',
                          size: 32.r,
                        ),
                      ),
                      SizedBox(width: 10.r),
                      GestureDetector(
                        onTap: () => controller.homeController.isPlaying.value
                            ? controller.pauseMusic()
                            : controller.playMusic(),
                        child: Container(
                          width: 78.r,
                          height: 78.r,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsBase.gray,
                          ),
                          child: Center(
                            child: Obx(
                              () => VectorAsset(
                                icon: controller.homeController.isPlaying.value
                                    ? 'ic_pause'
                                    : 'ic_play',
                                size: 32.r,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.r),
                      GestureDetector(
                        onTap: () => controller.nextMusic(),
                        child: VectorAsset(
                          icon: 'ic_forward',
                          size: 32.r,
                        ),
                      ),
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
