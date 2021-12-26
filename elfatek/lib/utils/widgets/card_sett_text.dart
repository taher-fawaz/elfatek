import 'package:card_settings/card_settings.dart';
import 'package:elfatek/card/plumbing/model.dart';
import 'package:elfatek/constants.dart';
import 'package:flutter/material.dart';

CardSettingsText buildCardSettingsTextDefault(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    TextInputAction inputAction = TextInputAction.done,
    @required String? hintText,
    String? initialValue,
    @required String? onSavedValue,
    TextEditingController? controller,
    FocusNode? focusNode,
    FocusNode? inputActionNode}) {
  // final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
  // final PonyModel _ponyModel = PonyModel();
  // final FocusNode _nameNode = FocusNode();
  // final FocusNode _descriptionNode = FocusNode();

  return CardSettingsText(
    key: key,
    label: label!, controller: controller,
    keyboardType: TextInputType.text,
    hintText: hintText,
    initialValue: initialValue,
    //_ponyModel.title,
    // requiredIndicator: Text('*', style: TextStyle(color: Colors.red)),
    autovalidateMode: autoValidateMode,
    focusNode: focusNode,
    //_nameNode,
    inputAction: inputAction,
    inputActionNode: inputActionNode,
    //inputMask: '000.000.000.000',
    validator: (value) {
      if (value == null || value.isEmpty) return '$label is required.';
      return null;
    },
    onSaved: (value) => onSavedValue = value!,
    onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsRadioPicker buildCardSettingsRadioPicker({
  @required GlobalKey<FormState>? key,
  required List<PickerModel> items,
  required String label,
  String hintText = 'something cute...',
  PickerModel? initialItem,
  required PickerModel? onSavedValue,
}) {
  return CardSettingsRadioPicker<PickerModel>(
    key: key,
    label: label,
    hintText: hintText,
    initialItem: initialItem,
    autovalidateMode: autoValidateMode,
    items: items,
    validator: (PickerModel? value) {
      if (value == null || value.toString().isEmpty)
        return 'You must pick a $label.';
      return null;
    },
    onSaved: (value) => onSavedValue = value!,
    onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsSelectionPicker buildCardSettingsSelectionPicker({
  @required GlobalKey<FormState>? key,
  required List<PickerModel> items,
  required String? label,
  required PickerModel? initialItem,
  required String? hintText,
  required PickerModel? onSavedValue,
}) {
  return CardSettingsSelectionPicker<PickerModel>(
    key: key,
    label: label!,
    initialItem: initialItem,
    hintText: 'Select One',
    autovalidateMode: autoValidateMode,
    items: items,
    iconizer: (item) => item.icon,
    validator: (PickerModel? value) {
      if (value == null || value.toString().isEmpty)
        return 'You must pick a $label.';
      return null;
    },
    onSaved: (value) => onSavedValue = value!,
    onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsParagraph buildCardSettingsParagraph({
  @required GlobalKey<FormState>? key,
  @required FocusNode? focusNode,
  @required String? label,
  @required String? hintText,
  String? initialValue,
  @required String? onSavedValue,
  TextEditingController? controller,
  @required int? lines,
}) {
  return CardSettingsParagraph(
    key: key,
    label: label!,
    initialValue: initialValue,
    numberOfLines: lines!,
    focusNode: focusNode,
    controller: controller,
    onSaved: (value) => onSavedValue = value!,
    onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsListPicker buildCardSettingsListPicker({
  @required GlobalKey<FormState>? key,
  required List<PickerModel> items,
  required String? label,
  required PickerModel? initialItem,
  TextEditingController? controller,
  required String? hintText,
  required String? onSavedValue,
}) {
  return CardSettingsListPicker<PickerModel>(
    key: key,
    label: label!,
    initialItem: initialItem,
    hintText: hintText,
    autovalidateMode: autoValidateMode,
    items: items,
    validator: (PickerModel? value) {
      if (value == null || value.toString().isEmpty)
        return 'You must pick a $label.';
      return null;
    },
    onSaved: (value) {
      onSavedValue = value!.name;
      // print(value);
    },
    onChanged: (value) => onSavedValue = value.name,
  );
}

CardSettingsPhone buildCardSettingsNumeric(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    @required String? hintText,
    @required int? initialValue,
    @required int? onSavedValue,
    @required FocusNode? focusNode,
    FocusNode? inputActionNode,
    TextInputAction inputAction = TextInputAction.next}) {
  return CardSettingsPhone(
    key: key,
    label: label!,
    initialValue: initialValue,
    focusNode: focusNode,
    inputAction: inputAction,
    inputActionNode: inputActionNode, maxLength: 9,
    // autovalidateMode: autoValidateMode,
    validator: (value) {
      return null;
    },
    // onSaved: (value) => onSavedValue = value!,
    onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsEmail buildCardSettingsEmail(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    String? initialValue,
    @required String? onSavedValue,
    @required FocusNode? focusNode,
    FocusNode? inputActionNode}) {
  return CardSettingsEmail(
    key: key,
    label: label!,
    focusNode: focusNode,
    inputActionNode: inputActionNode,
    icon: const Icon(Icons.person),
    inputAction: TextInputAction.next,
    initialValue: initialValue,
    autovalidateMode: autoValidateMode,
    validator: (value) {
      if (value == null || value.isEmpty) return 'Email is required.';
      if (!value.contains('@'))
        return "Email not formatted correctly."; // use regex in real application
      return null;
    },
    onSaved: (value) => onSavedValue = value!,
    onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsSwitch buildCardSettingsSwitch({
  @required GlobalKey<FormState>? key,
  @required String? label,
  bool? initialValue,
  @required bool? onSavedValue,
  void Function(bool)? onChanged,
}) {
  return CardSettingsSwitch(
    key: key,
    label: label!,
    initialValue: initialValue!,
    onSaved: (value) => onSavedValue = value!,
    onChanged: onChanged,
  );
}
