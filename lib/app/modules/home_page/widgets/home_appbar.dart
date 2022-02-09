import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: preferredSize.height,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'appbar_text',
                child: TextBase(
                  'Music Player',
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: 40.r,
                width: 40.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white24,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Hero(
                      tag: 'appbar_icon',
                      child: VectorAsset(
                        icon: 'ic_search',
                        size: 20.r,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80.h);
}
