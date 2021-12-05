import 'package:card_settings/card_settings.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/utils/widgets/card_sett_text.dart';
import 'package:flutter/material.dart';

class CustomerStatus extends StatefulWidget {
  const CustomerStatus({Key? key}) : super(key: key);

  @override
  _CustomerStatusState createState() => _CustomerStatusState();
}

class _CustomerStatusState extends State<CustomerStatus> {
  final GlobalKey<FormState> _isActiveKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _businessPhone2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _faxNumberKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _taxAdministrationKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _gsmNumberKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _websiteKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _email1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _email2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> _taxNumberKey = GlobalKey<FormState>();

  final FocusNode _businessPhone2Node = FocusNode();
  final FocusNode _faxNumberNode = FocusNode();
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
              label: "Customer Status",
            ),
            children: <CardSettingsWidget>[
              buildCardSettingsSwitch(
                key: _isActiveKey,
                label: _ponyModel.isActiveLabel,
                onSavedValue: _ponyModel.isActiveValue,
                initialValue: _ponyModel.isActiveValue,
              ),
              // buildCardSettingsNumeric(
              //   key: _businessPhone2Key,
              //   focusNode: _businessPhone2Node,
              //   label: _ponyModel.businessPhone2Label,
              //   hintText: _ponyModel.businessPhone2Label,
              //   onSavedValue: _ponyModel.businessPhone2Value,
              //   inputActionNode: _faxNumberNode,
              //   initialValue: _ponyModel.businessPhone2Value,
              // ),
              // buildCardSettingsNumeric(
              //   key: _faxNumberKey,
              //   focusNode: _faxNumberNode,
              //   label: _ponyModel.faxNumberLabel,
              //   hintText: _ponyModel.faxNumberLabel,
              //   onSavedValue: _ponyModel.faxNumberValue,
              //   inputActionNode: _gsmNumberNode,
              //   initialValue: _ponyModel.faxNumberValue,
              // ),
              // buildCardSettingsNumeric(
              //   key: _gsmNumberKey,
              //   focusNode: _gsmNumberNode,
              //   label: _ponyModel.gsmNumberLabel,
              //   hintText: _ponyModel.gsmNumberLabel,
              //   onSavedValue: _ponyModel.gsmNumberValue,
              //   initialValue: _ponyModel.gsmNumberValue,
              //   inputActionNode: _taxAdministrationNode,
              // ),
              // buildCardSettingsTextDefault(
              //     key: _taxAdministrationKey,
              //     focusNode: _taxAdministrationNode,
              //     onSavedValue: _ponyModel.taxAdministrationValue,
              //     hintText: _ponyModel.taxAdministrationLabel,
              //     label: _ponyModel.taxAdministrationLabel,
              //     inputAction: TextInputAction.next,
              //     inputActionNode: _taxNumberNode,
              //     initialValue: _ponyModel.taxAdministrationValue),
              // buildCardSettingsNumeric(
              //   key: _taxNumberKey,
              //   focusNode: _taxNumberNode,
              //   label: _ponyModel.taxNumberLabel,
              //   hintText: _ponyModel.taxNumberLabel,
              //   onSavedValue: _ponyModel.taxNumberValue,
              //   inputActionNode: _email1Node,
              //   initialValue: _ponyModel.taxNumberValue,
              // ),
              // buildCardSettingsEmail(
              //   key: _email1Key,
              //   label: _ponyModel.email1Label,
              //   onSavedValue: _ponyModel.email1Value,
              //   focusNode: _email1Node,
              //   initialValue: _ponyModel.email1Value,
              //   inputActionNode: _email2Node,
              // ),
              // buildCardSettingsEmail(
              //   key: _email2Key,
              //   label: _ponyModel.email2Label,
              //   onSavedValue: _ponyModel.email2Value,
              //   focusNode: _email2Node,
              //   initialValue: _ponyModel.email2Value,
              //   inputActionNode: _websiteNode,
              // ),
              // buildCardSettingsTextDefault(
              //   key: _websiteKey,
              //   focusNode: _websiteNode,
              //   onSavedValue: _ponyModel.websiteValue,
              //   hintText: _ponyModel.websiteLabel,
              //   label: _ponyModel.websiteLabel,
              //   inputAction: TextInputAction.done,
              //   // inputActionNode: _nameNode,
              // ),
            ],
          )
        ]);
  }
}
