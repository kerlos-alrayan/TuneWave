import 'package:flutter/material.dart';
import 'package:music_app/view/music/test.dart';
import 'package:music_app/view/music/tracks_screen.dart';

// ignore: must_be_immutable
class ListViewBuilder extends StatelessWidget {
  ListViewBuilder({Key? key}) : super(key: key);
  List<Map> listOfItems = <Map>[
    {
      'image1': 'assets/images/home_screen/listview/Rectangle 14.png',
      'text1': 'music anu',
      'image2': 'assets/images/home_screen/listview/Component 90.png',
      'text2': '22 tracks',
    },
    {
      'image1': 'assets/images/home_screen/listview/Rectangle 15.png',
      'text1': 'music lata',
      'image2': 'assets/images/home_screen/listview/Component 90.png',
      'text2': '25 tracks',
    },
    {
      'image1': 'assets/images/home_screen/listview/Rectangle 16.png',
      'text1': 'music king',
      'image2': 'assets/images/home_screen/listview/Component 90.png',
      'text2': '20 tracks',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: ScrollPhysics(),
          itemCount: listOfItems.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TracksScreen(
                            text1: listOfItems[index]['text1'],
                            text2: listOfItems[index]['text2'],
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: 180,
                    width: 165,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(listOfItems[index]['image1']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.centerLeft,
                      width: 140,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white30,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7, left: 7),
                            child: Text(
                              listOfItems[index]['text1'],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/home_screen/listview/Component 90.png',
                                  width: 15,
                                  height: 15,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  listOfItems[index]['text2'],
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
// GestureDetector(
// onTap: () {
// Navigator.of(context).push(MaterialPageRoute(
// builder: (context) => Test(
// id: listOfSound,
// image: listOfSound['image'].toString(),
// title: '',
// sound: '',
// )));
// },
// child: ListViewBuilder2()),
