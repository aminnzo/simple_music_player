import 'package:simple_music_player/app/index_app.dart';

class MusicProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'fake.url.com';
    super.onInit();
  }

  Future<List<MusicItemModel>> getMusics() {
    return Future.delayed(const Duration(milliseconds: 1500), _generateFakeData);
  }

  static List<MusicItemModel> _generateFakeData() => List.generate(
      10,
      (index) => MusicItemModel(
            id: 1,
            musicName: 'Music ${index + 1}',
            artistName: 'Artist ${index + 1}',
            image: 'image${index + 1}.png',
            mp3: 'music1.mp3',
          ));
}
