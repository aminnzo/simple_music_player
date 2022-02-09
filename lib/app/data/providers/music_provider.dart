import 'package:simple_music_player/app/index_app.dart';

class MusicProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'fake.url.com';
    super.onInit();
  }

  static List<MusicItemModel> _fakeData() {
    return [
      MusicItemModel(
        musicName: 'Miss You',
        artistName: 'W.A.S.P.',
        image: 'image1.png',
        mp3: 'music1.mp3',
      ),
      MusicItemModel(
        musicName: 'Day N night',
        artistName: 'Kid Cudi',
        image: 'image2.png',
        mp3: 'music2.mp3',
      ),
      MusicItemModel(
        musicName: 'Remember Me',
        artistName: 'Fjaak',
        image: 'image3.png',
        mp3: 'music3.mp3',
      ),
      MusicItemModel(
        musicName: 'Acid Rain',
        artistName: 'Lorn',
        image: 'image4.png',
        mp3: 'music4.mp3',
      ),
      MusicItemModel(
        musicName: 'Play Out',
        artistName: 'Zola Blood',
        image: 'image5.png',
        mp3: 'music5.mp3',
      ),
      MusicItemModel(
        musicName: 'I Found You',
        artistName: 'Kyle',
        image: 'image6.png',
        mp3: 'music6.mp3',
      ),
      MusicItemModel(
        musicName: 'Crystal Castles, Health',
        artistName: 'Crimewave',
        image: 'image7.png',
        mp3: 'music7.mp3',
      ),
      MusicItemModel(
        musicName: 'No Tellin',
        artistName: 'Drake',
        image: 'image8.png',
        mp3: 'music8.mp3',
      ),
      MusicItemModel(
        musicName: 'Baptized In Fire',
        artistName: 'Kid Cudi(feat. Travis Scott)',
        image: 'image9.png',
        mp3: 'music9.mp3',
      ),
      MusicItemModel(
        musicName: 'King Lil G',
        artistName: 'Ignorance',
        image: 'image10.png',
        mp3: 'music10.mp3',
      ),
    ];
  }

  Future<List<MusicItemModel>> getMusics() {
    return Future.delayed(const Duration(milliseconds: 1500), _fakeData);
  }
}