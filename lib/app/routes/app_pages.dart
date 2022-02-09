import 'package:simple_music_player/app/index_app.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.home;

  static final routes = [
    GetPage(
      name: _Paths.homePage,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: _Paths.playerPage,
      page: () => const PlayerPage(),
      binding: PlayerPageBinding(),
    ),
  ];
}
