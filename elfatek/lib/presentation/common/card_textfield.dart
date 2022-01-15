import 'package:card_settings/card_settings.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';

const AutovalidateMode autoValidateMode = AutovalidateMode.onUserInteraction;

CardSettingsText buildCardSettingsTextDefault(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    TextInputAction inputAction = TextInputAction.done,
    @required String? hintText,
    String? initialValue,
    void Function(String?)? onSaved,
    TextEditingController? controller,
    FocusNode? focusNode,
    FocusNode? inputActionNode}) {
  return CardSettingsText(
    key: key,
    label: label!, controller: controller,
    keyboardType: TextInputType.text,
    hintText: hintText,
    initialValue: initialValue,

    autovalidateMode: autoValidateMode,
    focusNode: focusNode,
    inputAction: inputAction,
    inputActionNode: inputActionNode,
    validator: (value) {
      if (value == null || value.isEmpty) return '$label is required.';
      return null;
    },
    onSaved: onSaved,
    // onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsRadioPicker buildCardSettingsRadioPicker({
  @required GlobalKey<FormState>? key,
  required List<PickerModel> items,
  required String label,
  String hintText = 'something cute...',
  PickerModel? initialItem,
  required PickerModel? onSavedValue,
  void Function(PickerModel)? onChanged,
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
    onChanged: onChanged,
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
  void Function(String?)? onSaved,
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
    onSaved: onSaved,
    // onChanged: (value) => onSavedValue = value,
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
    // onSaved: onSaved,
    onChanged: (value) {
      onSavedValue = value.name;
    },
  );
}

CardSettingsDatePicker buildCardSettingsDatePicker(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    @required DateTime? initialValue,
    void Function(DateTime?)? onSaved,
    FocusNode? focusNode,
    TextEditingController? controller,
    FocusNode? inputActionNode,
    DateTime? dateValue,
    void Function(DateTime)? onChanged,
    TextInputAction inputAction = TextInputAction.next}) {
  return CardSettingsDatePicker(
    key: key,
    icon: const Icon(Icons.calendar_today),
    label: label!,
    dateFormat: DateFormat.yMMMMd(),
    initialValue: initialValue!,
    onSaved: onSaved,
    onChanged: onChanged,
  );
}

CardSettingsTimePicker cardSettingsTimePicker({
  @required GlobalKey<FormState>? key,
  @required String? label,
  @required TimeOfDay? initialValue,
  void Function(DateTime?)? onSaved,
  void Function(TimeOfDay)? onChanged,
  TextEditingController? controller,
}) {
  return CardSettingsTimePicker(
      key: key,
      icon: const Icon(Icons.access_time),
      label: label!,
      initialValue: initialValue,
      // onSaved: (value) => _ponyModel.showDateTime =
      //     updateJustTime(value!, _ponyModel.showDateTime),
      onChanged: onChanged
      //  (value) {
      //   setState(() {
      //     _ponyModel.showDateTime =
      //         updateJustTime(value, _ponyModel.showDateTime);
      //   });
      // },
      );
}

CardSettingsSlider buildCardSettingsSlider(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    @required double? initialValue,
    void Function(double?)? onSaved,
    FocusNode? focusNode,
    TextEditingController? controller,
    FocusNode? inputActionNode,
    double? sliderValue,
    TextInputAction inputAction = TextInputAction.next}) {
  return CardSettingsSlider(
    key: key,
    label: label!,
    divisions: 4,
    min: 0,
    max: 100,
    initialValue: initialValue!,
    autovalidateMode: autoValidateMode,
    validator: (double? value) {
      if (value == null) return 'You must pick a rating.';
      return null;
    },
    onSaved: onSaved,
    onChanged: (value) => sliderValue = value,
    visible: true,
    fieldPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  );
}

CardSettingsPhone buildCardSettingsNumeric(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    @required String? hintText,
    @required int? initialValue,
    void Function(int?)? onSaved,
    FocusNode? focusNode,
    TextEditingController? controller,
    FocusNode? inputActionNode,
    TextInputAction inputAction = TextInputAction.next}) {
  return CardSettingsPhone(
    key: key,
    label: label!,
    initialValue: initialValue,
    focusNode: focusNode, controller: controller,
    inputAction: inputAction,
    inputActionNode: inputActionNode, maxLength: 9,
    // autovalidateMode: autoValidateMode,
    validator: (value) {
      return null;
    },
    onSaved: onSaved,
    // onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsEmail buildCardSettingsEmail(
    {@required GlobalKey<FormState>? key,
    @required String? label,
    String? initialValue,
    void Function(String?)? onSaved,
    FocusNode? focusNode,
    TextEditingController? controller,
    FocusNode? inputActionNode}) {
  return CardSettingsEmail(
    key: key,
    controller: controller,
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
    onSaved: onSaved,
    // onChanged: (value) => onSavedValue = value,
  );
}

CardSettingsSwitch buildCardSettingsSwitch({
  @required GlobalKey<FormState>? key,
  @required String? label,
  bool? initialValue,
  void Function(bool?)? onSaved,
  void Function(bool)? onChanged,
}) {
  return CardSettingsSwitch(
    key: key,
    label: label!,
    initialValue: initialValue!,
    onSaved: onSaved,
    onChanged: onChanged,
  );
}
