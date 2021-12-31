// import 'package:card_settings/card_settings.dart';
// import '../../../card/plumbing/model.dart';
// import '../../../constants.dart';
// import '../../../translations/locale_keys.g.dart';
// import '../../../utils/widgets/card_sett_text.dart';
// import 'package:flutter/material.dart';
// import 'package:easy_localization/easy_localization.dart';

// class CustomerStatus extends StatefulWidget {
//   const CustomerStatus({Key? key}) : super(key: key);

//   @override
//   _CustomerStatusState createState() => _CustomerStatusState();
// }

// class _CustomerStatusState extends State<CustomerStatus> {
//   final GlobalKey<FormState> _isActiveKey = GlobalKey<FormState>();

//   final GlobalKey<FormState> _customerStatusKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> _customerRepresentativeKey =
//       GlobalKey<FormState>();

//   final GlobalKey<FormState> _sliderKey = GlobalKey<FormState>();
//   final GlobalKey<FormState> _sliderKey2 = GlobalKey<FormState>();
//   final GlobalKey<FormState> _dateKey = GlobalKey<FormState>();

//   final FocusNode _taxNumberNode = FocusNode();

//   final PonyModel _ponyModel = PonyModel();
//   @override
//   Widget build(BuildContext context) {
//     return CardSettings.sectioned(
//         shrinkWrap: true,
//         showMaterialonIOS: true,
//         scrollable: true,
//         labelWidth: 150,
//         contentAlign: TextAlign.right,
//         cardless: false,
//         cardElevation: 10,
//         divider: const Divider(
//           color: Colors.grey,
//           thickness: .5,
//         ),
//         // fieldPadding: EdgeInsets.all(10),
//         children: <CardSettingsSection>[
//           CardSettingsSection(
//             header: CardSettingsHeader(
//               label: "Customer Status",
//             ),
//             children: <CardSettingsWidget>[
//               buildCardSettingsSwitch(
//                 key: _isActiveKey,
//                 label: _ponyModel.isActiveLabel,
//                 onSavedValue: _ponyModel.isActiveValue,
//                 initialValue: _ponyModel.isActiveValue,
//               ),
//               buildCardSettingsTextDefault(
//                   key: _customerStatusKey,
//                   // focusNode: _taxAdministrationNode,
//                   onSavedValue: _ponyModel.taxAdministrationValue,
//                   hintText: LocaleKeys.customer_status.tr(),
//                   label: LocaleKeys.customer_status.tr(),
//                   inputAction: TextInputAction.next,
//                   inputActionNode: _taxNumberNode,
//                   initialValue: _ponyModel.taxAdministrationValue),
//               buildCardSettingsTextDefault(
//                   key: _customerRepresentativeKey,
//                   // focusNode: _taxAdministrationNode,
//                   onSavedValue: _ponyModel.taxAdministrationValue,
//                   hintText: LocaleKeys.customer_representative.tr(),
//                   label: LocaleKeys.customer_representative.tr(),
//                   inputAction: TextInputAction.next,
//                   inputActionNode: _taxNumberNode,
//                   initialValue: _ponyModel.taxAdministrationValue),
//               CardSettingsSlider(
//                 key: _sliderKey,
//                 label: LocaleKeys.possibility.tr(),
//                 divisions: 4,
//                 min: 0,
//                 max: 100,
//                 initialValue: _ponyModel.rating,
//                 autovalidateMode: autoValidateMode,
//                 validator: (double? value) {
//                   if (value == null) return 'You must pick a rating.';
//                   return null;
//                 },
//                 onSaved: (value) => _ponyModel.rating = value!,
//                 onChanged: (value) {},
//                 visible: true,
//                 fieldPadding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               ),
//               CardSettingsSlider(
//                 key: _sliderKey2,
//                 label: LocaleKeys.dealer_probability.tr(),
//                 divisions: 4,
//                 min: 0,
//                 max: 100,
//                 initialValue: _ponyModel.rating,
//                 autovalidateMode: autoValidateMode,
//                 validator: (double? value) {
//                   if (value == null) return 'You must pick a rating.';
//                   return null;
//                 },
//                 onSaved: (value) => _ponyModel.rating = value!,
//                 onChanged: (value) {},
//                 visible: true,
//                 fieldPadding:
//                     const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               ),
//               CardSettingsDatePicker(
//                 key: _dateKey,
//                 icon: const Icon(Icons.calendar_today),
//                 label: LocaleKeys.do_not_get_registered.tr(),
//                 dateFormat: DateFormat.yMMMMd(),
//                 initialValue: _ponyModel.showDateTime,
//                 onSaved: (value) => _ponyModel.showDateTime =
//                     updateJustDate(value!, _ponyModel.showDateTime),
//                 onChanged: (value) {},
//               ),
//             ],
//           )
//         ]);
//   }
// }
