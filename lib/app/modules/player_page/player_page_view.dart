import 'package:flutter/material.dart';
import 'package:simple_music_player/app/index_app.dart';

class PlayerPage extends GetView<PlayerPageController> {
  const PlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Positioned.fill(child: CustomBackground()),

        ],
      ),
    );
  }
}

