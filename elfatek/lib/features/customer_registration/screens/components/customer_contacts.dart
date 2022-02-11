import 'package:card_settings/card_settings.dart';
import 'package:elfatek/presentation/base/model.dart';
import 'package:elfatek/presentation/common/card_setting.dart';
import 'package:elfatek/presentation/common/card_setting_section.dart';
import 'package:elfatek/presentation/common/card_textfield.dart';
import 'package:flutter/material.dart';

class CustomerContactsSection extends StatefulWidget {
  final TextEditingController? businessPhone1Controller;
  final TextEditingController? businessPhone2Controller;
  final TextEditingController? faxNumberController;

  final TextEditingController? taxAdministrationController;
  final TextEditingController? gsmNumberController;
  final TextEditingController? websiteController;
  final TextEditingController? email1Controller;
  final TextEditingController? email2Controller;
  final TextEditingController? taxNumberController;
  final GlobalKey<FormState>? businessPhone1Key;
  final GlobalKey<FormState>? businessPhone2Key;
  final GlobalKey<FormState>? faxNumberKey;

  final GlobalKey<FormState>? taxAdministrationKey;
  final GlobalKey<FormState>? gsmNumberKey;
  final GlobalKey<FormState>? websiteKey;
  final GlobalKey<FormState>? email1Key;
  final GlobalKey<FormState>? email2Key;
  final GlobalKey<FormState>? taxNumberKey;

  // final FocusNode _businessPhone1Node ;
  // final FocusNode _businessPhone2Node ;
  // final FocusNode _faxNumberNode ;
  // final FocusNode _gsmNumberNode ;
  // final FocusNode _websiteNode ;
  // final FocusNode _email1Node ;
  // final FocusNode _email2Node ;
  // final FocusNode _taxNumberNode ;
  CustomerContactsSection({
    Key? key,
    this.businessPhone1Controller,
    this.businessPhone2Controller,
    this.faxNumberController,
    this.taxAdministrationController,
    this.gsmNumberController,
    this.websiteController,
    this.email1Controller,
    this.email2Controller,
    this.taxNumberController,
    this.businessPhone1Key,
    this.businessPhone2Key,
    this.faxNumberKey,
    this.taxAdministrationKey,
    this.gsmNumberKey,
    this.websiteKey,
    this.email1Key,
    this.email2Key,
    this.taxNumberKey,
  }) : super(key: key);

  @override
  _CustomerContactsSectionState createState() =>
      _CustomerContactsSectionState();
}

class _CustomerContactsSectionState extends State<CustomerContactsSection> {
  final FocusNode _taxAdministrationNode = FocusNode();

  final PonyModel _ponyModel = PonyModel();
  @override
  Widget build(BuildContext context) {
    return CardSettingSectionWidget(children: <CardSettingsSection>[
      CardSettingsSection(
        header: cardSettingsHeader("Customer's Contacts"),
        children: <CardSettingsWidget>[
          buildCardSettingsNumeric(
            key: widget.businessPhone1Key,
            controller: widget.businessPhone1Controller,
            // focusNode: _businessPhone1Node,
            label: _ponyModel.businessPhone1Label,
            hintText: _ponyModel.businessPhone1Label,
            // inputActionNode: _businessPhone2Node,
            initialValue: _ponyModel.businessPhone1Value,
          ),
          buildCardSettingsNumeric(
            key: widget.businessPhone2Key,
            controller: widget.businessPhone2Controller,
            // focusNode: _businessPhone2Node,
            label: _ponyModel.businessPhone2Label,
            hintText: _ponyModel.businessPhone2Label,
            // inputActionNode: _faxNumberNode,
            initialValue: _ponyModel.businessPhone2Value,
          ),
          buildCardSettingsNumeric(
            key: widget.faxNumberKey,
            controller: widget.faxNumberController,
            // focusNode: _faxNumberNode,
            label: _ponyModel.faxNumberLabel,
            hintText: _ponyModel.faxNumberLabel,
            // inputActionNode: _gsmNumberNode,
            initialValue: _ponyModel.faxNumberValue,
          ),
          buildCardSettingsNumeric(
            key: widget.gsmNumberKey,
            controller: widget.gsmNumberController,
            // focusNode: _gsmNumberNode,
            label: _ponyModel.gsmNumberLabel,
            hintText: _ponyModel.gsmNumberLabel,
            initialValue: _ponyModel.gsmNumberValue,
            // inputActionNode: _taxAdministrationNode,
          ),
          buildCardSettingsTextDefault(
              key: widget.taxAdministrationKey,
              controller: widget.taxAdministrationController,
              // focusNode: _taxAdministrationNode,
              hintText: _ponyModel.taxAdministrationLabel,
              label: _ponyModel.taxAdministrationLabel,
              inputAction: TextInputAction.next,
              // inputActionNode: _taxNumberNode,
              initialValue: _ponyModel.taxAdministrationValue),
          buildCardSettingsNumeric(
            key: widget.taxNumberKey,
            controller: widget.taxNumberController,
            // focusNode: _taxNumberNode,
            label: _ponyModel.taxNumberLabel,
            hintText: _ponyModel.taxNumberLabel,
            // onSavedValue: _ponyModel.taxNumberValue,
            onSaved: (value) {},
            // inputActionNode: _email1Node,
            initialValue: _ponyModel.taxNumberValue,
          ),
          buildCardSettingsEmail(
            key: widget.email1Key,
            controller: widget.email1Controller,
            label: _ponyModel.email1Label,
            // onSavedValue: _ponyModel.email1Value,
            onSaved: (value) {},
            // focusNode: _email1Node,
            initialValue: _ponyModel.email1Value,
            // inputActionNode: _email2Node,
          ),
          buildCardSettingsEmail(
            key: widget.email2Key, controller: widget.email2Controller,
            label: _ponyModel.email2Label,
            // onSavedValue: _ponyModel.email2Value,
            onSaved: (value) {},
            // widget.customerRegistration?.customerSatisfied,
            // focusNode: _email2Node,
            initialValue: _ponyModel.email2Value,
            // inputActionNode: _websiteNode,
          ),
          buildCardSettingsTextDefault(
            key: widget.websiteKey,
            controller: widget.websiteController,
            // focusNode: _websiteNode,
            hintText: _ponyModel.websiteLabel,
            label: _ponyModel.websiteLabel,
            inputAction: TextInputAction.done,
          ),
        ],
      )
    ]);
  }
}
