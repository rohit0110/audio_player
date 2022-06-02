import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);
  final AudioPlayer advancedPlayer;
  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration _duration = new Duration();
  Duration _position = new Duration();
  final String path = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  List<IconData> _icons = [Icons.play_circle_fill, Icons.pause_circle_filled];

  @override
  void initState() {
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    widget.advancedPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        _duration = event;
      });
    });
    widget.advancedPlayer.setUrl(path);
  }

  Widget btnStart() {
    return IconButton(
      onPressed: () {
        if (isPlaying) {
          widget.advancedPlayer.pause();
          setState(() {
            isPlaying = false;
            isPaused = true;
          });
        } else {
          if (isPaused && !isPlaying) {
            widget.advancedPlayer.resume();
            setState(() {
              isPaused = false;
              isPlaying = true;
            });
          } else {
            widget.advancedPlayer.play(path);
            setState(() {
              isPlaying = true;
            });
          }
        }
      },
      icon: (isPlaying)
          ? const Icon(Icons.pause_circle)
          : const Icon(Icons.play_arrow),
    );
  }

  Widget loadAsset() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          btnStart(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [],
            ),
          ),
          loadAsset(),
        ],
      ),
    );
  }
}
