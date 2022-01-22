import 'dart:ui';

import 'color_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme(Brightness brightness) {
  if (brightness == Brightness.dark) {
    return ThemeData(
      iconTheme: IconThemeData(color: ColorManager.darkPrimary),

      // main colors of the app
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.primaryOpacity70,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      // ripple color
      splashColor: ColorManager.primaryOpacity70,
      // will be used incase of disabled button for example
      accentColor: ColorManager.grey,
      cardTheme: cardTheme(),

      // card view theme
      // cardTheme: CardTheme(
      //     color: ColorManager.white,
      //     shadowColor: ColorManager.grey,
      //     elevation: AppSize.s4),
      // App bar theme
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      // Button theme
      buttonTheme: ButtonThemeData(
          shape: StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primary,
          splashColor: ColorManager.primaryOpacity70),

      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: ColorManager.white),
              primary: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s12)))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  TextStyle(color: ColorManager.primary)))),
      // Text theme
      textTheme: _textTheme(),
      // inputDecorationTheme: inputDecorationTheme(),
    );
  } else {
    return ThemeData(
      cardTheme: cardTheme(),
      iconTheme: IconThemeData(color: ColorManager.darkPrimary),
      primaryColor: Colors.teal, // app header background
      secondaryHeaderColor: Colors.indigo[400], // card header background
      cardColor: Colors.white, // card field background
      backgroundColor: Colors.indigo[100], // app background color
      textTheme: _textTheme(),
      // TextTheme(
      //   button: TextStyle(color: Colors.deepPurple[900]), // button text
      //   subtitle1: TextStyle(color: Colors.grey[800]), // input text
      //   headline6: TextStyle(color: Colors.white), // card header text
      // ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.primary,
          elevation: AppSize.s4,
          shadowColor: ColorManager.primaryOpacity70,
          titleTextStyle: getRegularStyle(
              color: ColorManager.white, fontSize: FontSize.s16)),
      // textButtonTheme: TextButtonThemeData(
      //   style: ButtonStyle(
      //     // backgroundColor: MaterialStateProperty.all<Color>(
      //     //     Colors.indigo[100]!), // button background color
      //     foregroundColor: MaterialStateProperty.all<Color>(
      //         Colors.white), // button text color
      //   ),
      // ),
      primaryTextTheme: TextTheme(
        headline6: TextStyle(color: Colors.lightBlue[50]), // app header text
      ),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                  TextStyle(color: ColorManager.primary)))),
      // inputDecorationTheme: inputDecorationTheme(),
    );
  }
}

CardTheme cardTheme() {
  return CardTheme(
    shape: RoundedRectangleBorder(
      side: BorderSide(
          width: 1,
          color:
              // AdaptiveThemeMode == AdaptiveThemeMode.light
              //     ?
              ColorManager.darkPrimary
          // : kPrimaryColorDark
          ),
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: ColorManager.darkGrey),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    labelStyle: TextStyle(color: ColorManager.primary), // style for labels

    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme _textTheme() {
  return TextTheme(
      headline1: getSemiBoldStyle(
          color: ColorManager.darkGrey, fontSize: FontSize.s16),
      headline2:
          getRegularStyle(color: ColorManager.white, fontSize: FontSize.s16),
      headline3:
          getBoldStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      headline4:
          getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      headline6:
          getBoldStyle(color: ColorManager.white, fontSize: FontSize.s20),
      subtitle1:
          getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      subtitle2:
          getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      bodyText2: getMediumStyle(color: ColorManager.lightGrey),
      caption: getRegularStyle(color: ColorManager.grey1),
      bodyText1: getRegularStyle(color: ColorManager.grey));
}
