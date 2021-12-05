import 'package:card_settings/card_settings.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/utils/widgets/card_sett_text.dart';
import 'package:flutter/material.dart';

class CustomerDetailsSection extends StatefulWidget {
  const CustomerDetailsSection({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsSection> createState() => _CustomerDetailsSectionState();
}

class _CustomerDetailsSectionState extends State<CustomerDetailsSection> {
  final GlobalKey<FormState> _titleKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _secondGroupKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _representativeKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _mainGroupKey = GlobalKey<FormState>();

  final FocusNode _titleNode = FocusNode();

  final FocusNode _nameNode = FocusNode();

  final FocusNode _representativeNode = FocusNode();

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
        fieldPadding: EdgeInsets.all(10),
        children: <CardSettingsSection>[
          CardSettingsSection(
            header: CardSettingsHeader(
              label: 'Customer Details',
            ),
            children: <CardSettingsWidget>[
              buildCardSettingsTextDefault(
                key: _titleKey,
                focusNode: _titleNode,
                onSavedValue: _ponyModel.title,
                hintText: _ponyModel.title,
                label: _ponyModel.title,
                inputAction: TextInputAction.next,
                inputActionNode: _nameNode,
              ),
              buildCardSettingsTextDefault(
                key: _nameKey,
                focusNode: _nameNode,
                onSavedValue: _ponyModel.customerName,
                hintText: _ponyModel.customerName,
                label: _ponyModel.customerName,
                inputAction: TextInputAction.next,
                inputActionNode: _representativeNode,
              ),
              buildCardSettingsTextDefault(
                key: _representativeKey,
                focusNode: _representativeNode,
                onSavedValue: _ponyModel.customerRepresentative,
                hintText: _ponyModel.customerRepresentative,
                label: _ponyModel.customerRepresentative,
                // inputAction: TextInputAction.next,
                // inputActionNode: _descriptionNode,
              ),

              buildCardSettingsRadioPicker(
                key: _mainGroupKey,
                items: mainGroupPickers,
                label: _ponyModel.currentMainGroupLable,
                onSavedValue: _ponyModel.currentMainGroup,
                hintText: _ponyModel.currentMainGroupLable,
                initialItem: _ponyModel.currentMainGroup,
              ),
              buildCardSettingsSelectionPicker(
                key: _secondGroupKey,
                items: currentSecondGroupItems,
                label: _ponyModel.currentSecondGroupLable,
                initialItem: _ponyModel.currentSecondGroupItem,
                hintText: _ponyModel.currentSecondGroupLable,
                onSavedValue: _ponyModel.currentSecondGroupItem,
              ),
              // _buildCardSettingsText_Name(),
              // _buildCardSettingsListPicker_Type(),
              // _buildCardSettingsRadioPicker_Gender(),
              // _buildCardSettingsNumberPicker_Age(),
              // _buildCardSettingsParagraph_Description(5),
              // _buildCardSettingsCheckboxPicker_Hobbies(),
              // _buildCardSettingsDateTimePicker_Birthday(),
              // _buildCardSettingsText_Disabled()
            ],
          )
        ]);
  }
}
