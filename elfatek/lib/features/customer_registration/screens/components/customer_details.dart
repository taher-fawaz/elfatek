import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:card_settings/card_settings.dart';
import 'package:elfatek/presentation/base/model.dart';
import 'package:elfatek/presentation/common/card_setting.dart';
import 'package:elfatek/presentation/common/card_setting_section.dart';
import 'package:elfatek/presentation/common/card_textfield.dart';
import 'package:elfatek/presentation/resources/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class CustomerDetailsSection extends StatefulWidget {
  final GlobalKey<FormState>? titleKey;
  final GlobalKey<FormState>? addressKey;
  final GlobalKey<FormState>? countryKey;
  final GlobalKey<FormState>? districtKey;
  final GlobalKey<FormState>? isCustomerSastifiedKey;

  final GlobalKey<FormState>? cityKey;
  final GlobalKey<FormState>? nameKey;
  final GlobalKey<FormState>? representativeKey;
  final FocusNode? districtNode;

  final FocusNode? titleNode;

  final FocusNode? nameNode;

  final FocusNode? representativeNode;
  final TextEditingController? cusTitleController;
  final TextEditingController? cusnameController;
  final TextEditingController? cusRepController;
  final TextEditingController? adressController;

  final TextEditingController? districtController;
  final String? cityValue;
  final String? countryValue;

  const CustomerDetailsSection(
      {Key? key,
      this.titleKey,
      this.addressKey,
      this.nameKey,
      this.countryKey,
      this.districtKey,
      this.isCustomerSastifiedKey,
      this.cityKey,
      this.representativeKey,
      this.districtNode,
      this.titleNode,
      this.nameNode,
      this.representativeNode,
      this.cusTitleController,
      this.cusnameController,
      this.cusRepController,
      this.adressController,
      this.districtController,
      this.cityValue,
      this.countryValue})
      : super(key: key);

  @override
  State<CustomerDetailsSection> createState() => _CustomerDetailsSectionState();
}

class _CustomerDetailsSectionState extends State<CustomerDetailsSection> {
  final FocusNode _addressNode = FocusNode();
  PonyModel _ponyModel = PonyModel();
  // TextEditingController adressController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CardSettingSectionWidget(children: <CardSettingsSection>[
      CardSettingsSection(
        header: cardSettingsHeader('Customer Details'),
        children: <CardSettingsWidget>[
          buildCardSettingsTextDefault(
            key: widget.titleKey,
            focusNode: widget.titleNode,
            controller: widget.cusTitleController,
            hintText: _ponyModel.title,
            label: _ponyModel.title,
            inputAction: TextInputAction.next,
            inputActionNode: widget.nameNode,
          ),
          buildCardSettingsTextDefault(
            key: widget.nameKey,
            focusNode: widget.nameNode,
            controller: widget.cusnameController,
            hintText: _ponyModel.customerName,
            label: _ponyModel.customerName,
            inputAction: TextInputAction.next,
            inputActionNode: widget.representativeNode,
          ),
          buildCardSettingsTextDefault(
            key: widget.representativeKey,
            focusNode: widget.representativeNode,
            controller: widget.cusRepController,
            hintText: _ponyModel.customerRepresentative,
            label: _ponyModel.customerRepresentative,
            // inputAction: TextInputAction.next,
            // inputActionNode: widget.descriptionNode,
          ),
          buildCardSettingsParagraph(
            key: widget.addressKey,
            controller: widget.adressController,
            // focusNode: widget.addressNode,
            label: _ponyModel.adressLabel,
            hintText: _ponyModel.adressLabel,
            lines: 1,
          ),
          buildCardSettingsListPicker(
            key: widget.cityKey,
            items: citiesItems,
            label: _ponyModel.cityLabel,
            initialItem: _ponyModel.cityValue,
            hintText: _ponyModel.cityLabel,
            onSavedValue: widget.cityValue,
          ),
          buildCardSettingsTextDefault(
            key: widget.districtKey,
            controller: widget.districtController,
            focusNode: widget.districtNode,
            label: _ponyModel.districtLabel,
            hintText: _ponyModel.districtLabel,
          ),
          buildCardSettingsListPicker(
              key: widget.countryKey,
              items: countriesItems,
              label: _ponyModel.countryLabel,
              initialItem: _ponyModel.countryValue,
              hintText: _ponyModel.countryLabel,
              onSavedValue: widget.countryValue),
          buildCardSettingsSwitch(
            key: widget.isCustomerSastifiedKey,
            label: LocaleKeys.customer_satisfied.tr(),
            initialValue: _ponyModel.isCustomerSastified,
            onChanged: (p0) {
              setState(() {
                // isCutomerSastify = p0;
              });
            },
          ),
          CardSettingsText(
            // controller: widget.ifNotReasonController,
            label: LocaleKeys.If_not_reason.tr(),
            hintText: LocaleKeys.If_not_reason.tr(),
            // enabled: isCutomerSastify,
            // onChanged: (value) => isCutomerSastify,
          ),
        ],
      )
    ]);
  }
}
