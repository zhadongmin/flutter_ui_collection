import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({super.key});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  _playSound() {
    final player = AudioPlayer();
    player.play(AssetSource('assets/audio/y1009.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _createTone(order: '1', color: Colors.red),
            ),
            Expanded(
              child: _createTone(order: '2', color: Colors.red),
            ),
            Expanded(
              child: _createTone(order: '3', color: Colors.red),
            ),
            Expanded(
              child: _createTone(order: '4', color: Colors.red),
            ),
            Expanded(
              child: _createTone(order: '5', color: Colors.red),
            ),
            Expanded(
              child: _createTone(order: '6', color: Colors.red),
            ),
            Expanded(
              child: _createTone(order: '7', color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createTone({color = Colors.red, order}) {
    return GestureDetector(
      onTap: _playSound(),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Text(order),
      ),
    );
  }
}
