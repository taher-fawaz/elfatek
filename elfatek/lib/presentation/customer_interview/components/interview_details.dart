import 'package:card_settings/card_settings.dart';
import '../../base/model.dart';
import '../../common/card_setting.dart';
import '../../common/card_setting_section.dart';
import '../../common/card_textfield.dart';
import '../../resources/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class InterviewDetailsSection extends StatefulWidget {
  final TextEditingController? customerNameController;
  final TextEditingController? customerTitleController;
  DateTime? nextInterviewDate;
  DateTime? interviewDate;
  TimeOfDay? datetime;
  final GlobalKey<FormState>? customerNameKey;
  final GlobalKey<FormState>? nextInterviewKey;

  final GlobalKey<FormState>? dateKey;

  final GlobalKey<FormState>? datetimeKey;
  final FocusNode? taxNumberNode;

  final GlobalKey<FormState>? customerTitleKey;
  InterviewDetailsSection({
    Key? key,
    this.customerNameKey,
    this.nextInterviewKey,
    this.dateKey,
    this.datetimeKey,
    this.taxNumberNode,
    this.customerTitleKey,
    this.customerNameController,
    this.customerTitleController,
    this.nextInterviewDate,
    this.interviewDate,
    this.datetime,
  }) : super(key: key);

  @override
  State<InterviewDetailsSection> createState() =>
      _InterviewDetailsSectionState();
}

class _InterviewDetailsSectionState extends State<InterviewDetailsSection> {
  final PonyModel _ponyModel = PonyModel();
  // TextEditingController adressController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CardSettingSectionWidget(children: <CardSettingsSection>[
      CardSettingsSection(
        header: cardSettingsHeader('Interview Details'),
        children: <CardSettingsWidget>[
          buildCardSettingsTextDefault(
              controller: widget.customerTitleController,
              key: widget.customerTitleKey,
              // focusNode: _taxAdministrationNode,
              // onSavedValue: _ponyModel.taxAdministrationValue,
              hintText: LocaleKeys.customer_title.tr(),
              label: LocaleKeys.customer_title.tr(),
              inputAction: TextInputAction.next,
              inputActionNode: widget.taxNumberNode,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsTextDefault(
              controller: widget.customerNameController,
              key: widget.customerNameKey,
              // focusNode: _taxAdministrationNode,
              // onSavedValue: _ponyModel.taxAdministrationValue,
              hintText: LocaleKeys.customer_name.tr(),
              label: LocaleKeys.customer_name.tr(),
              inputAction: TextInputAction.next,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsDatePicker(
              onChanged: (p0) => widget.interviewDate = p0,
              key: widget.dateKey,
              label: "Interview Date",
              initialValue: _ponyModel.showDateTime),
          cardSettingsTimePicker(
              key: widget.datetimeKey,
              onChanged: (p0) => TimeOfDay(hour: p0.hour, minute: p0.minute),
              label: 'Time',
              initialValue: TimeOfDay(
                  hour: _ponyModel.showDateTime.hour,
                  minute: _ponyModel.showDateTime.minute)),
          buildCardSettingsDatePicker(
              onChanged: (p0) => widget.nextInterviewDate = p0,
              key: widget.nextInterviewKey,
              label: "Next Interview Date",
              initialValue: _ponyModel.showDateTime),
        ],
      )
    ]);
  }
}
