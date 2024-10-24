import 'package:audio_service/audio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:music_player/audio_helpers/audio_handler.dart';
import 'package:music_player/audio_helpers/page_manager.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  MyAudioHandler myAudioHandler =  await initAudioService();
  getIt.registerSingleton<MyAudioHandler>(myAudioHandler);
  getIt.registerLazySingleton<PageManager>(() => PageManager());
}
