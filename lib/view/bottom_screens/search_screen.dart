import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
      ),
    );
  }
}
