import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
    primaryTextTheme: TextTheme(
      headline6: TextStyle(color: Colors.lightBlue[50]), // app header text
    ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          side: const BorderSide(width: .5),
          primary: Colors.white,
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          // fixedSize: const Size(300, 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
    ),
    fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    iconTheme: _iconTheme(),
    cardTheme: cardTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: TextStyle(color: kPrimaryColor), // style for labels

    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

CardTheme cardTheme() {
  return CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 2, color: Colors.orange),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1: const TextStyle(color: kTextColor),
    bodyText2: const TextStyle(color: kTextColor),
    button: TextStyle(color: Colors.deepPurple[900]), // button text
    subtitle1: TextStyle(color: Colors.grey[800]), // input text
    headline6: const TextStyle(color: Colors.white), // card header text
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: kPrimaryColor,
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
}

IconThemeData _iconTheme() {
  return const IconThemeData(color: Colors.white, size: 50);
}

ThemeData buildTheme(Brightness brightness) {
  if (brightness == Brightness.dark) {
    return ThemeData(
      primarySwatch: Colors.teal,
      brightness: brightness,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      backgroundColor: Colors.black,
      textTheme: GoogleFonts.paprikaTextTheme(TextTheme()),
      fontFamily: GoogleFonts.getFont('Paprika').fontFamily,
    );
  } else {
    return ThemeData(
      primaryColor: Colors.teal, // app header background
      secondaryHeaderColor: Colors.indigo[400], // card header background
      cardColor: Colors.white, // card field background
      backgroundColor: Colors.indigo[100], // app background color
      textTheme: TextTheme(
        button: TextStyle(color: Colors.deepPurple[900]), // button text
        subtitle1: TextStyle(color: Colors.grey[800]), // input text
        headline6: TextStyle(color: Colors.white), // card header text
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.indigo[100]!), // button background color
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
      fontFamily: GoogleFonts.getFont('Paprika').fontFamily,
      // cardTheme: CardTheme(
      //   shape: RoundedRectangleBorder(
      //     side: BorderSide(width: 2, color: Colors.orange),
      //     borderRadius: BorderRadius.circular(20),
      //   ),
      // ),
    );
  }
}
