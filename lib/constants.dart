import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'size_config.dart';

const String accessToken = 'token';
const String showSplash = 'showSplash';

const kPrimaryColorLight = Color(0xFFFF7643);
const kPrimaryLightColorLight = Color(0xFFFFECDF);
const kPrimaryGradientColorLight = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColorLight = Color(0xFF979797);
const kTextColorLight = Color(0xFF757575);

final kPrimaryColorDark = HexColor("#141630");
final kSecondryLigthColorDark = HexColor("#A5A2B2");
final kPrimaryLightColorDark = HexColor("#313454");
final LinearGradient kPrimaryGradientColorDark = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [HexColor("#313454"), HexColor("#0A0A11")],
);
final kSecondaryColorDark = HexColor("#16D950");
const kTextColorDark = Colors.white;
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kNameNullError = "Please Enter your name";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColorLight),
  );
}

InputDecoration inputDecorationStyle(String labelText) {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30),
    borderSide: const BorderSide(color: kTextColorLight),
    gapPadding: 0,
  );
  return InputDecoration(
    labelText: labelText,
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.only(left: 22, right: 22, bottom: 10),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

const AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

const List<String> turkishCities = [
  "DÜZCE",
  "OSMANİYE",
  "KİLİS",
  "KARABÜK",
  "YALOVA",
  "IĞDIR",
  "ARDAHAN",
  "BARTIN",
  "ŞIRNAK",
  "BATMAN",
  "KIRIKKALE",
  "KARAMAN",
  "BAYBURT",
  "AKSARAY",
  "ZONGULDAK",
  "YOZGAT",
  "VAN",
  "UŞAK",
  "ŞANLIURFA",
  "TUNCELİ",
  "TRABZON",
  "TOKAT",
  "TEKİRDAĞ",
  "SİVAS",
  "SİNOP",
  "SİİRT",
  "SAMSUN",
  "SAKARYA",
  "RİZE",
  "ORDU",
  "NİĞDE",
  "NEVŞEHİR",
  "MUŞ",
  "MUĞLA",
  "MARDİN",
  "KAHRAMANMARAŞ",
  "MANİSA",
  "MALATYA",
  "KÜTAHYA",
  "KONYA",
  "KOCAELİ",
  "KIRŞEHİR",
  "KIRKLARELİ",
  "KAYSERİ",
  "KASTAMONU",
  "KARS",
  "İZMİR",
  "İSTANBUL",
  "MERSİN(İÇEL)",
  "ISPARTA",
  "HATAY",
  "HAKKARİ",
  "GÜMÜŞHANE",
  "GİRESUN",
  "GAZİANTEP",
  "ESKİŞEHİR",
  "ERZURUM",
  "ERZİNCAN",
  "ELAZIĞ",
  "EDİRNE",
  "DİYARBAKIR",
  "DENİZLİ",
  "ÇORUM",
  "ÇANKIRI",
  "ÇANAKKALE",
  "BURSA",
  "BURDUR",
  "BOLU",
  "BİTLİS",
  "BİNGÖL",
  "BİLECİK",
  "BALIKESİR",
  "AYDIN",
  "ARTVİN",
  "ANTALYA",
  "ANKARA",
  "AMASYA",
  "AĞRI",
  "AFYONKARAHİSAR",
  "ADIYAMAN",
  "ADANA"
];