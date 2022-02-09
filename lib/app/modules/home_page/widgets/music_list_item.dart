import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

class MusicListItem extends StatelessWidget {
  final String musicName;
  final String artistName;
  final String image;

  const MusicListItem({
    Key? key,
    required this.musicName,
    required this.artistName,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => Get.toNamed(AppRoutes.player),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 9.r),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 64.r,
              height: 64.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: ImageAsset(
                  image: image,
                  width: 64.r,
                  height: 64.r,
                ),
              ),
            ),
            SizedBox(width: 23.r),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBase(
                  musicName,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 3.r),
                TextBase(
                  artistName,
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: Colors.white54,
                ),
              ],
            ),
            const Spacer(flex: 1),
            VectorAsset(
              icon: 'ic_more',
              size: 8.r,
              color: Colors.white54,
            ),
          ],
        ),
      ),
    );
  }
}
