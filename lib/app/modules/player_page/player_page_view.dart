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
                      aspectRatio: 1/1.2,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: const ImageAsset(
                          image: 'image1.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 34.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextBase(
                        'peaceful piano music',
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 3.r),
                      TextBase(
                        'relaxing piano music',
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp,
                        color: Colors.white54,
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 68.w),
                    child: Column(
                      children: [
                        const CustomSlider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBase(
                              '01:06',
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: Colors.white38,
                            ),
                            TextBase(
                              '03:16',
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp,
                              color: Colors.white38,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      VectorAsset(
                        icon: 'ic_backward',
                        size: 32.r,
                      ),
                      SizedBox(width: 10.r),
                      Container(
                        width: 78.r,
                        height: 78.r,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorsBase.gray,
                        ),
                        child: Center(
                          child: VectorAsset(
                            icon: 'ic_play',
                            size: 32.r,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.r),
                      VectorAsset(
                        icon: 'ic_forward',
                        size: 32.r,
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
}
