import 'package:simple_music_player/app/index_app.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(
          () => HomePageController(),
    );
  }
}
