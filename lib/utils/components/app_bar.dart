import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    title: Text("My Little Pony"),
    actions: <Widget>[
      IconButton(
        icon: Theme.of(context).brightness == Brightness.dark
            ? Icon(Icons.brightness_7)
            : Icon(Icons.brightness_4),
        onPressed: () => AdaptiveTheme.of(context).toggleThemeMode(),
      ),
      // _cupertinoSwitchButton(),
      IconButton(icon: Icon(Icons.save), onPressed: () {}
          // (_formWidgetKey.currentState == null)
          //     ? null
          //     : _formWidgetKey.currentState!.savePressed,
          ),
    ],
    leading: IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {},
      // (_formWidgetKey.currentState == null)
      //     ? null
      //     : _formWidgetKey.currentState!.resetPressed,
    ),
  );
}
