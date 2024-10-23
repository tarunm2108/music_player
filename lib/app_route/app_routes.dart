import 'package:music_player/src/ui/landing/landing_binding.dart';
import 'package:music_player/src/ui/landing/landing_view.dart';
import 'package:get/get.dart';
import 'package:music_player/src/ui/music_player/music_player_binding.dart';
import 'package:music_player/src/ui/music_player/music_player_view.dart';
import 'package:music_player/src/ui/splash/splash_binding.dart';
import 'package:music_player/src/ui/splash/splash_view.dart';

class Routes {}

class AppRoutes {
  static const splash = '/'; //initial route
  static const landing = '/landingPage';
  static const musicPlayer = '/musicPlayer';

  static final routes = [
    GetPage(
      name: splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: landing,
      page: () => const LandingPage(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: musicPlayer,
      page: () => const MusicPlayerPage(),
      binding: MusicPlayerBinding(),
    ),
  ];
}
