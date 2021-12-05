import 'package:easy_localization/easy_localization.dart';
import 'dart:typed_data';

import 'package:card_settings/card_settings.dart';
import 'package:elfatek/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PonyModel {
  String title = LocaleKeys.customer_title.tr();
  String customerName = LocaleKeys.customer_name.tr();
  String customerRepresentative = LocaleKeys.customer_representative.tr();
  String currentMainGroupLable = LocaleKeys.current_main_group.tr();
  String currentSecondGroupLable = LocaleKeys.current_second_group.tr();
  String adressLabel = LocaleKeys.address.tr();
  String adressValue = '';
  String businessPhone1Label = LocaleKeys.business_phone_1.tr();
  int? businessPhone1Value;
  String businessPhone2Label = LocaleKeys.business_phone_2.tr();
  int? businessPhone2Value;
  String districtLabel = LocaleKeys.district.tr();
  String districtValue = '';
  String faxNumberLabel = LocaleKeys.fax_number.tr();
  int? faxNumberValue;
  String gsmNumberLabel = LocaleKeys.gsm_number.tr();
  int? gsmNumberValue;
  String taxNumberLabel = LocaleKeys.tax_number.tr();
  int? taxNumberValue;
  String isActiveLabel = LocaleKeys.is_it_active.tr();
  bool isActiveValue = false;
  String cityLabel = LocaleKeys.city.tr();
  PickerModel cityValue = citiesItems[1];
  String countryLabel = LocaleKeys.country.tr();
  PickerModel countryValue = countriesItems[0];
  String taxAdministrationLabel = LocaleKeys.tax_administration.tr();
  String taxAdministrationValue = "";
  String websiteLabel = LocaleKeys.website_address.tr();
  String websiteValue = "";
  String email1Label = LocaleKeys.email_1.tr();
  String email1Value = "";
  String email2Label = LocaleKeys.email_2.tr();
  String email2Value = "";
  int age = 7;
  PickerModel currentMainGroup = mainGroupPickers[1]; //TODO: "F";
  String coatColor = 'D19FE4';
  String maneColor = '273873';
  bool hasSpots = false;
  String spotColor = 'FF5198';
  String description =
      'An intelligent and dutiful scholar with an avid love of learning and skill in unicorn magic such as levitation, teleportation, and the creation of force fields.';
  List<String> hobbies = <String>[
    'flying',
    'singing',
    'exploring',
    'hiding',
    'coloring'
  ];
  double height = 3.5;
  int weight = 45;
  PickerModel currentSecondGroupItem =
      currentSecondGroupItems[1]; // TODO: "MG";
  DateTime showDateTime = DateTime(2010, 10, 10, 20, 30);
  double ticketPrice = 65.99;
  int boxOfficePhone = 18005551212;
  String email = 'me@nowhere.org';
  String password = 'secret1';
  double rating = 0.25;
  Uint8List? photo;
  Uint8List video = Uint8List(1024 * 1024 * 15);
  Uint8List audio = Uint8List(1024 * 4);
  Uint8List customFile = Uint8List(4);

  void loadMedia() async {
    photo = (await rootBundle.load('assets/twilight_sparkle.png'))
        .buffer
        .asUint8List();
  }
}

const List<String> allHobbies = <String>[
  'running',
  'flying',
  'coloring',
  'jumping',
  'eating',
  'hiding',
  'exploring',
  'singing',
  'dancing',
  'acting',
  'cleaning',
  'shopping',
  'sewing',
  'cooking',
];

