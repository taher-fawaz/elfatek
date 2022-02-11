import 'package:card_settings/card_settings.dart';
import 'package:elfatek/presentation/base/model.dart';
import 'package:elfatek/presentation/common/card_setting.dart';
import 'package:elfatek/presentation/common/card_setting_section.dart';
import 'package:elfatek/presentation/common/card_textfield.dart';
import 'package:elfatek/presentation/resources/translations/locale_keys.g.dart';

import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class CustomerProductSection extends StatefulWidget {
  final TextEditingController? currentProductBrandController;
  final GlobalKey<FormState>? isShowRefKey;
  final void Function()? onPressed;
  final void Function(bool)? onChangedisShowRefrence;
  final GlobalKey<FormState>? currentProductBrandKey;
  final GlobalKey<FormState>? currentProductQuantityKey;
  final GlobalKey<FormState>? mainGroupKey;
  final GlobalKey<FormState>? secondGroupKey;
  const CustomerProductSection(
      {Key? key,
      this.isShowRefKey,
      this.currentProductBrandKey,
      this.currentProductQuantityKey,
      this.mainGroupKey,
      this.secondGroupKey,
      this.currentProductBrandController,
      this.onPressed,
      this.onChangedisShowRefrence})
      : super(key: key);

  @override
  _CustomerProductSectionState createState() => _CustomerProductSectionState();
}

class _CustomerProductSectionState extends State<CustomerProductSection> {
  final FocusNode _taxNumberNode3 = FocusNode();

  final PonyModel _ponyModel = PonyModel();
  PickerModel mainGroupValue = const PickerModel('Group 1', code: 'a');
  PickerModel secondGroupValue = const PickerModel('Group 1', code: 'a');
  @override
  Widget build(BuildContext context) {
    return CardSettingSectionWidget(children: <CardSettingsSection>[
      CardSettingsSection(
        header: cardSettingsHeader('Customer Product Details'),
        children: <CardSettingsWidget>[
          buildCardSettingsTextDefault(
              key: widget.currentProductBrandKey,
              controller: widget.currentProductBrandController,
              hintText: LocaleKeys.current_product_brand.tr(),
              label: LocaleKeys.current_product_brand.tr(),
              inputAction: TextInputAction.next,
              inputActionNode: _taxNumberNode3,
              initialValue: _ponyModel.taxAdministrationValue),
          CardSettingsNumberPicker(
            key: widget.currentProductQuantityKey,
            label: LocaleKeys.current_product_quantity.tr(),
            labelAlign: TextAlign.center,
            initialValue: 3,
            min: 1,
            max: 1000,
            stepInterval: 2,
            onChanged: (value) {},
          ),
          buildCardSettingsSwitch(
            key: widget.isShowRefKey,
            label: LocaleKeys.show_reference.tr(),
            initialValue: false,
            onChanged: widget.onChangedisShowRefrence,
          ),
          buildCardSettingsRadioPicker(
            key: widget.mainGroupKey,
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
            key: widget.secondGroupKey,
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
            onPressed: widget.onPressed!,
          ),
        ],
      )
    ]);
  }
}
