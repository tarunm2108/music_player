import 'package:get/get.dart';
import 'package:music_player/src/ui/music_player/music_player_logic.dart';

class MusicPlayerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MusicPlayerLogic());
  }
}
