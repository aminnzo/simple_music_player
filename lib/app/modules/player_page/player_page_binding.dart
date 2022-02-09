import 'package:simple_music_player/app/index_app.dart';

class PlayerPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayerPageController>(
          () => PlayerPageController(),
    );
  }
}
