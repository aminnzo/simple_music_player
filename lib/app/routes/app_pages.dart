import 'package:get/get.dart';
import 'package:simple_music_player/app/ui/pages/home_page/home_page_view.dart';
import 'package:simple_music_player/app/ui/pages/player_page/player_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = AppRoutes.home;

  static final routes = [
    GetPage(
      name: _Paths.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: _Paths.playerPage,
      page: () => const PlayerPage(),
    ),
  ];
}
