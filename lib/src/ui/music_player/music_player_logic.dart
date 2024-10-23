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
    pageManager.init();
    final _item = MediaItem(
      id: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
      album: "Science Friday",
      title: "A Salute To Head-Scratching Science",
      artist: "Science Friday and WNYC Studios",
      duration: const Duration(milliseconds: 5739820),
      extras: {"url":"https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"},
      artUri: Uri.parse(
          'https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg'),
    );
    pageManager.add(_item);
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
