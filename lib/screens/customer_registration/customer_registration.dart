import 'package:card_settings/card_settings.dart';
import 'package:elfatek/services/api/customer_record_api.dart';
import '../../constants.dart';
import '../../model/customer_registration.dart';

import '../../card/plumbing/model.dart';

import '../../utils/widgets/card_sett_text.dart';
import 'package:flutter/material.dart';

import '../../translations/locale_keys.g.dart';

import 'package:easy_localization/easy_localization.dart';

class CustomerRegistrationScreen extends StatefulWidget {
  static String routeName = "/customer_registration";
  CustomerRegistrationScreen({Key? key, onPressed}) : super(key: key);

  @override
  State<CustomerRegistrationScreen> createState() =>
      _CustomerRegistrationScreenState();
}

class _CustomerRegistrationScreenState extends State<CustomerRegistrationScreen>
    with TickerProviderStateMixin {
  int pageIndex = 0;
  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final FocusNode _addressNode = FocusNode();
  TextEditingController cusTitleController = TextEditingController();
  TextEditingController cusnameController = TextEditingController();
  TextEditingController cusRepController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  // TextEditingController adressController4 = TextEditingController();
  final GlobalKey<FormState> _countryKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _districtKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _isCustomerSastifiedKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _cityKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _representativeKey = GlobalKey<FormState>();

  bool isCutomerSastify = false;
  bool isShowRefrence = false;

  final GlobalKey<FormState> _isShowRefKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _currentProductBrandKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _currentProductQuantityKey =
      GlobalKey<FormState>();
  final FocusNode _districtNode = FocusNode();

  final GlobalKey<FormState> _titleKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _businessPhone1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _businessPhone2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _faxNumberKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _taxAdministrationKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _gsmNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _websiteKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _email1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _email2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _taxNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _isActiveKey = GlobalKey<FormState>();
  bool isActive = false;
  final GlobalKey<FormState> _customerStatusKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _customerRepresentativeKey =
      GlobalKey<FormState>();

  final GlobalKey<FormState> _sliderKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _sliderKey2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _dateKey = GlobalKey<FormState>();
  final TextEditingController _countryController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _currentProductBrandController =
      TextEditingController();
  final TextEditingController _ifNotReasonController = TextEditingController();
  final TextEditingController _businessPhone1Controller =
      TextEditingController();
  final TextEditingController _businessPhone2Controller =
      TextEditingController();
  final TextEditingController _faxNumberController = TextEditingController();

  final TextEditingController _taxAdministrationController =
      TextEditingController();
  final TextEditingController _gsmNumberController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _email1Controller = TextEditingController();
  final TextEditingController _email2Controller = TextEditingController();
  final TextEditingController _taxNumberController = TextEditingController();

  final TextEditingController _customerStatusController =
      TextEditingController();
  final FocusNode _titleNode = FocusNode();

  final FocusNode _nameNode = FocusNode();
  final FocusNode _taxNumberNode3 = FocusNode();
  final FocusNode _representativeNode = FocusNode();
  final FocusNode _taxNumberNode2 = FocusNode();
  final FocusNode _businessPhone1Node = FocusNode();
  final FocusNode _businessPhone2Node = FocusNode();
  final FocusNode _faxNumberNode = FocusNode();
  final FocusNode _gsmNumberNode = FocusNode();
  final FocusNode _websiteNode = FocusNode();
  final FocusNode _email1Node = FocusNode();
  final FocusNode _email2Node = FocusNode();
  final FocusNode _taxNumberNode = FocusNode();
  final GlobalKey<FormState> _mainGroupKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _secondGroupKey = GlobalKey<FormState>();
  PickerModel mainGroupValue = const PickerModel('Group 1', code: 'a');
  PickerModel secondGroupValue = const PickerModel('Group 1', code: 'a');
  CustomerRegistration customerRegistration = CustomerRegistration(
    customerName: 'a',
    customerTitle: '',
    customerAuthorizedName: '',
    customerSatisfied: 0,
    registrationDate: DateTime.now(),
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  );
  final FocusNode _taxAdministrationNode = FocusNode();
  final PonyModel _ponyModel = PonyModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int productQuantity = 7;
  double possibility = 0;
  double probability = 7;

  // void _saveForm() {
  //   final isValid = _formKey.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }

  //   _formKey.currentState!.save();
  //   Provider.of<CutomerRecords>(context).addRecord(CustomerRegistration(
  //       customerName: cusnameController.text,
  //       customerTitle: cusTitleController.text,
  //       customerAuthorizedName: cusRepController.text,
  //       customerSatisfied: isCutomerSastify ? 1 : 0));
  // }

  @override
  Widget build(BuildContext context) {
    TabController controller =
        TabController(length: 4, vsync: this, initialIndex: pageIndex);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: AppBar(
            elevation: 0,
            bottom: TabBar(
              enableFeedback: true,
              labelColor: Colors.white,
              indicatorColor: kPrimaryLightColorLight,
              labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              onTap: (value) {
                setState(() {
                  pageIndex = value;
                });
                print(value);
              },
              controller: controller,
              tabs: const [
                // Icon(Icons.ac_unit_outlined),
                Tab(
                  text: "Details",
                ),
                Tab(
                  text: 'Contacts',
                ),
                Tab(
                  text: 'Status',
                ),
                Tab(
                  text: 'Product',
                ),
              ],
            ),
            // title: Text('Tabs Demo'),
          ),
        ),
        body: //  TabBarView(  <--- replace with **VerticalTabBarView**
            Form(
          key: _formKey,
          child: Column(
            children: [
              Visibility(
                  visible: pageIndex == 0 ? true : false,
                  child: Expanded(
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
                                onSaved: (value) {
                                  customerRegistration = CustomerRegistration(
                                      customerName:
                                          customerRegistration.customerName,
                                      customerTitle: value,
                                      customerAuthorizedName:
                                          customerRegistration
                                              .customerAuthorizedName,
                                      customerSatisfied: customerRegistration
                                          .customerSatisfied);
                                  print('object');
                                },
                                hintText: _ponyModel.title,
                                label: _ponyModel.title,
                                inputAction: TextInputAction.next,
                                inputActionNode: _nameNode,
                              ),
                              buildCardSettingsTextDefault(
                                key: _nameKey,
                                focusNode: _nameNode,
                                controller: cusnameController,
                                onSaved: (value) {
                                  customerRegistration = CustomerRegistration(
                                      customerName: value,
                                      customerTitle:
                                          customerRegistration.customerTitle,
                                      customerAuthorizedName:
                                          customerRegistration
                                              .customerAuthorizedName,
                                      customerSatisfied: customerRegistration
                                          .customerSatisfied);
                                },
                                hintText: _ponyModel.customerName,
                                label: _ponyModel.customerName,
                                inputAction: TextInputAction.next,
                                inputActionNode: _representativeNode,
                              ),
                              buildCardSettingsTextDefault(
                                key: _representativeKey,
                                focusNode: _representativeNode,
                                controller: cusRepController,
                                onSaved: (value) {
                                  customerRegistration = CustomerRegistration(
                                    customerName:
                                        customerRegistration.customerName,
                                    customerTitle:
                                        customerRegistration.customerTitle,
                                    customerAuthorizedName: customerRegistration
                                        .customerAuthorizedName,
                                    customerSatisfied:
                                        customerRegistration.customerSatisfied,
                                    customerRepresentative: value,
                                  );
                                },
                                hintText: _ponyModel.customerRepresentative,
                                label: _ponyModel.customerRepresentative,
                                // inputAction: TextInputAction.next,
                                // inputActionNode: _descriptionNode,
                              ),
                              buildCardSettingsParagraph(
                                key: _addressKey,
                                controller: adressController,
                                focusNode: _addressNode,
                                label: _ponyModel.adressLabel,
                                hintText: _ponyModel.adressLabel,
                                onSaved: (value) {
                                  customerRegistration = CustomerRegistration(
                                    customerName:
                                        customerRegistration.customerName,
                                    customerTitle:
                                        customerRegistration.customerTitle,
                                    customerAuthorizedName: customerRegistration
                                        .customerAuthorizedName,
                                    customerSatisfied:
                                        customerRegistration.customerSatisfied,
                                    adress: value,
                                  );
                                },
                                lines: 1,
                              ),
                              buildCardSettingsListPicker(
                                key: _cityKey,
                                items: citiesItems,
                                controller: cityController,
                                label: _ponyModel.cityLabel,
                                initialItem: _ponyModel.cityValue,
                                hintText: _ponyModel.cityLabel,
                                onSaved: (value) {
                                  print("object");
                                  customerRegistration = CustomerRegistration(
                                    customerName:
                                        customerRegistration.customerName,
                                    customerTitle:
                                        customerRegistration.customerTitle,
                                    customerAuthorizedName: customerRegistration
                                        .customerAuthorizedName,
                                    customerSatisfied:
                                        customerRegistration.customerSatisfied,
                                    city: value!.name,
                                  );
                                },
                              ),
                              buildCardSettingsTextDefault(
                                key: _districtKey,
                                controller: districtController,
                                focusNode: _districtNode,
                                label: _ponyModel.districtLabel,
                                hintText: _ponyModel.districtLabel,
                                onSaved: (value) {},
                              ),
                              buildCardSettingsListPicker(
                                  key: _countryKey,
                                  controller: _countryController,
                                  items: countriesItems,
                                  label: _ponyModel.countryLabel,
                                  initialItem: _ponyModel.countryValue,
                                  hintText: _ponyModel.countryLabel,
                                  onSaved: (value) {}),
                              buildCardSettingsSwitch(
                                key: _isCustomerSastifiedKey,
                                label: LocaleKeys.customer_satisfied.tr(),
                                onSaved: (value) {
                                  print(value);
                                  customerRegistration = CustomerRegistration(
                                    customerName:
                                        customerRegistration.customerName,
                                    customerTitle:
                                        customerRegistration.customerTitle,
                                    customerAuthorizedName: customerRegistration
                                        .customerAuthorizedName,
                                    customerSatisfied: value! ? 1 : 0,
                                  );
                                },
                                initialValue: _ponyModel.isCustomerSastified,
                                onChanged: (p0) {
                                  setState(() {
                                    isCutomerSastify = p0;
                                  });
                                },
                              ),
                              CardSettingsText(
                                controller: _ifNotReasonController,
                                label: LocaleKeys.If_not_reason.tr(),
                                hintText: LocaleKeys.If_not_reason.tr(),
                                enabled: isCutomerSastify,
                                onChanged: (value) => isCutomerSastify,
                              ),
                            ],
                          )
                        ]),
                  )),
              Visibility(
                  visible: pageIndex == 1 ? true : false,
                  child: Expanded(
                    child: CardSettings.sectioned(
                        showMaterialonIOS: true,
                        scrollable: true,
                        labelWidth: 150,
                        contentAlign: TextAlign.right,
                        cardless: false,
                        cardElevation: 10,
                        divider: const Divider(
                          color: Colors.grey,
                          thickness: .5,
                        ),
                        // fieldPadding: EdgeInsets.all(10),
                        children: <CardSettingsSection>[
                          CardSettingsSection(
                            header: CardSettingsHeader(
                              label: "Customer's Contacts",
                            ),
                            children: <CardSettingsWidget>[
                              buildCardSettingsNumeric(
                                key: _businessPhone1Key,
                                controller: _businessPhone1Controller,
                                focusNode: _businessPhone1Node,
                                label: _ponyModel.businessPhone1Label,
                                hintText: _ponyModel.businessPhone1Label,
                                inputActionNode: _businessPhone2Node,
                                initialValue: _ponyModel.businessPhone1Value,
                              ),
                              buildCardSettingsNumeric(
                                key: _businessPhone2Key,
                                controller: _businessPhone2Controller,
                                focusNode: _businessPhone2Node,
                                label: _ponyModel.businessPhone2Label,
                                hintText: _ponyModel.businessPhone2Label,
                                inputActionNode: _faxNumberNode,
                                initialValue: _ponyModel.businessPhone2Value,
                              ),
                              buildCardSettingsNumeric(
                                key: _faxNumberKey,
                                controller: _faxNumberController,
                                focusNode: _faxNumberNode,
                                label: _ponyModel.faxNumberLabel,
                                hintText: _ponyModel.faxNumberLabel,
                                inputActionNode: _gsmNumberNode,
                                initialValue: _ponyModel.faxNumberValue,
                              ),
                              buildCardSettingsNumeric(
                                key: _gsmNumberKey,
                                controller: _gsmNumberController,
                                focusNode: _gsmNumberNode,
                                label: _ponyModel.gsmNumberLabel,
                                hintText: _ponyModel.gsmNumberLabel,
                                initialValue: _ponyModel.gsmNumberValue,
                                inputActionNode: _taxAdministrationNode,
                              ),
                              buildCardSettingsTextDefault(
                                  key: _taxAdministrationKey,
                                  controller: _taxAdministrationController,
                                  focusNode: _taxAdministrationNode,
                                  onSaved: (value) {},
                                  hintText: _ponyModel.taxAdministrationLabel,
                                  label: _ponyModel.taxAdministrationLabel,
                                  inputAction: TextInputAction.next,
                                  inputActionNode: _taxNumberNode,
                                  initialValue:
                                      _ponyModel.taxAdministrationValue),
                              buildCardSettingsNumeric(
                                key: _taxNumberKey,
                                controller: _taxNumberController,
                                focusNode: _taxNumberNode,
                                label: _ponyModel.taxNumberLabel,
                                hintText: _ponyModel.taxNumberLabel,
                                // onSavedValue: _ponyModel.taxNumberValue,
                                onSaved: (value) {},
                                inputActionNode: _email1Node,
                                initialValue: _ponyModel.taxNumberValue,
                              ),
                              buildCardSettingsEmail(
                                key: _email1Key,
                                controller: _email1Controller,
                                label: _ponyModel.email1Label,
                                // onSavedValue: _ponyModel.email1Value,
                                onSaved: (value) {},
                                focusNode: _email1Node,
                                initialValue: _ponyModel.email1Value,
                                inputActionNode: _email2Node,
                              ),
                              buildCardSettingsEmail(
                                key: _email2Key, controller: _email2Controller,
                                label: _ponyModel.email2Label,
                                // onSavedValue: _ponyModel.email2Value,
                                onSaved: (value) {},
                                // widget.customerRegistration?.customerSatisfied,
                                focusNode: _email2Node,
                                initialValue: _ponyModel.email2Value,
                                inputActionNode: _websiteNode,
                              ),
                              buildCardSettingsTextDefault(
                                key: _websiteKey,
                                controller: _websiteController,
                                focusNode: _websiteNode,
                                // onSavedValue: _ponyModel.websiteValue,
                                onSaved: (value) {},
                                hintText: _ponyModel.websiteLabel,
                                label: _ponyModel.websiteLabel,
                                inputAction: TextInputAction.done,
                                // inputActionNode: _nameNode,
                              ),
                            ],
                          )
                        ]),
                  )),
              Visibility(
                  visible: pageIndex == 2 ? true : false,
                  child: Expanded(
                    child: CardSettings.sectioned(
                        shrinkWrap: true,
                        showMaterialonIOS: true,
                        scrollable: true,
                        labelWidth: 150,
                        contentAlign: TextAlign.right,
                        cardless: false,
                        cardElevation: 10,
                        divider: const Divider(
                          color: Colors.grey,
                          thickness: .5,
                        ),
                        // fieldPadding: EdgeInsets.all(10),
                        children: <CardSettingsSection>[
                          CardSettingsSection(
                            header: CardSettingsHeader(
                              label: "Customer Status",
                            ),
                            children: <CardSettingsWidget>[
                              buildCardSettingsSwitch(
                                key: _isActiveKey,
                                label: _ponyModel.isActiveLabel,
                                initialValue: isActive,
                                onChanged: (p0) => isActive = p0,
                              ),
                              buildCardSettingsTextDefault(
                                  key: _customerStatusKey,
                                  controller: _customerStatusController,
                                  // focusNode: _taxAdministrationNode,
                                  hintText: LocaleKeys.customer_status.tr(),
                                  label: LocaleKeys.customer_status.tr(),
                                  inputAction: TextInputAction.next,
                                  inputActionNode: _taxNumberNode2,
                                  initialValue:
                                      _ponyModel.taxAdministrationValue),
                              buildCardSettingsTextDefault(
                                  key: _customerRepresentativeKey,
                                  // focusNode: _taxAdministrationNode,

                                  hintText:
                                      LocaleKeys.customer_representative.tr(),
                                  label:
                                      LocaleKeys.customer_representative.tr(),
                                  inputAction: TextInputAction.next,
                                  inputActionNode: _taxNumberNode2,
                                  initialValue:
                                      _ponyModel.taxAdministrationValue),
                              CardSettingsSlider(
                                key: _sliderKey,
                                label: LocaleKeys.possibility.tr(),
                                divisions: 4,
                                min: 0,
                                max: 100,
                                initialValue: _ponyModel.rating,
                                autovalidateMode: autoValidateMode,
                                validator: (double? value) {
                                  if (value == null)
                                    return 'You must pick a rating.';
                                  return null;
                                },
                                onSaved: (value) => possibility = value!,
                                onChanged: (value) => possibility = value,
                                visible: true,
                                fieldPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              ),
                              CardSettingsSlider(
                                key: _sliderKey2,
                                label: LocaleKeys.dealer_probability.tr(),
                                divisions: 4,
                                min: 0,
                                max: 100,
                                initialValue: _ponyModel.rating,
                                autovalidateMode: autoValidateMode,
                                validator: (double? value) {
                                  if (value == null)
                                    return 'You must pick a rating.';
                                  return null;
                                },
                                onSaved: (value) => probability = value!,
                                onChanged: (value) => probability = value,
                                visible: true,
                                fieldPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                              ),
                              CardSettingsDatePicker(
                                key: _dateKey,
                                icon: const Icon(Icons.calendar_today),
                                label: LocaleKeys.do_not_get_registered.tr(),
                                dateFormat: DateFormat.yMMMMd(),
                                initialValue: _ponyModel.showDateTime,
                                onSaved: (value) => _ponyModel.showDateTime =
                                    updateJustDate(
                                        value!, _ponyModel.showDateTime),
                                onChanged: (value) {},
                              ),
                            ],
                          )
                        ]),
                  )),
              Visibility(
                  visible: pageIndex == 3 ? true : false,
                  child: Expanded(
                    child: CardSettings.sectioned(
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
                              label: 'Customer Product Details',
                            ),
                            children: <CardSettingsWidget>[
                              buildCardSettingsTextDefault(
                                  key: _currentProductBrandKey,
                                  controller: _currentProductBrandController,
                                  // focusNode: _taxAdministrationNode,
                                  onSaved: (value) {},
                                  hintText:
                                      LocaleKeys.current_product_brand.tr(),
                                  label: LocaleKeys.current_product_brand.tr(),
                                  inputAction: TextInputAction.next,
                                  inputActionNode: _taxNumberNode3,
                                  initialValue:
                                      _ponyModel.taxAdministrationValue),
                              CardSettingsNumberPicker(
                                key: _currentProductQuantityKey,
                                label: LocaleKeys.current_product_quantity.tr(),
                                labelAlign: TextAlign.center,
                                initialValue: productQuantity,
                                min: 1,
                                max: 1000,
                                stepInterval: 2,
                                validator: (value) {
                                  if (value == null) return 'Age is required.';
                                  if (value > 20) return 'No grown-ups allwed!';
                                  if (value < 3) return 'No Toddlers allowed!';
                                  return null;
                                },
                                onSaved: (value) => productQuantity = value!,
                                onChanged: (value) {},
                              ),
                              buildCardSettingsSwitch(
                                key: _isShowRefKey,
                                label: LocaleKeys.show_reference.tr(),
                                initialValue: isShowRefrence,
                                onChanged: (p0) {
                                  isShowRefrence = p0;
                                },
                              ),
                              buildCardSettingsRadioPicker(
                                key: _mainGroupKey,
                                items: const [
                                  PickerModel('Group 1', code: 'M'),
                                  PickerModel('Group 2', code: 'F'),
                                ],
                                label: _ponyModel.currentMainGroupLable,
                                onSavedValue: mainGroupValue,
                                hintText: _ponyModel.currentMainGroupLable,
                                initialItem: mainGroupValue,
                              ),
                              buildCardSettingsSelectionPicker(
                                key: _secondGroupKey,
                                items: const [
                                  PickerModel('Group 1', code: 'M'),
                                  PickerModel('Group 2', code: 'F'),
                                ],
                                label: _ponyModel.currentSecondGroupLable,
                                initialItem: secondGroupValue,
                                hintText: _ponyModel.currentSecondGroupLable,
                                onSavedValue: secondGroupValue,
                              ),
                              CardSettingsButton(
                                label: 'SAVE',
                                onPressed: () {
                                  CustomerRecordsAPI().createCustomerRecord(
                                      CustomerRegistration(
                                    customerName: cusTitleController.text,
                                    customerTitle: cusTitleController.text,
                                    customerAuthorizedName:
                                        cusRepController.text,
                                    userId: 1,
                                    customerSatisfied: isCutomerSastify ? 1 : 0,
                                    adress: adressController.text,
                                    availableProductBrand:
                                        _currentProductBrandController.text,
                                    businessPhone1: int.parse(
                                        _businessPhone1Controller.text),
                                    businessPhone2: int.parse(
                                        _businessPhone2Controller.text),
                                    taxNumber:
                                        int.parse(_taxNumberController.text),
                                    faxNumber:
                                        int.parse(_faxNumberController.text),
                                    gsmNumber:
                                        int.parse(_gsmNumberController.text),
                                    city: _cityController.text,
                                    country: _countryController.text,
                                    currentMainGroup: mainGroupValue.name,
                                    currentSecondGroup: secondGroupValue.name,
                                    customerRepresentative:
                                        cusRepController.text,
                                    customerStatus:
                                        _customerStatusController.text,
                                    district: districtController.text,
                                    email1: _email1Controller.text,
                                    email2: _email2Controller.text,
                                    explanation: _ifNotReasonController.text,
                                    showReference: isShowRefrence ? 1 : 0,
                                    websiteAddress: _websiteController.text,
                                    taxAdministration:
                                        _taxAdministrationController.text,
                                    productQuantity: productQuantity,
                                    isActive: isActive ? 1 : 0,
                                    dealerProbability: probability.toInt(),
                                    franchisePossibility: possibility.toInt(),
                                    registrationDate: DateTime.now(),
                                    createdAt: DateTime.now(),
                                    updatedAt: DateTime.now(),
                                  ));
                                },
                              ),
                            ],
                          )
                        ]),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
