import 'package:flutter/material.dart';

class PlayerTimeWidget extends StatelessWidget {
  final Duration duration;
  final Color? textColor;

  const PlayerTimeWidget({required this.duration, this.textColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          duration.inMinutes.remainder(60).toString().padLeft(2, '0'),
          style: const TextStyle(fontSize: 12, color: Color(0xff043645)),
        ),
        const Text(
          ' : ',
          style: TextStyle(fontSize: 12, color: Color(0xff043645)),
        ),
        Text(
          duration.inSeconds.remainder(60).toString().padLeft(2, '0'),
          style: const TextStyle(fontSize: 12, color: Color(0xff043645)),
        ),
      ],
    );
  }
}
