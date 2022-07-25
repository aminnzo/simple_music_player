import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_music_player/app/app.dart';

import 'app/player/getx_audio_handler.dart';
import 'app/player/getx_player_controller.dart';
import 'app/player/getx_playlist_repository.dart';

void main() async {
  await Get.putAsync(() => GetXAudioHandler().init());
  await Get.putAsync(() => GetXDemoPlaylist().init());
  await Get.putAsync(() => GetXPlayerController().init());
  runApp(const App());
}
