import 'package:flutter/services.dart';
import 'package:music_player/audio_helpers/service_locator.dart';
import 'package:music_player/src/my_app.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await setupServiceLocator();
  runApp(const MyApp());
}
