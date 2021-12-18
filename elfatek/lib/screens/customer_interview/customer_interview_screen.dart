import 'package:card_settings/card_settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/constants.dart';
import 'package:elfatek/translations/locale_keys.g.dart';
import 'package:elfatek/utils/widgets/card_sett_text.dart';

import 'components/body.dart';
import 'package:flutter/material.dart';

class CustomerInterviewScreen extends StatefulWidget {
  static String routeName = "/customer_interview";

  const CustomerInterviewScreen({Key? key}) : super(key: key);

  @override
  State<CustomerInterviewScreen> createState() =>
      _CustomerInterviewScreenState();
}

class _CustomerInterviewScreenState extends State<CustomerInterviewScreen> {
  final GlobalKey<FormState> _isActiveKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _isShowRefKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _isCustomerSastifiedKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _customerStatusKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _customerRepresentativeKey =
      GlobalKey<FormState>();

  final GlobalKey<FormState> _sliderKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _nextInterviewKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _dateKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _currentProductBrandKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _addressKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _datetimeKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _customerTitleKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _discussionSubjectKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _interviewContentKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _mainGroupKey = GlobalKey<FormState>();

  final FocusNode _addressNode = FocusNode();

  final FocusNode _gsmNumberNode = FocusNode();

  final FocusNode _websiteNode = FocusNode();

  final FocusNode _email1Node = FocusNode();

  final FocusNode _email2Node = FocusNode();

  final FocusNode _taxNumberNode = FocusNode();

  final FocusNode _taxAdministrationNode = FocusNode();

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
        divider: const Divider(
          color: Colors.grey,
          thickness: .5,
        ),
        // fieldPadding: EdgeInsets.all(10),
        children: <CardSettingsSection>[
          CardSettingsSection(
            header: CardSettingsHeader(
              label: "Customer Interview",
            ),
            children: <CardSettingsWidget>[
              buildCardSettingsTextDefault(
                  key: _customerStatusKey,
                  // focusNode: _taxAdministrationNode,
                  onSavedValue: _ponyModel.taxAdministrationValue,
                  hintText: LocaleKeys.customer_title.tr(),
                  label: LocaleKeys.customer_title.tr(),
                  inputAction: TextInputAction.next,
                  inputActionNode: _taxNumberNode,
                  initialValue: _ponyModel.taxAdministrationValue),
              buildCardSettingsTextDefault(
                  key: _customerTitleKey,
                  // focusNode: _taxAdministrationNode,
                  onSavedValue: _ponyModel.taxAdministrationValue,
                  hintText: LocaleKeys.customer_name.tr(),
                  label: LocaleKeys.customer_name.tr(),
                  inputAction: TextInputAction.next,
                  inputActionNode: _taxNumberNode,
                  initialValue: _ponyModel.taxAdministrationValue),
              CardSettingsDatePicker(
                key: _dateKey,
                icon: const Icon(Icons.calendar_today),
                label: "Interview Date",
                dateFormat: DateFormat.yMMMMd(),
                initialValue: _ponyModel.showDateTime,
                onSaved: (value) => _ponyModel.showDateTime =
                    updateJustDate(value!, _ponyModel.showDateTime),
                onChanged: (value) {},
              ),
              CardSettingsTimePicker(
                key: _datetimeKey,
                icon: Icon(Icons.access_time),
                label: 'Time',
                initialValue: TimeOfDay(
                    hour: _ponyModel.showDateTime.hour,
                    minute: _ponyModel.showDateTime.minute),
                onSaved: (value) => _ponyModel.showDateTime =
                    updateJustTime(value!, _ponyModel.showDateTime),
                onChanged: (value) {
                  setState(() {
                    _ponyModel.showDateTime =
                        updateJustTime(value, _ponyModel.showDateTime);
                  });
                },
              ),
              CardSettingsDatePicker(
                key: _nextInterviewKey,
                icon: const Icon(Icons.calendar_today),
                label: "Next Interview Date",
                dateFormat: DateFormat.yMMMMd(),
                initialValue: _ponyModel.showDateTime,
                onSaved: (value) => _ponyModel.showDateTime =
                    updateJustDate(value!, _ponyModel.showDateTime),
                onChanged: (value) {},
              ),
              buildCardSettingsTextDefault(
                  key: _customerRepresentativeKey,
                  // focusNode: _taxAdministrationNode,
                  onSavedValue: _ponyModel.taxAdministrationValue,
                  hintText: LocaleKeys.customer_representative.tr(),
                  label: LocaleKeys.customer_representative.tr(),
                  inputAction: TextInputAction.next,
                  inputActionNode: _taxNumberNode,
                  initialValue: _ponyModel.taxAdministrationValue),
              buildCardSettingsTextDefault(
                  key: _discussionSubjectKey,
                  // focusNode: _taxAdministrationNode,
                  onSavedValue: _ponyModel.taxAdministrationValue,
                  hintText: "Discussion Subject",
                  label: "Discussion Subject",
                  inputAction: TextInputAction.next,
                  inputActionNode: _taxNumberNode,
                  initialValue: _ponyModel.taxAdministrationValue),
              buildCardSettingsTextDefault(
                  key: _interviewContentKey,
                  // focusNode: _taxAdministrationNode,
                  onSavedValue: _ponyModel.taxAdministrationValue,
                  hintText: "Interview Content",
                  label: "Interview Content",
                  inputAction: TextInputAction.next,
                  inputActionNode: _taxNumberNode,
                  initialValue: _ponyModel.taxAdministrationValue),
              buildCardSettingsSwitch(
                key: _isShowRefKey,
                label: "Offer Made",
                onSavedValue: _ponyModel.isShowRefValue,
                initialValue: _ponyModel.isShowRefValue,
              ),
              buildCardSettingsRadioPicker(
                key: _mainGroupKey,
                items: interviewStatusItems,
                label: "Interview Status",
                onSavedValue: _ponyModel.interviewStatusItem,
                hintText: "Interview Status",
                initialItem: _ponyModel.interviewStatusItem,
              ),
              buildCardSettingsParagraph(
                key: _addressKey,
                focusNode: _addressNode,
                label: "Explanation",
                hintText: "Explanation",
                onSavedValue: _ponyModel.adressValue,
                lines: 2,
              ),
            ],
          )
        ]);
  }
}
