import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'constants.dart';

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColorLight),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: TextStyle(color: Colors.indigo[400]!), // style for labels

    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

CardTheme cardTheme() {
  return CardTheme(
    shape: RoundedRectangleBorder(
      // side: BorderSide(
      //     width: 2,
      //     color: AdaptiveThemeMode == AdaptiveThemeMode.light
      //         ? Colors.orange
      //         : kPrimaryColorDark),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

TextTheme textTheme(Brightness brightness) {
  return TextTheme(
    bodyText1: const TextStyle(color: kTextColorLight),
    bodyText2: const TextStyle(color: kTextColorLight),
    button: TextStyle(color: Colors.deepPurple[900]), // button text
    subtitle1: TextStyle(
        color: brightness == Brightness.light
            ? Colors.grey[800]
            : Colors.white), // input text
    headline6: const TextStyle(color: Colors.white), // card header text
  );
}

AppBarTheme appBarTheme(Brightness brightness) {
  if (brightness == Brightness.light) {
    return const AppBarTheme(
      color: kSecondaryColorLight,
      elevation: 0,
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
      // brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
      // textTheme: TextTheme(
      //   headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
      // ),
    );
  } else {
    return AppBarTheme(
      color: kPrimaryColorDark,
      elevation: 0,
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      // brightness: Brightness.light,
      iconTheme: const IconThemeData(color: Colors.grey),
      toolbarTextStyle: const TextStyle(color: kTextColorDark, fontSize: 18),
      // textTheme: TextTheme(
      //   headline6: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
      // ),
    );
  }
}

ThemeData buildTheme(Brightness brightness) {
  if (brightness == Brightness.dark) {
    return ThemeData(
      primaryColor: HexColor('#16D950'),
      cardTheme: cardTheme(),
      cardColor: kPrimaryLightColorDark,
      appBarTheme: appBarTheme(brightness),
      iconTheme: const IconThemeData(color: Colors.white),
      scaffoldBackgroundColor: HexColor('#141630'),
      // secondaryHeaderColor: Colors.indigo[400], // card header background
      // cardColor: (LinearGradient(
      //   begin: Alignment.topLeft,
      //   end: Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
      //   colors: <Color>[Color(0xffee0000), Color(0xffeeee00)], // red to yellow
      //   tileMode: TileMode.repeated, // repeats the gradient over the canvas
      // )), // card field background
      brightness: brightness,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: HexColor('#141630'),
      textTheme: GoogleFonts.robotoTextTheme(textTheme(brightness)),
      fontFamily: GoogleFonts.getFont('Roboto').fontFamily,
    );
  } else {
    return ThemeData(
      tabBarTheme: TabBarTheme(
          labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      primaryColor: kPrimaryColorLight,
      secondaryHeaderColor: kPrimaryColorLight,
      appBarTheme: AppBarTheme(color: kPrimaryColorLight),
      cardColor: Colors.white,
      cardTheme: cardTheme(),
      backgroundColor: Colors.indigo[100],
      // textTheme: textTheme(),

      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              kPrimaryColorLight), // button background color
          foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white), // button text color
        ),
      ),
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: Colors.lightBlue[50]), // app header text
      ),

      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.indigo[400]), // style for labels
      ),
      textTheme: GoogleFonts.robotoTextTheme(textTheme(brightness)),
      fontFamily: GoogleFonts.getFont('Roboto').fontFamily,
      // cardTheme: CardTheme(
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(width: 2, color: Colors.orange),
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      // ),
    );
  }
}
