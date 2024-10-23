import 'package:music_player/audio_helpers/service_locator.dart';
import 'package:music_player/src/my_app.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}
