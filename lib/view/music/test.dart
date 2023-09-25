// ignore_for_file: must_be_immutable

import 'package:audioplayers/audioplayers.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  int id;
  String image;
  String title;
  String sound;
  Test(
      {Key? key,
      required this.id,
      required this.image,
      required this.title,
      required this.sound})
      : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  AudioPlayer player = AudioPlayer();
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

  //
  // int index = 0;
  // List<String> allAudio = [
  //   'oneKees.mp3',
  //   'little.mp3',
  //   'Taki.mp3',
  //   'Memories.mp3',
  //   'Habiby.mp3',
  // ];
  bool isFavorite = false;
  bool isRepeat = false;
  Image image1 = Image.asset(
    'assets/images/home_screen/sound_options/second_row/repeat.png',
    color: Colors.white,
    width: 24,
    height: 24,
  );
  Image image2 = Image.asset(
    'assets/images/home_screen/sound_options/second_row/repeat.png',
    color: Color(0xff7A51E2),
    width: 24,
    height: 24,
  );
  // List<Map> allAudio = <Map>[
  //   {'sound': 'oneKees.mp3'},
  //   {'sound': 'little.mp3'},
  //   {'sound': 'Taki.mp3'},
  //   {'sound': 'Memories.mp3'},
  //   {'sound': 'Habiby.mp3'},
  // ];

  @override
  void initState() {
    super.initState();
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Now playing',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        color: Colors.white),
                  ),
                  Text(
                    'Playlist "Playlist of the day"',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        color: Colors.white),
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {
                    if (isFavorite) {
                      setState(() {
                        isFavorite = false;
                      });
                    } else {
                      setState(() {
                        isFavorite = true;
                      });
                    }
                  },
                  icon: isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: Color(0xffFF001E),
                        )
                      : Icon(Icons.favorite_border_outlined)),
              Image.asset(
                'assets/images/home_screen/sound_options/menu.png',
                width: 30,
                height: 30,
              )
            ],
          ),
        ),
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff7A51E2),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff7A51E2),
              Color(0xff714BCF),
              Color(0xff6645B9),
              Color(0xff5A3EA1),
              // Color(0xff4F388B),
              // Color(0xff453276),
              // Color(0xff3D2D66),
              Color(0xff332751),
              Color(0xff29223D),
              Color(0xff211C2C),
              Color(0xff161616),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.085),
            // Carousel Slider
            CarouselSlider.builder(
              itemCount: 1,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Padding(
                padding: const EdgeInsets.only(left: 12, right: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Container(
              //   margin: EdgeInsets.only(left: 16, right: 16),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: AssetImage('assets/images/home_screen/listview/Rectangle 15.png'),
              //     )
              //   ),
              // ),
              options: CarouselOptions(
                height: 268,
                scrollPhysics: ScrollPhysics(),
                autoPlay: false,
                autoPlayInterval: Duration(seconds: 5),
                enableInfiniteScroll: true,
              ),
            ),
            SizedBox(
              height: 60,
            ),
            // Text
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                widget.title,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            // Text
            Padding(
              padding: const EdgeInsets.only(left: 22),
              child: Text(
                'Lyrics Sound',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white30,
                ),
              ),
            ),
            // Slider
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await player.seek(position);
                await player.resume();
              },
              activeColor: Color(0xff7A51E2),
              inactiveColor: Colors.white30,
            ),
            // Time
            Padding(
              padding: const EdgeInsets.only(left: 32, right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    formatTime(position),
                    style: TextStyle(
                      color: Colors.white30,
                    ),
                  ),
                  Text(
                    formatTime(duration - position),
                    style: TextStyle(
                      color: Colors.white30,
                    ),
                  ),
                ],
              ),
            ),
            // First Row
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/home_screen/sound_options/first_row/skip-forward.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                  // Playing Button
                  Container(
                    alignment: Alignment.topLeft,
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color(0xff7A51E2)),
                    child: IconButton(
                      onPressed: () {
                        if (isPlaying) {
                          setState(() {
                            isPlaying = false;
                            stopMusic();
                          });
                        } else {
                          setState(() {
                            isPlaying = true;
                            playMusic();
                          });
                        }
                      },
                      icon: isPlaying
                          ? Icon(
                              Icons.pause,
                              color: Color(0xff383344),
                              size: 60,
                            )
                          : Icon(
                              Icons.play_arrow,
                              color: Color(0xff383344),
                              size: 60,
                            ),
                      iconSize: 35,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      'assets/images/home_screen/sound_options/first_row/skip-forward2.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Music Options
            Padding(
              padding: const EdgeInsets.only(
                  top: 32, left: 18, right: 18, bottom: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: isRepeat ? image2 : image1,
                    onTap: () {
                      if (isRepeat) {
                        setState(() {
                          isRepeat = false;
                          player.setReleaseMode(ReleaseMode.stop);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 6.0,
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Loop Off",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        });
                      } else {
                        setState(() {
                          isRepeat = true;
                          player.setReleaseMode(ReleaseMode.loop);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 6.0,
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Loop On",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        });
                      }
                    },
                  ),
                  Image.asset(
                    'assets/images/home_screen/sound_options/second_row/settings.png',
                    width: 24,
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/home_screen/sound_options/second_row/icon-park-outline_text-style-one.png',
                    width: 24,
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/home_screen/sound_options/second_row/Icon Basket.png',
                    width: 24,
                    height: 24,
                  ),
                  Image.asset(
                    'assets/images/home_screen/sound_options/second_row/Icon Profile.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  playMusic() {
    player.play(AssetSource(widget.sound));
  }

  stopMusic() {
    player.pause();
  }
}
