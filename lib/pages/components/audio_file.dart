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

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
