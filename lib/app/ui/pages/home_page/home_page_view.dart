import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:simple_music_player/app/player/getx_player_controller.dart';
import 'package:simple_music_player/app/routes/app_pages.dart';
import 'package:simple_music_player/app/ui/pages/home_page/widgets/music_list_item.dart';
import 'package:simple_music_player/app/widgets/background/custom_background.dart';
import 'package:simple_music_player/app/widgets/text_base.dart';
import 'package:simple_music_player/app/widgets/vector_asset.dart';

import 'widgets/home_appbar.dart';

class HomePage extends GetView<GetXPlayerController> {
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
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    const SliverToBoxAdapter(child: HomeAppbar()),
                    SliverToBoxAdapter(child: shuffleButton(() {})),
                  ];
                },
                body: Obx(
                  () => ListView.builder(
                    padding: EdgeInsets.only(bottom: 60.r),
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.playlistNotifier.value.length,
                    itemBuilder: (context, index) => MusicListItem(
                      image: controller.playlistNotifier.value[index].artUri.toString(),
                      musicName: controller.playlistNotifier.value[index].title,
                      artistName: 'artist name',
                      onTap: () => Get.toNamed(AppRoutes.player),
                      onTapPause: () {},
                      isCurrent: false,
                      isPlaying: false,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget shuffleButton(VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.fromLTRB(26.r, 24.r, 26.r, 40.r),
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

class Playlist extends GetView<GetXPlayerController> {
  const Playlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView.builder(
          itemCount: controller.playlistNotifier.value.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.playlistNotifier.value[index].title),
            );
          },
        ),
      ),
    );
  }
}
