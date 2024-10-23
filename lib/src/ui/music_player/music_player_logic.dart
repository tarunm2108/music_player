import 'package:audio_service/audio_service.dart';
import 'package:get/get.dart';
import 'package:music_player/audio_helpers/audio_handler.dart';
import 'package:music_player/audio_helpers/page_manager.dart';
import 'package:music_player/audio_helpers/service_locator.dart';
import 'package:music_player/base/app_base_controller.dart';

class MusicPlayerLogic extends AppBaseController {
  final pageManager = getIt<PageManager>();

  @override
  void onInit() {
    pageManager.add(
        const MediaItem(id: "101", title: "Audio", extras: {
      "url": "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
    }));
    super.onInit();
  }

  void openPlayPlaylistQueue() {
    /* Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, ___, __) => const PlayPlayListView(),
      ),
    );*/
  }

  void openDriverModel() {
    /*Navigator.push(
      context,
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, ___, __) => const DriverModeView(),
      ),
    );*/
  }
}
