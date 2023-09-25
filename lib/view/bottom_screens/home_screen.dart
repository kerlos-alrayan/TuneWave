import 'package:flutter/material.dart';
import 'package:music_app/components/listview_builder.dart';
import 'package:music_app/components/listview_builder2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search and Image
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/home_screen/Group 279142.png',
                            color: Color(0xffB5B9C7),
                            width: 32,
                            height: 32,
                          ),
                          Spacer(),
                          Image.asset(
                            'assets/images/home_screen/Vector.png',
                            color: Color(0xffB5B9C7),
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    // Text
                    Text(
                      'Hi rcOut,',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 34,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text(
                      'What you want to hear today?',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white54,
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.055),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        fillColor: Colors.black.withOpacity(0.2),
                        filled: true,
                        hintText: 'Search podcast',
                        hintStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white30,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white70,
                          size: 28,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.transparent)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.055),
              // ListView.Builder
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: ListViewBuilder(),
              ),
              // Text
              Padding(
                padding: const EdgeInsets.only(top: 24, left: 18, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top songs',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'see more',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        color: Color(0xffA957E6),
                      ),
                    ),
                  ],
                ),
              ),
              // ListView.Builder2
              Padding(
                padding: const EdgeInsets.only(top: 18, left: 16),
                child: ListViewBuilder2(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
