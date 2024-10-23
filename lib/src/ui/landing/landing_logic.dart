import 'package:get/get.dart';
import 'package:music_player/app_route/app_routes.dart';
import 'package:music_player/base/app_base_controller.dart';

class LandingLogic extends AppBaseController {
  void openPlayer() {
    Get.toNamed(AppRoutes.musicPlayer);
  }
}
