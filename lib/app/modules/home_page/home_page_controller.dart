import 'package:just_audio/just_audio.dart';
import 'package:simple_music_player/app/index_app.dart';

class HomePageController extends GetxController
    with StateMixin<List<MusicItemModel>> {
  final MusicProvider musicProvider;

  HomePageController({required this.musicProvider});

  final player = AudioPlayer();
  Rx<MusicItemModel> currentPlayingMusic = MusicItemModel().obs;
  List<MusicItemModel> musics = [];
  RxBool isPlaying = RxBool(true);

  @override
  void onInit() {
    fetchAllMusics();
    _initPlayerStateStream();
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

  void musicItemOnTap(MusicItemModel model) async {
    if(currentPlayingMusic.value.id != model.id) {
      try {
        var _duration = await player.setAsset('assets/musics/${model.mp3}');
        model.duration = _duration!.inSeconds;
        currentPlayingMusic.value = model;
      } on PlayerException catch (e) {
        Get.log(e.toString(), isError: true);
      } on PlayerInterruptedException catch (e) {
        Get.log(e.toString(), isError: true);
      } catch (e) {
        Get.log(e.toString(), isError: true);
      }
    }
    Get.toNamed(
      AppRoutes.player,
      arguments: Map.from({
        'model': model,
        'player': player,
      }),
    );
  }

  void _initPlayerStateStream() {
    player.playerStateStream.listen((event) {
      isPlaying.value = event.playing;
      update();
    });
  }

  void changePlayerState(MusicItemModel model) async {
    if(player.playing) {
      await player.pause();
    } else {
      await player.play();
    }
  }

  @override
  void onClose() async {
    await player.dispose();
  }
}

