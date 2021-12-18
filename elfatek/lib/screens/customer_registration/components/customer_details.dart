import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:card_settings/card_settings.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/card/plumbing/results.dart';
import 'package:elfatek/constants.dart';
import 'package:elfatek/utils/widgets/card_sett_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomerDetailsSection extends StatefulWidget {
  const CustomerDetailsSection({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsSection> createState() => _CustomerDetailsSectionState();
}

class _CustomerDetailsSectionState extends State<CustomerDetailsSection> {
  final GlobalKey<FormState> _titleKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final FocusNode _addressNode = FocusNode();
  TextEditingController nameController = TextEditingController();
  TextEditingController nameController2 = TextEditingController();
  TextEditingController nameController3 = TextEditingController();
  TextEditingController nameController4 = TextEditingController();
  final GlobalKey<FormState> _countryKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _districtKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _cityKey = GlobalKey<FormState>();

  final FocusNode _districtNode = FocusNode();
  final GlobalKey<FormState> _representativeKey = GlobalKey<FormState>();

  final FocusNode _titleNode = FocusNode();

  final FocusNode _nameNode = FocusNode();

  final FocusNode _representativeNode = FocusNode();

  final PonyModel _ponyModel = PonyModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future savePressed() async {
    final form = _formKey.currentState;
    print(nameController.text);
    if (form!.validate()) {
      form.save();

      // showResults(context, _ponyModel);
    } else {
      showErrors(context);
      // setState(() => autoValidateMode = AutovalidateMode.onUserInteraction);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
        builder: (_, mode, child) {
          return Expanded(
            child: Form(
              key: _formKey,
              child: CardSettings.sectioned(
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
                  children: <CardSettingsSection>[
                    CardSettingsSection(
                      header: CardSettingsHeader(
                        label: 'Customer Details',
                        // color: mode == AdaptiveThemeMode.light
                        //     ? kPrimaryColorLight
                        //     : kPrimaryColorDark,
                        labelAlign: TextAlign.center,
                      ),
                      children: <CardSettingsWidget>[
                        buildCardSettingsTextDefault(
                          key: _titleKey,
                          focusNode: _titleNode,
                          controller: nameController,
                          onSavedValue: _ponyModel.title,
                          hintText: _ponyModel.title,
                          label: _ponyModel.title,
                          inputAction: TextInputAction.next,
                          inputActionNode: _nameNode,
                        ),
                        buildCardSettingsTextDefault(
                          key: _nameKey,
                          focusNode: _nameNode,
                          controller: nameController2,
                          onSavedValue: _ponyModel.customerName,
                          hintText: _ponyModel.customerName,
                          label: _ponyModel.customerName,
                          inputAction: TextInputAction.next,
                          inputActionNode: _representativeNode,
                        ),
                        buildCardSettingsTextDefault(
                          key: _representativeKey,
                          focusNode: _representativeNode,
                          controller: nameController3,
                          onSavedValue: _ponyModel.customerRepresentative,
                          hintText: _ponyModel.customerRepresentative,
                          label: _ponyModel.customerRepresentative,
                          // inputAction: TextInputAction.next,
                          // inputActionNode: _descriptionNode,
                        ),
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
                  ]),
            ),
          );
        });
  }
}
