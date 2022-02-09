import 'package:simple_music_player/app/index_app.dart';

class PlayerPageController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  // @override
  // void onInit() {
  //   super.onInit();
  // }
  //
  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {}
  void increment() => count.value++;
}
