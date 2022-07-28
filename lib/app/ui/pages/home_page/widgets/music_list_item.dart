import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_music_player/app/widgets/text_base.dart';
import 'package:simple_music_player/app/widgets/vector_asset.dart';

class MusicListItem extends StatelessWidget {
  final String image;
  final String musicName;
  final String artistName;
  final VoidCallback onTap;
  final VoidCallback onTapPause;
  final bool isCurrent;
  final bool isPlaying;

  const MusicListItem({
    Key? key,
    required this.image,
    required this.musicName,
    required this.artistName,
    required this.onTap,
    required this.onTapPause,
    required this.isCurrent,
    required this.isPlaying,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
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
                child: Stack(
                  children: [
                    Image.network(
                      image,
                      width: 64.r,
                      height: 64.r,
                      fit: BoxFit.cover,
                    ),
                    Visibility(
                      visible: isCurrent,
                      child: GestureDetector(
                        onTap: onTapPause,
                        child: Container(
                          color: Colors.black38,
                          child: Center(
                            child: VectorAsset(
                              icon: isPlaying ? 'ic_pause' : 'ic_play',
                              size: 26.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
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
