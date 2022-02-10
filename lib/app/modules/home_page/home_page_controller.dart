import 'package:just_audio/just_audio.dart';
import 'package:simple_music_player/app/index_app.dart';

class HomePageController extends GetxController
    with StateMixin<List<MusicItemModel>> {
  final MusicProvider musicProvider;

  HomePageController({required this.musicProvider});

  final player = AudioPlayer();
  Rx<MusicItemModel> currentPlayingMusic = MusicItemModel().obs;
  List<MusicItemModel> musics = [];

  @override
  void onInit() {
    fetchAllMusics();
    super.onInit();
  }

  void fetchAllMusics() {
    musicProvider.getMusics().then((result) {
      musics = result;
      change(musics, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });
  }

  void handlePlayMusic(MusicItemModel model) async {
    if(currentPlayingMusic.value.id != model.id) {
      var _duration = await player.setAsset('assets/musics/${model.mp3}');
      model.duration = _duration!.inSeconds;
      currentPlayingMusic.value = model;
    }
    Get.toNamed(
      AppRoutes.player,
      arguments: Map.from({
        'model': model,
        'player': player,
      }),
    );
  }

  @override
  void onClose() async {
    await player.dispose();
  }
}
