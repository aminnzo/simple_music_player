import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

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
                children: [
                  const HomeAppbar(),
                  shuffleButton(() {}),
                  SizedBox(height: 16.r),
                  MusicListItem(),
                  MusicListItem(),
                  MusicListItem(),
                  MusicListItem(),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  Widget shuffleButton(VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: VectorAsset(
              icon: 'ic_shuffle',
              size: 24.r,
            ),
          ),
          SizedBox(width: 10.r),
          TextBase(
            'Shuffle',
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
          ),
        ],
      ),
    );
  }
}
