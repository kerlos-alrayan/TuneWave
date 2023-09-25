import 'package:flutter/material.dart';
import 'package:music_app/view/music/test.dart';

// ignore: must_be_immutable
class ListViewBuilder2 extends StatelessWidget {
  ListViewBuilder2({Key? key}) : super(key: key);
  List<Map> listOfItems = <Map>[
    {
      'image1': 'assets/images/listview2/image 1.png',
      'image2': 'assets/images/listview2/Rectangle 1.png',
      'text1': 'believer',
    },
    {
      'image1': 'assets/images/listview2/image 1.png',
      'image2': 'assets/images/listview2/Rectangle 2.png',
      'text1': 'believer',
    },
    {
      'image1': 'assets/images/listview2/image 1.png',
      'image2': 'assets/images/listview2/Rectangle 3.png',
      'text1': 'believer',
    },
    {
      'image1': 'assets/images/listview2/image 1.png',
      'image2': 'assets/images/listview2/Rectangle 2.png',
      'text1': 'believer',
    },
    {
      'image1': 'assets/images/listview2/image 1.png',
      'image2': 'assets/images/listview2/Rectangle 3.png',
      'text1': 'believer',
    },
    {
      'image1': 'assets/images/listview2/image 1.png',
      'image2': 'assets/images/listview2/Rectangle 3.png',
      'text1': 'believer',
    }
  ];
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
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
            child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    height: 100,
                    width: 80,
                    child: Stack(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image:
                                      AssetImage(listOfSound[index]['image']),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            listOfSound[index]['title'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                              fontFamily: 'Inter',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          )),
    );
  }
}
