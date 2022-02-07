import 'package:card_settings/card_settings.dart';
import 'package:elfatek/app/app_prefs.dart';
import '../../features/auth/providers/auth_provider.dart';
import '../../domain/controller/services/api/customer_record_api.dart';
import 'package:provider/provider.dart';
import '../../features/customer_registration/domain/models/customer_registration.dart';
import '../base/model.dart';
import '../common/card_textfield.dart';
import '../common/card_setting.dart';
import 'components/customer_contacts.dart';
import 'components/customer_details.dart';
import 'components/customer_product_details.dart';
import 'components/customer_status.dart';
import '../resources/color_manager.dart';
import '../resources/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class CustomerRegistrationScreen extends StatefulWidget {
  static String routeName = "/customer_registration";
  const CustomerRegistrationScreen({Key? key, onPressed}) : super(key: key);

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
  final TextEditingController countryController = TextEditingController();

  final TextEditingController currentProductBrandController =
      TextEditingController();
  final TextEditingController ifNotReasonController = TextEditingController();
  final TextEditingController businessPhone1Controller =
      TextEditingController();
  final TextEditingController businessPhone2Controller =
      TextEditingController();
  final TextEditingController faxNumberController = TextEditingController();

  final TextEditingController taxAdministrationController =
      TextEditingController();
  final TextEditingController gsmNumberController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController email1Controller = TextEditingController();
  final TextEditingController email2Controller = TextEditingController();
  final TextEditingController taxNumberController = TextEditingController();

  final TextEditingController customerStatusController =
      TextEditingController();

  final GlobalKey<FormState> _mainGroupKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _secondGroupKey = GlobalKey<FormState>();

  CustomerRegistrationModel customerRegistration = CustomerRegistrationModel(
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
  String cityValue = '';
  String countryValue = '';
  func() async {
    String _appPreferences = await AppPreferences.instance.getUserToken();
    print('Hello ${_appPreferences}');
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<AuthProvider>(context).user;
    func();
    TabController controller =
        TabController(length: 4, vsync: this, initialIndex: pageIndex);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: AppBar(
            // leading: IconButton(
            //     onPressed: () {
            //       _formKey.currentState!.save();
            //     },
            //     icon: Icon(Icons.ac_unit)),
            elevation: 0,
            bottom: TabBar(
              enableFeedback: true,
              labelColor: Colors.white,
              indicatorColor: ColorManager.primary,
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
              //? Details Section

              Visibility(
                  visible: pageIndex == 0 ? true : false,
                  child: Expanded(
                      child: CustomerDetailsSection(
                    addressKey: _addressKey,
                    adressController: adressController,
                    cusTitleController: cusTitleController,
                    cityKey: _cityKey,
                    cityValue: cityValue,
                    countryKey: _countryKey,
                    countryValue: countryValue,
                    cusRepController: cusRepController,
                    cusnameController: cusnameController,
                    districtController: districtController,
                    districtKey: _districtKey,
                    isCustomerSastifiedKey: _isCustomerSastifiedKey,
                    nameKey: _nameKey,
                    representativeKey: _representativeKey,
                    titleKey: _titleKey,
                  ))),

              //? Contacts Section

              Visibility(
                  visible: pageIndex == 1 ? true : false,
                  child: Expanded(
                      child: CustomerContactsSection(
                    businessPhone1Controller: businessPhone1Controller,
                    businessPhone1Key: _businessPhone1Key,
                    businessPhone2Controller: businessPhone2Controller,
                    businessPhone2Key: _businessPhone2Key,
                    email1Controller: email1Controller,
                    email2Controller: email2Controller,
                    email1Key: _email1Key,
                    email2Key: _email2Key,
                    faxNumberController: faxNumberController,
                    faxNumberKey: _faxNumberKey,
                    gsmNumberController: gsmNumberController,
                    gsmNumberKey: _gsmNumberKey,
                    taxNumberKey: _taxNumberKey,
                    taxAdministrationController: taxAdministrationController,
                    taxAdministrationKey: _taxAdministrationKey,
                    taxNumberController: taxNumberController,
                    websiteController: websiteController,
                    websiteKey: _websiteKey,
                  ))),

              //? Status Section

              Visibility(
                  visible: pageIndex == 2 ? true : false,
                  child: Expanded(
                      child: CustomerStatus(
                    customerRepresentativeKey: _customerRepresentativeKey,
                    customerStatusController: customerStatusController,
                    customerStatusKey: _customerStatusKey,
                    dateKey: _dateKey,
                    isActiveKey: _isActiveKey,
                    sliderKey2: _sliderKey2,
                    sliderKey: _sliderKey,
                  ))),

              //? Product Details Section

              Visibility(
                  visible: pageIndex == 3 ? true : false,
                  child: Expanded(
                      child: CustomerProductSection(
                    currentProductBrandController:
                        currentProductBrandController,
                    currentProductBrandKey: _currentProductBrandKey,
                    currentProductQuantityKey: _currentProductQuantityKey,
                    isShowRefKey: _isShowRefKey,
                    mainGroupKey: _mainGroupKey,
                    secondGroupKey: _secondGroupKey,
                    onChangedisShowRefrence: (val) => isShowRefrence = val,
                    onPressed: () async {
                      // _formKey.currentState!.save();
                      // print(cusTitleController.text);
                      // print(_currentProductBrandController.text);

                      // if (_formKey.currentState!.validate()) {
                      //   _formKey.currentState!.save();
                      //   print('object2 ${_formKey.currentState!}');
                      // }
                      await CustomerRecordsAPI()
                          .createCustomerRecord(CustomerRegistrationModel(
                        customerName: cusTitleController.text,
                        customerTitle: cusTitleController.text,
                        customerAuthorizedName: cusRepController.text,
                        // userId: userProvider.id,
                        customerSatisfied: isCutomerSastify ? 1 : 0,
                        adress: adressController.text,
                        availableProductBrand:
                            currentProductBrandController.text,
                        businessPhone1: 1,
                        // int.parse(_businessPhone1Controller.text),
                        businessPhone2: 2,
                        // int.parse(_businessPhone2Controller.text),
                        taxNumber: 1,
                        // int.parse(_taxNumberController.text),
                        faxNumber: 1,
                        // int.parse(_faxNumberController.text),
                        gsmNumber: 1,
                        // int.parse(_gsmNumberController.text),
                        city: cityController.text,
                        country: countryController.text,
                        currentMainGroup:
                            PickerModel('Group 1', code: 'M').name,
                        currentSecondGroup:
                            PickerModel('Group 1', code: 'M').name,
                        customerRepresentative: cusRepController.text,
                        customerStatus: customerStatusController.text,
                        district: districtController.text,
                        email1: email1Controller.text,
                        email2: email2Controller.text,
                        explanation: ifNotReasonController.text,
                        showReference: isShowRefrence ? 1 : 0,
                        websiteAddress: websiteController.text,
                        taxAdministration: taxAdministrationController.text,
                        productQuantity: productQuantity,
                        isActive: isActive ? 1 : 0,
                        dealerProbability: probability.toInt(),
                        franchisePossibility: possibility.toInt(),
                        registrationDate: DateTime.now(),
                        createdAt: DateTime.now(),
                        updatedAt: DateTime.now(),
                      ))
                          .then((value) {
                        cusTitleController.clear();
                        countryController.clear();
                        cityController.clear();
                        currentProductBrandController.clear();
                        cusRepController.clear();
                        cusTitleController.clear();
                        cusnameController.clear();
                        customerStatusController.clear();
                        adressController.clear();
                        businessPhone2Controller.clear();
                        businessPhone1Controller.clear();
                        taxNumberController.clear();
                        faxNumberController.clear();
                        gsmNumberController.clear();
                        districtController.clear();
                        email1Controller.clear();
                        email2Controller.clear();
                        ifNotReasonController.clear();
                        websiteController.clear();
                        taxAdministrationController.clear();
                      });
                    },
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
