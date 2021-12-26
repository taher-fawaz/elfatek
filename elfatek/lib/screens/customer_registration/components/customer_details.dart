import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:card_settings/card_settings.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/card/plumbing/results.dart';
import 'package:elfatek/constants.dart';
import 'package:elfatek/controller/api_controller.dart';
import 'package:elfatek/model/customer_registration.dart';
import 'package:elfatek/utils/widgets/card_sett_text.dart';
import 'package:flutter/material.dart';

import 'package:elfatek/translations/locale_keys.g.dart';

import 'package:easy_localization/easy_localization.dart';

class CustomerDetailsSection extends StatefulWidget {
  CustomerRegistration? customerRegistration;
  CustomerDetailsSection(customerRegistration, {Key? key}) : super(key: key);

  @override
  State<CustomerDetailsSection> createState() => _CustomerDetailsSectionState();
}

class _CustomerDetailsSectionState extends State<CustomerDetailsSection> {
  final GlobalKey<FormState> _titleKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final FocusNode _addressNode = FocusNode();
  TextEditingController cusTitleController = TextEditingController();
  TextEditingController cusnameController2 = TextEditingController();
  TextEditingController cusRepController3 = TextEditingController();
  TextEditingController adressController4 = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController coountryController2 = TextEditingController();
  TextEditingController districtController3 = TextEditingController();
  // TextEditingController adressController4 = TextEditingController();
  final GlobalKey<FormState> _countryKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _districtKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _isCustomerSastifiedKey = GlobalKey<FormState>();

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
    // print(nameController.text);
    if (form!.validate()) {
      form.save();

      // showResults(context, _ponyModel);
    } else {
      // showErrors(context);
      // setState(() => autoValidateMode = AutovalidateMode.onUserInteraction);
    }
  }

  bool isCutomerSastify = false;
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
                          controller: cusTitleController,
                          onSavedValue:
                              widget.customerRegistration?.customerTitle ?? '',
                          hintText: _ponyModel.title,
                          label: _ponyModel.title,
                          inputAction: TextInputAction.next,
                          inputActionNode: _nameNode,
                        ),
                        buildCardSettingsTextDefault(
                          key: _nameKey,
                          focusNode: _nameNode,
                          controller: cusnameController2,
                          onSavedValue:
                              widget.customerRegistration?.customerName ?? '',
                          hintText: _ponyModel.customerName,
                          label: _ponyModel.customerName,
                          inputAction: TextInputAction.next,
                          inputActionNode: _representativeNode,
                        ),
                        buildCardSettingsTextDefault(
                          key: _representativeKey,
                          focusNode: _representativeNode,
                          controller: cusRepController3,
                          onSavedValue: widget.customerRegistration
                                  ?.customerRepresentative ??
                              '',
                          hintText: _ponyModel.customerRepresentative,
                          label: _ponyModel.customerRepresentative,
                          // inputAction: TextInputAction.next,
                          // inputActionNode: _descriptionNode,
                        ),
                        buildCardSettingsParagraph(
                          key: _addressKey,
                          controller: adressController4,
                          focusNode: _addressNode,
                          label: _ponyModel.adressLabel,
                          hintText: _ponyModel.adressLabel,
                          onSavedValue:
                              widget.customerRegistration?.adress ?? '',
                          lines: 1,
                        ),
                        buildCardSettingsListPicker(
                            key: _cityKey,
                            items: citiesItems,
                            label: _ponyModel.cityLabel,
                            initialItem: _ponyModel.cityValue,
                            hintText: _ponyModel.cityLabel,
                            onSavedValue:
                                widget.customerRegistration?.city ?? ''),
                        buildCardSettingsTextDefault(
                          key: _districtKey,
                          focusNode: _districtNode,
                          label: _ponyModel.districtLabel,
                          hintText: _ponyModel.districtLabel,
                          onSavedValue:
                              widget.customerRegistration?.district ?? '',
                        ),
                        buildCardSettingsListPicker(
                            key: _countryKey,
                            items: countriesItems,
                            label: _ponyModel.countryLabel,
                            initialItem: _ponyModel.countryValue,
                            hintText: _ponyModel.countryLabel,
                            onSavedValue:
                                widget.customerRegistration?.country ?? ''),
                        buildCardSettingsSwitch(
                          key: _isCustomerSastifiedKey,
                          label: LocaleKeys.customer_satisfied.tr(),
                          onSavedValue: false,
                          initialValue: _ponyModel.isCustomerSastified,
                          onChanged: (p0) {
                            print(p0);
                            setState(() {
                              _ponyModel.isCustomerSastified =
                                  !_ponyModel.isCustomerSastified;
                            });
                          },
                        ),
                        CardSettingsText(
                          label: LocaleKeys.If_not_reason.tr(),
                          hintText: LocaleKeys.If_not_reason.tr(),
                          enabled: _ponyModel.isCustomerSastified,
                          onChanged: (value) => isCutomerSastify,
                        ),
                        CardSettingsButton(
                          label: 'SAVE',
                          onPressed: () {
                            ApiController().createRecord(CustomerRegistration(
                              customerName: cusTitleController.text,
                              customerTitle: cusTitleController.text,
                              customerAuthorizedName: cusRepController3.text,
                              userId: 1,
                              customerSatisfied: isCutomerSastify ? 1 : 0,
                              registrationDate: DateTime.now(),
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                            ));
                            print(cusTitleController.text);
                          },
                        ),
                      ],
                    )
                  ]),
            ),
          );
        });
  }
}
