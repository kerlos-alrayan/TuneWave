import 'package:flutter/material.dart';
import 'package:music_app/view/music/test.dart';

class TracksScreen extends StatefulWidget {
  String text1;
  String text2;
  TracksScreen({Key? key, required this.text1, required this.text2}) : super(key: key);

  @override
  State<TracksScreen> createState() => _TracksScreenState();
}

class _TracksScreenState extends State<TracksScreen> {
  final List<Map> listOfSound = <Map>[
    {
      'id': 1,
      'image': 'assets/images/sounds_images/wallpaperflare.com_wallpaper.jpg',
      'title': 'Habiby',
      'sound': 'Habiby.mp3',
    },
    {
      'id': 2,
      'image':
      'assets/images/sounds_images/wallpaperflare.com_wallpaper (1).jpg',
      'title': 'Little Do You',
      'sound': 'little.mp3',
    },
    {
      'id': 3,
      'image':
      'assets/images/sounds_images/wallpaperflare.com_wallpaper (2).jpg',
      'title': 'Memories',
      'sound': 'Memories.mp3',
    },
    {
      'id': 4,
      'image': 'assets/images/sounds_images/7f47f9144194941 1.png',
      'title': 'Taki Taki',
      'sound': 'Taki.mp3',
    },
    {
      'id': 5,
      'image':
      'assets/images/sounds_images/252a6624a42c117099537c7a1320256d 1.png',
      'title': 'OneKees',
      'sound': 'oneKees.mp3',
    },
    // {
    //   'id' : 6,
    //   'image' : '',
    //   'title' : '',
    //   'sound'  : '',
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Column(
              children: [
                Text(
                  widget.text1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.text2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor:  Color(0xff7A51E2),
        leading: BackButton(
          color: Colors.white,
        ),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff7A51E2),
              Color(0xff714BCF),
              Color(0xff6645B9),
              // Color(0xff5A3EA1),
              // Color(0xff4F388B),
              // Color(0xff453276),
              Color(0xff3D2D66),
              Color(0xff332751),
              Color(0xff29223D),
              Color(0xff211C2C),
              Color(0xff161616),
            ],
          ),
        ),
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            itemCount: listOfSound.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Test(
                  id: listOfSound[index]['id'],
                  image: listOfSound[index]['image'],
                  title: listOfSound[index]['title'],
                  sound: listOfSound[index]['sound'],
                )));
              },
              child:Container(
                margin: EdgeInsets.only(top: 16, left: 12, right: 12),
                height: MediaQuery.of(context).size.width * 0.18,
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(color: Colors.transparent),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(listOfSound[index]['image']),
                      ),
                      SizedBox(width: 11,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${listOfSound[index]['title']}',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: MediaQuery.of(context).size.width *0.044,
                              fontFamily: 'Poppins',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.play_arrow, size: 30, color: Colors.white,),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
