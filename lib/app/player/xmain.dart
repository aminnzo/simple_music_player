import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'audio_video_progress_bar.dart';
import 'getx_audio_handler.dart';
import 'getx_player_controller.dart';
import 'getx_playlist_repository.dart';

void main() async {
  await Get.putAsync(() => GetXAudioHandler().init());
  await Get.putAsync(() => GetXDemoPlaylist().init());
  await Get.putAsync(() => GetXPlayerController().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [
              CurrentSongTitle(),
              Playlist(),
              AddRemoveSongButtons(),
              AudioProgressBar(),
              AudioControlButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentSongTitle extends GetView<GetXPlayerController> {
  const CurrentSongTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(controller.currentSongTitleNotifier.value,
            style: const TextStyle(fontSize: 40)),
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
              title: Text(controller.playlistNotifier.value[index]),
            );
          },
        ),
      ),
    );
  }
}

class AddRemoveSongButtons extends GetView<GetXPlayerController> {
  const AddRemoveSongButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: controller.add,
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller.remove,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class AudioProgressBar extends GetView<GetXPlayerController> {
  const AudioProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ProgressBar(
        progress: controller.progressNotifier.value.current,
        buffered: controller.progressNotifier.value.buffered,
        total: controller.progressNotifier.value.total,
        onSeek: controller.seek,
      ),
    );
  }
}

class AudioControlButtons extends GetView<GetXPlayerController> {
  const AudioControlButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          RepeatButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
          ShuffleButton(),
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
      () => IconButton(
        icon: const Icon(Icons.skip_previous),
        onPressed:
            (controller.isFirstSongNotifier.value) ? null : controller.previous,
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
            margin: const EdgeInsets.all(8.0),
            width: 32.0,
            height: 32.0,
            child: const CircularProgressIndicator(),
          );
        case ButtonState.paused:
          return IconButton(
            icon: const Icon(Icons.play_arrow),
            iconSize: 32.0,
            onPressed: controller.play,
          );
        case ButtonState.playing:
          return IconButton(
            icon: const Icon(Icons.pause),
            iconSize: 32.0,
            onPressed: controller.pause,
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
      () => IconButton(
        icon: const Icon(Icons.skip_next),
        onPressed:
            (controller.isLastSongNotifier.value) ? null : controller.next,
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
