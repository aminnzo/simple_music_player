import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

class MusicListItem extends StatelessWidget {
  const MusicListItem({Key? key}) : super(key: key);

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
                  image: 'image1.png',
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
