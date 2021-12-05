import 'package:card_settings/card_settings.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/utils/widgets/card_sett_text.dart';
import 'package:flutter/material.dart';

class CustomerAdressSection extends StatefulWidget {
  const CustomerAdressSection({Key? key}) : super(key: key);

  @override
  _CustomerAdressSectionState createState() => _CustomerAdressSectionState();
}

class _CustomerAdressSectionState extends State<CustomerAdressSection> {
  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _countryKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _districtKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _cityKey = GlobalKey<FormState>();

  final FocusNode _addressNode = FocusNode();
  final FocusNode _districtNode = FocusNode();

  final PonyModel _ponyModel = PonyModel();
  @override
  Widget build(BuildContext context) {
    return CardSettings.sectioned(
        showMaterialonIOS: true,
        scrollable: true,
        labelWidth: 150,
        contentAlign: TextAlign.right,
        cardless: false,
        cardElevation: 10,
        divider: Divider(
          color: Colors.grey,
          thickness: .5,
        ),
        // fieldPadding: EdgeInsets.all(10),
        children: <CardSettingsSection>[
          CardSettingsSection(
            header: CardSettingsHeader(
              label: 'Customer Adress Details',
            ),
            children: <CardSettingsWidget>[
              buildCardSettingsParagraph(
                key: _addressKey,
                focusNode: _addressNode,
                label: _ponyModel.adressLabel,
                hintText: _ponyModel.adressLabel,
                onSavedValue: _ponyModel.adressValue,
                lines: 2,
              ),
              buildCardSettingsListPicker(
                  key: _cityKey,
                  items: citiesItems,
                  label: _ponyModel.cityLabel,
                  initialItem: _ponyModel.cityValue,
                  hintText: _ponyModel.cityLabel,
                  onSavedValue: _ponyModel.cityValue),
              buildCardSettingsTextDefault(
                key: _districtKey,
                focusNode: _districtNode,
                label: _ponyModel.districtLabel,
                hintText: _ponyModel.districtLabel,
                onSavedValue: _ponyModel.districtValue,
              ),
              buildCardSettingsListPicker(
                  key: _countryKey,
                  items: countriesItems,
                  label: _ponyModel.countryLabel,
                  initialItem: _ponyModel.countryValue,
                  hintText: _ponyModel.countryLabel,
                  onSavedValue: _ponyModel.countryValue),
            ],
          )
        ]);
  }
}
