import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

import '../../../translations/locale_keys.g.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final bool isCustomerSatisfied = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: FormBuilder(
          key: _formKey, autoFocusOnValidationFailure: true,
          // autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderTextField(
                      name: 'title',
                      decoration: InputDecoration(
                          labelText: LocaleKeys.customer_title.tr(),
                          hintText: LocaleKeys.customer_title.tr()),
                      // onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderTextField(
                      name: 'Customer name',
                      decoration: InputDecoration(
                          labelText: LocaleKeys.customer_name.tr(),
                          hintText: LocaleKeys.customer_name.tr()),
                      // onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderDateTimePicker(
                      name: 'date_range',
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030),
                      format: DateFormat('yyyy-MM-dd'),
                      // onChanged: _onChanged,
                      decoration: const InputDecoration(
                        labelText: "Interview Date",
                        hintText: "Interview Date",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderDateTimePicker(
                      name: 'date',
                      // onChanged: _onChanged,
                      inputType: InputType.time,
                      decoration: const InputDecoration(
                        labelText: 'Meeting Hour',
                      ),
                      initialTime: const TimeOfDay(hour: 8, minute: 0),
                      initialValue: DateTime.now(),
                      // enabled: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderDateTimePicker(
                      name: 'dater',
                      firstDate: DateTime(1970),
                      lastDate: DateTime(2030),
                      format: DateFormat('yyyy-MM-dd'),
                      // onChanged: _onChanged,
                      decoration: const InputDecoration(
                        labelText: "Next Interview Date",
                        hintText: "Next Interview Date",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderTextField(
                      name: 'customer representative',
                      decoration: InputDecoration(
                          labelText: LocaleKeys.customer_representative.tr(),
                          hintText: LocaleKeys.customer_representative.tr()),
                      // onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderTextField(
                      name: "Discussion Subject", minLines: 1, maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: "Discussion Subject",
                          hintText: "Discussion Subject"),
                      // onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderTextField(
                      name: "Interview Content", minLines: 1, maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: "Interview Content",
                          hintText: "Interview Content"),
                      // onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderDropdown(
                      name: 'Interview Status',
                      decoration: const InputDecoration(
                        labelText: 'Interview Status',
                      ),
                      // initialValue: 'Male',
                      allowClear: true,
                      hint: const Text('Select Interview Status'),
                      validator: FormBuilderValidators.compose(
                          [FormBuilderValidators.required(context)]),
                      items: ["Discussed", "Not Met"]
                          .map((gender) => DropdownMenuItem(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: FormBuilderTextField(
                      name: 'explanation', minLines: 1, maxLines: 3,
                      decoration: const InputDecoration(
                          labelText: "Explanation", hintText: "Explanation"),
                      // onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(context),
                        FormBuilderValidators.numeric(context),
                        FormBuilderValidators.max(context, 70),
                      ]),
                      keyboardType: TextInputType.multiline,
                    ),
                  ),
                  FormBuilderCheckbox(
                    name: 'Offer Made',
                    initialValue: false,
                    // onChanged: _onChanged,
                    title: Text(
                      "Offer Made",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                    ),

                    validator: FormBuilderValidators.equal(
                      context,
                      true,
                      errorText:
                          'You must accept terms and conditions to continue',
                    ),
                  ),
                  MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      LocaleKeys.save.tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // _formKey.currentState.save();
                      // if (_formKey.currentState.validate()) {
                      //   print(_formKey.currentState.value);
                      // } else {
                      //   print("validation failed");
                      // }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
