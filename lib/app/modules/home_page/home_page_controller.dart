import 'package:simple_music_player/app/index_app.dart';

class HomePageController extends GetxController
    with StateMixin<List<MusicItemModel>> {
  final MusicProvider musicProvider;

  HomePageController({required this.musicProvider});

  @override
  void onInit() {
    fetchAllMusics();
    super.onInit();
  }

  void fetchAllMusics() {
    musicProvider.getMusics().then((result) {
      List<MusicItemModel>? data = result;
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }
}
