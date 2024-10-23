import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/src/widgets/app_button_widget.dart';
import 'package:music_player/src/widgets/app_scaffold.dart';

import 'landing_logic.dart';

class LandingPage extends GetView<LandingLogic> {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Center(
        child: AppButtonWidget(
          title: 'Music player',
          onPressed: () => controller.openPlayer(),
        ),
      ),
    );
  }
}
