part of 'app_pages.dart';

abstract class AppRoutes {
  AppRoutes._();
  static const home = _Paths.homePage;
  static const player = _Paths.playerPage;
}

abstract class _Paths {
  _Paths._();
  static const homePage = '/homePage';
  static const playerPage = '/playerPage';
}
