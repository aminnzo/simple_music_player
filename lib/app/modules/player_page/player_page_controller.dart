import 'package:simple_music_player/app/index_app.dart';
import 'package:just_audio/just_audio.dart';

class PlayerPageController extends GetxController {
  final Map _argData = Get.arguments;

  Rx<Duration> musicDuration = Rx<Duration>(Duration.zero);
  Rx<Duration> currentDuration = Rx<Duration>(Duration.zero);
  RxBool isPlaying = RxBool(true);

  late AudioPlayer player;
  Rx<MusicItemModel> model = MusicItemModel().obs;

  @override
  void onInit() async {
    model.value = _argData['model'];
    player = _argData['player'];
    musicDuration.value = Duration(seconds: model.value.duration);
    playMusic();
    super.onInit();
  }

  @override
  void onReady() {
    int oldState = 0;
    player.positionStream.listen((duration) {
      if (oldState != duration.inSeconds) {
        oldState = duration.inSeconds;
        currentDuration.value = duration;
      }
      if (musicDuration.value.inSeconds == duration.inSeconds) {
        seekDuration(0, shouldPlay: false);
        currentDuration.value = Duration.zero;
        isPlaying.value = false;
        oldState = 0;
      }
    });
    super.onReady();
  }

  void playMusic() async {
    isPlaying.value = true;
    await player.play();
  }

  void pauseMusic() async {
    isPlaying.value = false;
    await player.pause();
  }

  void seekDuration(int sec, {bool shouldPlay = true}) async {
    await player.seek(Duration(seconds: sec));
    if (shouldPlay) {
      playMusic();
    } else {
      pauseMusic();
    }
  }

  void nextMusic() async {
    final controller = Get.find<HomePageController>();
    if(model.value.id != controller.musics.last.id) {
      int nextIndex = controller.musics.indexOf(model.value) + 1;
      model.value = controller.musics[nextIndex];
      var _duration = await player.setAsset('assets/musics/${model.value.mp3}');
      model.value.duration = _duration!.inSeconds;
      musicDuration.value = _duration;
      controller.currentPlayingMusic.value = model.value;
    }
  }

  void prevMusic() async {
    final controller = Get.find<HomePageController>();
    if(model.value.id != controller.musics.first.id) {
      int prevIndex = controller.musics.indexOf(model.value) - 1;
      model.value = controller.musics[prevIndex];
      var _duration = await player.setAsset('assets/musics/${model.value.mp3}');
      model.value.duration = _duration!.inSeconds;
      musicDuration.value = _duration;
      controller.currentPlayingMusic.value = model.value;
    }
  }

  // void prevMusic() {
  //   if(currentPlayingMusic.value.id != _musics.first.id) {
  //     int nextIndex = _musics.indexOf(currentPlayingMusic.value) - 1;
  //     handlePlayMusic(_musics[nextIndex]);
  //   }
  // }
}
