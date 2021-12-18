import 'package:card_settings/card_settings.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/utils/widgets/card_sett_text.dart';
import 'package:flutter/material.dart';

import 'package:elfatek/translations/locale_keys.g.dart';

import 'package:easy_localization/easy_localization.dart';

class CustomerProductSection extends StatefulWidget {
  const CustomerProductSection({Key? key}) : super(key: key);

  @override
  _CustomerProductSectionState createState() => _CustomerProductSectionState();
}

class _CustomerProductSectionState extends State<CustomerProductSection> {
  final GlobalKey<FormState> _isShowRefKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _isCustomerSastifiedKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _currentProductBrandKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _currentProductQuantityKey =
      GlobalKey<FormState>();

  final FocusNode _taxNumberNode = FocusNode();

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
                  // focusNode: _taxAdministrationNode,
                  onSavedValue: _ponyModel.taxAdministrationValue,
                  hintText: LocaleKeys.current_product_brand.tr(),
                  label: LocaleKeys.current_product_brand.tr(),
                  inputAction: TextInputAction.next,
                  inputActionNode: _taxNumberNode,
                  initialValue: _ponyModel.taxAdministrationValue),
              CardSettingsNumberPicker(
                key: _currentProductQuantityKey,
                label: LocaleKeys.current_product_quantity.tr(),
                labelAlign: TextAlign.center,
                initialValue: _ponyModel.age,
                min: 1,
                max: 1000,
                stepInterval: 2,
                validator: (value) {
                  if (value == null) return 'Age is required.';
                  if (value > 20) return 'No grown-ups allwed!';
                  if (value < 3) return 'No Toddlers allowed!';
                  return null;
                },
                onSaved: (value) => _ponyModel.age = value!,
                onChanged: (value) {},
              ),
              buildCardSettingsSwitch(
                key: _isShowRefKey,
                label: LocaleKeys.show_reference.tr(),
                onSavedValue: _ponyModel.isShowRefValue,
                initialValue: _ponyModel.isShowRefValue,
              ),
              buildCardSettingsSwitch(
                key: _isCustomerSastifiedKey,
                label: LocaleKeys.customer_satisfied.tr(),
                onSavedValue: _ponyModel.isCustomerSastified,
                initialValue: _ponyModel.isCustomerSastified,
                onChanged: (p0) {
                  setState(() {
                    _ponyModel.isCustomerSastified =
                        !_ponyModel.isCustomerSastified;
                  });
                },
              ),
              CardSettingsText(
                label: LocaleKeys.If_not_reason.tr(),
                hintText: LocaleKeys.If_not_reason.tr(),
                enabled: _ponyModel.isCustomerSastified,
              ),
            ],
          )
        ]);
  }
}
