import 'package:simple_music_player/app/index_app.dart';
import 'package:just_audio/just_audio.dart';

class PlayerPageController extends GetxController {
  final Map _argData = Get.arguments;
  late AudioPlayer player;
  Rx<Duration> musicDuration = Rx<Duration>(const Duration(seconds: 1));
  Rx<Duration> currentDuration = Rx<Duration>(Duration.zero);
  Rx<MusicItemModel> model = MusicItemModel().obs;

  final homeController = Get.find<HomePageController>();

  @override
  void onInit() async {
    try {
      model.value = _argData['model'];
      player = _argData['player'];
      musicDuration.value = Duration(seconds: model.value.duration);
      playMusic();
    } on PlayerException catch (e) {
      Get.log(e.toString(), isError: true);
    } on PlayerInterruptedException catch (e) {
      Get.log(e.toString(), isError: true);
    } catch (e) {
      Get.log(e.toString(), isError: true);
    }
    super.onInit();
  }

  @override
  void onReady() {
    _initPositionStream();
    super.onReady();
  }

  void _initPositionStream() {
    int oldState = 0;
    player.positionStream.listen((duration) {
      if (oldState != duration.inSeconds) {
        oldState = duration.inSeconds;
        currentDuration.value = duration;
      }
      if (musicDuration.value.inSeconds == duration.inSeconds) {
        seekDuration(0, shouldPlay: false);
        currentDuration.value = Duration.zero;
        oldState = 0;
      }
    }, onError: (error) {
      Get.log(error.toString(), isError: true);
    });
  }

  void playMusic() async {
    await player.play();
  }

  void pauseMusic() async {
    await player.pause();
  }

  void seekDuration(int sec, {bool shouldPlay = true}) async {
    try {
      await player.seek(Duration(seconds: sec));
      if (shouldPlay) {
        playMusic();
      } else {
        pauseMusic();
      }
    } on PlayerException catch (e) {
      Get.log(e.toString(), isError: true);
    } on PlayerInterruptedException catch (e) {
      Get.log(e.toString(), isError: true);
    } catch (e) {
      Get.log(e.toString(), isError: true);
    }
  }

  void nextMusic() async {
    try {
      if (model.value.id != homeController.musics.last.id) {
        int nextIndex = homeController.musics.indexOf(model.value) + 1;
        model.value = homeController.musics[nextIndex];
        var _duration =
            await player.setAsset('assets/musics/${model.value.mp3}');
        model.value.duration = _duration!.inSeconds;
        musicDuration.value = _duration;
        homeController.currentPlayingMusic.value = model.value;
      }
    } on PlayerException catch (e) {
      Get.log(e.toString(), isError: true);
    } on PlayerInterruptedException catch (e) {
      Get.log(e.toString(), isError: true);
    } catch (e) {
      Get.log(e.toString(), isError: true);
    }
  }

  void prevMusic() async {
    try {
      if (model.value.id != homeController.musics.first.id) {
        int prevIndex = homeController.musics.indexOf(model.value) - 1;
        model.value = homeController.musics[prevIndex];
        var _duration =
            await player.setAsset('assets/musics/${model.value.mp3}');
        model.value.duration = _duration!.inSeconds;
        musicDuration.value = _duration;
        homeController.currentPlayingMusic.value = model.value;
      }
    } on PlayerException catch (e) {
      Get.log(e.toString(), isError: true);
    } on PlayerInterruptedException catch (e) {
      Get.log(e.toString(), isError: true);
    } catch (e) {
      Get.log(e.toString(), isError: true);
    }
  }
}
