import 'package:card_settings/card_settings.dart';
import '../resources/color_manager.dart';
import 'package:flutter/cupertino.dart';

CardSettingsHeader cardSettingsHeader(String label) => CardSettingsHeader(
      color: ColorManager.primary,
      label: label,
      // color: mode == AdaptiveThemeMode.light
      //     ? kPrimaryColorLight
      //     : kPrimaryColorDark,
      labelAlign: TextAlign.center,
    );
