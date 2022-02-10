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
              child: NestedScrollView(
                headerSliverBuilder: (context, value) {
                  return [
                    const SliverToBoxAdapter(child: HomeAppbar()),
                    SliverToBoxAdapter(child: shuffleButton(() {})),
                  ];
                },
                body: controller.obx(
                  (data) => ListView.builder(
                    padding: EdgeInsets.only(bottom: 60.r),
                    physics: const BouncingScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (context, index) => MusicListItem(
                      item: data[index],
                      onTap: () => controller.musicItemOnTap(data[index]),
                      onTapPause: () {
                        controller.changePlayerState(data[index]);
                        controller.update();
                      },
                      isCurrent: controller.currentPlayingMusic.value.id == data[index].id,
                      isPlaying: controller.isPlaying.value,
                    ),
                  ),
                  onLoading: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: 64,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.r,
                        ),
                      ),
                    ],
                  ),
                  onError: (error) => Center(child: TextBase(error.toString())),
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
