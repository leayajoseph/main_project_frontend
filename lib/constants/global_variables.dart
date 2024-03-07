import 'package:flutter/material.dart';

class GlobalVariables
{
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 168, 218, 110),
      Color.fromARGB(255, 60, 180, 28),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(168, 218, 110, 1.0);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.green;
  static const unselectedNavBarColor = Colors.black87;
}