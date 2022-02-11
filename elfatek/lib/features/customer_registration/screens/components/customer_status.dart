import 'package:card_settings/card_settings.dart';
import 'package:elfatek/presentation/base/model.dart';
import 'package:elfatek/presentation/common/card_setting.dart';
import 'package:elfatek/presentation/common/card_setting_section.dart';
import 'package:elfatek/presentation/common/card_textfield.dart';
import 'package:elfatek/presentation/resources/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CustomerStatus extends StatefulWidget {
  final GlobalKey<FormState>? isActiveKey;

  final GlobalKey<FormState>? customerStatusKey;
  final GlobalKey<FormState>? customerRepresentativeKey;
  final TextEditingController? customerStatusController;
  final GlobalKey<FormState>? sliderKey;
  final GlobalKey<FormState>? sliderKey2;
  final GlobalKey<FormState>? dateKey;
  const CustomerStatus(
      {Key? key,
      this.isActiveKey,
      this.customerStatusKey,
      this.customerRepresentativeKey,
      this.customerStatusController,
      this.sliderKey,
      this.sliderKey2,
      this.dateKey})
      : super(key: key);

  @override
  _CustomerStatusState createState() => _CustomerStatusState();
}

class _CustomerStatusState extends State<CustomerStatus> {
  final PonyModel _ponyModel = PonyModel();
  @override
  Widget build(BuildContext context) {
    return CardSettingSectionWidget(children: <CardSettingsSection>[
      CardSettingsSection(
        header: cardSettingsHeader("Customer Status"),
        children: <CardSettingsWidget>[
          buildCardSettingsSwitch(
            key: widget.isActiveKey,
            label: _ponyModel.isActiveLabel,
            initialValue: false,
            // onChanged: (p0) => isActive = p0,
          ),
          buildCardSettingsTextDefault(
              key: widget.customerStatusKey,
              controller: widget.customerStatusController,
              hintText: LocaleKeys.customer_status.tr(),
              label: LocaleKeys.customer_status.tr(),
              inputAction: TextInputAction.next,
              // inputActionNode: widget.taxNumberNode2,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsTextDefault(
              key: widget.customerRepresentativeKey,
              hintText: LocaleKeys.customer_representative.tr(),
              label: LocaleKeys.customer_representative.tr(),
              inputAction: TextInputAction.next,
              // inputActionNode: widget.taxNumberNode2,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsSlider(
            key: widget.sliderKey,
            label: LocaleKeys.possibility.tr(),
            initialValue: _ponyModel.rating,
          ),
          // CardSettingsSlider(
          //   key: widget.sliderKey,
          //   label: LocaleKeys.possibility.tr(),
          //   divisions: 4,
          //   min: 0,
          //   max: 100,
          //   initialValue: _ponyModel.rating,
          //   autovalidateMode: autoValidateMode,
          //   validator: (double? value) {
          //     if (value == null) return 'You must pick a rating.';
          //     return null;
          //   },
          //   onSaved: (value) => possibility = value!,
          //   onChanged: (value) => possibility = value,
          //   visible: true,
          //   fieldPadding:
          //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // ),
          buildCardSettingsSlider(
            key: widget.sliderKey2,
            label: LocaleKeys.dealer_probability.tr(),
            initialValue: _ponyModel.rating,
          ),
          // CardSettingsSlider(
          //   key: widget.sliderKey2,
          //   label: LocaleKeys.dealer_probability.tr(),
          //   divisions: 4,
          //   min: 0,
          //   max: 100,
          //   initialValue: _ponyModel.rating,
          //   autovalidateMode: autoValidateMode,
          //   validator: (double? value) {
          //     if (value == null) return 'You must pick a rating.';
          //     return null;
          //   },
          //   onSaved: (value) => probability = value!,
          //   onChanged: (value) => probability = value,
          //   visible: true,
          //   fieldPadding:
          //       const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          // ),
          buildCardSettingsDatePicker(
            key: widget.dateKey,
            label: LocaleKeys.do_not_get_registered.tr(),
            initialValue: _ponyModel.showDateTime,
          ),
          // CardSettingsDatePicker(
          //   key: widget.dateKey,
          //   icon: const Icon(Icons.calendar_today),
          //   label: LocaleKeys.do_not_get_registered.tr(),
          //   dateFormat: DateFormat.yMMMMd(),
          //   initialValue: _ponyModel.showDateTime,
          //   onSaved: (value) => _ponyModel.showDateTime =
          //       updateJustDate(value!, _ponyModel.showDateTime),
          //   onChanged: (value) {},
          // ),
        ],
      )
    ]);
  }
}
