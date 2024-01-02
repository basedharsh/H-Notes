import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  //For text style

  //title
  static TextStyle mainTitle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  //content
  static TextStyle mainContent = GoogleFonts.nunito(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  //DateTitle
  static TextStyle subTitle = GoogleFonts.roboto(
    fontSize: 13,
    fontWeight: FontWeight.w400,
  );

  //For color style
  static Color primaryColor = Color.fromARGB(218, 34, 0, 51);
  static Color secondaryColor = Color(0xFF0065FF);
  static Color bgColor = Color(0xFFe2e2ee);

  // This is for the card colors which will be randomly picked
  static List<Color> cardsColor = [
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.green.shade100,
    Colors.blue.shade100,
    Colors.blueGrey.shade100,
    Colors.teal.shade100,
    Colors.indigo.shade100,
    Colors.purple.shade100,
    Colors.brown.shade100,
    Colors.amber.shade100,
    Colors.deepOrange.shade100,
    Colors.blueGrey.shade100,
    Colors.lightGreen.shade100,
  ];

  //
}
