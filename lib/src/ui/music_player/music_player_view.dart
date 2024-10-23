import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/audio_helpers/page_manager.dart';
import 'package:music_player/src/extensions/color_extension.dart';
import 'package:music_player/src/extensions/space_extension.dart';
import 'package:music_player/src/ui/music_player/common_slider.dart';
import 'package:music_player/src/widgets/app_scaffold.dart';

import 'music_player_logic.dart';

class MusicPlayerPage extends GetView<MusicPlayerLogic> {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key("playScreen"),
      direction: DismissDirection.down,
      background: const ColoredBox(color: Colors.transparent),
      onDismissed: (direction) {
        Get.back();
      },
      child: AppScaffold(
        appBar: AppBar(
          backgroundColor: TColor.bg,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            ),
          ),
          title: Text(
            "Now Playing",
            style: TextStyle(
                color: TColor.primaryText80,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: ValueListenableBuilder<MediaItem?>(
          valueListenable: controller.pageManager.currentSongNotifier,
          builder: (context, mediaItem, child) {
            if (mediaItem == null) return const SizedBox();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(child: SizedBox.shrink()),
                  Text(
                    mediaItem.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: TColor.primaryText.withOpacity(0.9),
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  10.toSpace,
                  Text(
                    "${mediaItem.artist} • Album - ${mediaItem.album}",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(color: TColor.secondaryText, fontSize: 12),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(
                      color: Colors.black12,
                      height: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ValueListenableBuilder<bool>(
                        valueListenable:
                            controller.pageManager.isFirstSongNotifier,
                        builder: (context, isFirst, child) {
                          return IconButton(
                            onPressed: (isFirst)
                                ? null
                                : controller.pageManager.previous,
                            icon: const Icon(Icons.skip_previous,size: 30,),
                          );
                        },
                      ),
                      15.toSpace,
                      ValueListenableBuilder<ButtonState>(
                        valueListenable:
                            controller.pageManager.playButtonNotifier,
                        builder: (context, value, child) {
                          return SizedBox(
                            width: 75,
                            height: 75,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                if (value == ButtonState.loading)
                                  SizedBox(
                                    width: 75,
                                    height: 75,
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation<Color>(
                                              TColor.primaryText),
                                    ),
                                  ),
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: value == ButtonState.playing
                                      ? InkWell(
                                          onTap: controller.pageManager.pause,
                                          child: const Icon(Icons.pause,size: 50,))
                                      : InkWell(
                                          onTap: controller.pageManager.play,
                                          child:
                                              const Icon(Icons.play_circle,size: 50,),
                                        ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 15),
                      ValueListenableBuilder<bool>(
                        valueListenable:
                            controller.pageManager.isLastSongNotifier,
                        builder: (context, isLast, child) {
                          return IconButton(
                            onPressed: (isLast)
                                ? null
                                : controller.pageManager.next,
                            icon: const Icon(Icons.skip_next,size: 30),
                          );
                        },
                      ),
                    ],
                  ),
                  ValueListenableBuilder(
                      valueListenable:
                          controller.pageManager.progressNotifier,
                      builder: (_, valueState, child) {

                          return SeekBar(
                            duration: valueState.total,
                            position: valueState.current,
                            bufferedPosition: valueState.buffered,
                            onChangeEnd: (value) =>
                                controller.pageManager.seek(value),
                          );
                      }),
                  30.toSpace,
                  /* Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PlayerBottomButton(
                          title: "Playlist",
                          icon: "assets/img/playlist.png",
                          onPressed: () {
                            controller.openPlayPlaylistQueue();
                          }),
                      PlayerBottomButton(
                          title: "Shuffle",
                          icon: "assets/img/shuffle.png",
                          onPressed: () {}),
                      PlayerBottomButton(
                          title: "Repeat",
                          icon: "assets/img/repeat.png",
                          onPressed: () {}),
                      PlayerBottomButton(
                          title: "EQ",
                          icon: "assets/img/eq.png",
                          onPressed: () {}),
                      PlayerBottomButton(
                          title: "Favourites",
                          icon: "assets/img/fav.png",
                          onPressed: () {}),
                    ],
                  ),*/
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
