import 'package:card_settings/card_settings.dart';
import '../resources/size_config.dart';
import 'package:flutter/material.dart';

class CardSettingSectionWidget extends StatelessWidget {
  const CardSettingSectionWidget({Key? key, this.children}) : super(key: key);
  final List<CardSettingsSection>? children;
  @override
  Widget build(BuildContext context) {
    return CardSettings.sectioned(
      margin: EdgeInsets.all(
          //getProportionateScreenHeight(
          10),
      showMaterialonIOS: true,
      scrollable: true,
      labelWidth: 150,
      contentAlign: TextAlign.right,
      cardless: false,
      cardElevation: 10,
      // divider: const Divider(
      //   color: Colors.grey,
      //   thickness: .5,
      // ),
      fieldPadding: const EdgeInsets.all(10),
      children: children!,
    );
  }
}
