import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class FirstMusic extends StatefulWidget {
  const FirstMusic({Key? key}) : super(key: key);

  @override
  State<FirstMusic> createState() => _FirstMusicState();
}

class _FirstMusicState extends State<FirstMusic> {
  @override
  Widget build(BuildContext context) {
    final audioPlayer = AudioPlayer();
    bool isPlaying = false;
    Duration duration = Duration.zero;
    Duration position = Duration.zero;
    String formatTime(Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final hours = twoDigits(duration.inHours);
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final second = twoDigits(duration.inSeconds.remainder(60));
      return [
        if (duration.inHours > 0) hours,
        minutes,
        second,
      ].join(':');
    }

    @override
    void display() {
      audioPlayer.dispose();
    }

    @override
    void initState() {
      super.initState();
      audioPlayer.onPlayerStateChanged.listen((state) {
        setState(() {
          isPlaying = state == PlayerState.playing;
        });
      });
      audioPlayer.onDurationChanged.listen((newDuration) {
        setState(() {
          duration = newDuration;
        });
      });
      audioPlayer.onPositionChanged.listen((newPosition) {
        setState(() {
          position = newPosition;
        });
      });
    }

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);
                await audioPlayer.resume();
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)),
                  Text(formatTime(duration - position)),
                ],
              ),
            ),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(
                  isPlaying? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: () {
                  if (isPlaying) {
                   setState(() {
                     isPlaying =false;
                     audioPlayer.pause();
                     initState();
                   });
                  } else {
                     setState(() {
                       isPlaying = true;
                       audioPlayer.play(AssetSource('little.mp3'));
                     });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