const List<PickerModel> citiesItems = <PickerModel>[
  PickerModel("DÜZCE", code: 'E'),
  PickerModel("OSMANİYE", code: 'E'),
  PickerModel("KİLİS", code: 'E'),
  PickerModel("KARABÜK", code: 'E'),
  PickerModel("YALOVA", code: 'E'),
  PickerModel("IĞDIR", code: 'E'),
  PickerModel("ARDAHAN", code: 'E'),
  PickerModel("BARTIN", code: 'E'),
  PickerModel("ŞIRNAK", code: 'E'),
  PickerModel("BATMAN", code: 'E'),
  PickerModel("KIRIKKALE", code: 'E'),
  PickerModel("KARAMAN", code: 'E'),
  PickerModel("BAYBURT", code: 'E'),
  PickerModel("AKSARAY", code: 'E'),
  PickerModel("ZONGULDAK", code: 'E'),
  PickerModel("YOZGAT", code: 'E'),
  PickerModel("VAN", code: 'E'),
  PickerModel("UŞAK", code: 'E'),
  PickerModel("ŞANLIURFA", code: 'E'),
  PickerModel("TUNCELİ", code: 'E'),
  PickerModel("TRABZON", code: 'E'),
  PickerModel("TOKAT", code: 'E'),
  PickerModel("TEKİRDAĞ", code: 'E'),
  PickerModel("SİVAS", code: 'E'),
  PickerModel("SİNOP", code: 'E'),
  PickerModel("SİİRT", code: 'E'),
  PickerModel("SAMSUN", code: 'E'),
  PickerModel("SAKARYA", code: 'E'),
  PickerModel("RİZE", code: 'E'),
  PickerModel("ORDU", code: 'E'),
  PickerModel("NİĞDE", code: 'E'),
  PickerModel("NEVŞEHİR", code: 'E'),
  PickerModel("MUŞ", code: 'E'),
  PickerModel("MUĞLA", code: 'E'),
  PickerModel("MARDİN", code: 'E'),
  PickerModel("KAHRAMANMARAŞ", code: 'E'),
  PickerModel("MANİSA", code: 'E'),
  PickerModel("MALATYA", code: 'E'),
  PickerModel("KÜTAHYA", code: 'E'),
  PickerModel("KONYA", code: 'E'),
  PickerModel("KOCAELİ", code: 'E'),
  PickerModel("KIRŞEHİR", code: 'E'),
  PickerModel("KIRKLARELİ", code: 'E'),
  PickerModel("KAYSERİ", code: 'E'),
  PickerModel("KASTAMONU", code: 'E'),
  PickerModel("KARS", code: 'E'),
  PickerModel("İZMİR", code: 'E'),
  PickerModel("İSTANBUL", code: 'E'),
  PickerModel("MERSİN(İÇEL)", code: 'E'),
  PickerModel("ISPARTA", code: 'E'),
  PickerModel("HATAY", code: 'E'),
  PickerModel("HAKKARİ", code: 'E'),
  PickerModel("GÜMÜŞHANE", code: 'E'),
  PickerModel("GİRESUN", code: 'E'),
  PickerModel("GAZİANTEP", code: 'E'),
  PickerModel("ESKİŞEHİR", code: 'E'),
  PickerModel("ERZURUM", code: 'E'),
  PickerModel("ERZİNCAN", code: 'E'),
  PickerModel("ELAZIĞ", code: 'E'),
  PickerModel("EDİRNE", code: 'E'),
  PickerModel("DİYARBAKIR", code: 'E'),
  PickerModel("DENİZLİ", code: 'E'),
  PickerModel("ÇORUM", code: 'E'),
  PickerModel("ÇANKIRI", code: 'E'),
  PickerModel("ÇANAKKALE", code: 'E'),
  PickerModel("BURSA", code: 'E'),
  PickerModel("BURDUR", code: 'E'),
  PickerModel("BOLU", code: 'E'),
  PickerModel("BİTLİS", code: 'E'),
  PickerModel("BİNGÖL", code: 'E'),
  PickerModel("BİLECİK", code: 'E'),
  PickerModel("BALIKESİR", code: 'E'),
  PickerModel("AYDIN", code: 'E'),
  PickerModel("ARTVİN", code: 'E'),
  PickerModel("ANTALYA", code: 'E'),
  PickerModel("ANKARA", code: 'E'),
  PickerModel("AMASYA", code: 'E'),
  PickerModel("AĞRI", code: 'E'),
  PickerModel("AFYONKARAHİSAR", code: 'E'),
  PickerModel("ADIYAMAN", code: 'E'),
  PickerModel("ADANA", code: 'E'),
];
const List<PickerModel> mainGroupPickers = <PickerModel>[
  PickerModel('Group 1', code: 'M'),
  PickerModel('Group 2', code: 'F'),
];
const List<PickerModel> countriesItems = <PickerModel>[
  PickerModel('Turkey', code: 'M'),
  PickerModel('Egypt', code: 'F'),
];
const List<PickerModel> currentSecondGroupItems = <PickerModel>[
  PickerModel('Group 1', code: 'MG', icon: Icon(Icons.sort)),
  PickerModel('Group 2', code: 'SC', icon: Icon(Icons.clear_all)),
  PickerModel('Group 3', code: 'SL', icon: Icon(Icons.swap_calls)),
];
