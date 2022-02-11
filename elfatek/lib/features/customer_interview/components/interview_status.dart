import 'package:card_settings/card_settings.dart';
import 'package:elfatek/presentation/base/model.dart';
import 'package:elfatek/presentation/common/card_setting.dart';
import 'package:elfatek/presentation/common/card_setting_section.dart';
import 'package:elfatek/presentation/common/card_textfield.dart';
import 'package:elfatek/presentation/resources/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class InterviewStatusSection extends StatefulWidget {
  final GlobalKey<FormState>? isOfferMadeKey;
  final GlobalKey<FormState>? customerRepresentativeKey;
  final GlobalKey<FormState>? explanationKey;
  final GlobalKey<FormState>? discussionSubjectKey;
  final TextEditingController? customerRepresentativeController;
  final TextEditingController? discussionSubjectController;
  final TextEditingController? interviewContentController;
  final TextEditingController? explanationController;
  final GlobalKey<FormState>? interviewContentKey;

  final GlobalKey<FormState>? interviewStatusKey;
  final FocusNode? taxNumberNode;
  final void Function()? onPressed;
  final FocusNode? addressNode;
  const InterviewStatusSection({
    Key? key,
    this.isOfferMadeKey,
    this.customerRepresentativeKey,
    this.explanationKey,
    this.discussionSubjectKey,
    this.interviewContentKey,
    this.interviewStatusKey,
    this.addressNode,
    this.taxNumberNode,
    this.onPressed,
    this.customerRepresentativeController,
    this.discussionSubjectController,
    this.interviewContentController,
    this.explanationController,
  }) : super(key: key);

  @override
  State<InterviewStatusSection> createState() => _InterviewStatusSectionState();
}

class _InterviewStatusSectionState extends State<InterviewStatusSection> {
  final PonyModel _ponyModel = PonyModel();
  // TextEditingController adressController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CardSettingSectionWidget(children: <CardSettingsSection>[
      CardSettingsSection(
        header: cardSettingsHeader('Interview Details'),
        children: <CardSettingsWidget>[
          buildCardSettingsTextDefault(
              key: widget.customerRepresentativeKey,
              controller: widget.customerRepresentativeController,
              // focusNode: _taxAdministrationNode,
              // onSavedValue: _ponyModel.taxAdministrationValue,
              hintText: LocaleKeys.customer_representative.tr(),
              label: LocaleKeys.customer_representative.tr(),
              inputAction: TextInputAction.next,
              inputActionNode: widget.taxNumberNode,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsTextDefault(
              key: widget.discussionSubjectKey,
              controller: widget.discussionSubjectController,
              // focusNode: _taxAdministrationNode,
              // onSavedValue: _ponyModel.taxAdministrationValue,
              hintText: "Discussion Subject",
              label: "Discussion Subject",
              inputAction: TextInputAction.next,
              inputActionNode: widget.taxNumberNode,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsTextDefault(
              key: widget.interviewContentKey,
              controller: widget.interviewContentController,
              // focusNode: _taxAdministrationNode,
              // onSavedValue: _ponyModel.taxAdministrationValue,
              hintText: "Interview Content",
              label: "Interview Content",
              inputAction: TextInputAction.next,
              inputActionNode: widget.taxNumberNode,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsSwitch(
            key: widget.isOfferMadeKey,
            //onChanged: ,
            label: "Offer Made",
            // onSavedValue: _ponyModel.isShowRefValue,
            initialValue: _ponyModel.isShowRefValue,
          ),
          buildCardSettingsRadioPicker(
            //onChanged: ,
            key: widget.interviewStatusKey,
            items: interviewStatusItems,
            label: "Interview Status",
            onSavedValue: _ponyModel.interviewStatusItem,
            hintText: "Interview Status",
            initialItem: _ponyModel.interviewStatusItem,
          ),
          buildCardSettingsParagraph(
            key: widget.explanationKey,
            controller: widget.explanationController,
            focusNode: widget.addressNode,
            label: "Explanation",
            hintText: "Explanation",
            // onSavedValue: _ponyModel.adressValue,
            lines: 2,
          ),
          CardSettingsButton(
            label: 'SAVE',
            onPressed: widget.onPressed!,
          ),
        ],
      )
    ]);
  }
}
