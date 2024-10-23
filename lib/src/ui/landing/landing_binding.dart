import 'package:get/get.dart';
import 'package:music_player/src/ui/landing/landing_logic.dart';


class LandingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingLogic());
  }
}
