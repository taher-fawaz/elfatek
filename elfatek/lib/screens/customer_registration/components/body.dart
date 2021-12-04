import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';
import '../../../translations/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool isCustomerSatisfied = true;
  // String _time = "Not set";
  final TextEditingController _controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.text = "0";
  }

  @override
  void dispose() {
    focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(20.0),
      child: SizedBox(
        // width: double.infinity,
        child: FormBuilder(
          key: _formKey,
          // autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'Customer title',
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
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100,
                    divisions: 5,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                  //  FormBuilderFilterChip(
                  //   name: 'filter_chip',
                  //   decoration: InputDecoration(
                  //     labelText: LocaleKeys.current_main_group.tr(),
                  //   ),
                  //   options: const [
                  //     FormBuilderFieldOption(
                  //         value: 'Group 1', child: Text('Group 1')),
                  //     FormBuilderFieldOption(
                  //         value: 'Group 2', child: Text('Group 2')),
                  //     FormBuilderFieldOption(
                  //         value: 'Group 3', child: Text('Group 3')),
                  //     FormBuilderFieldOption(
                  //         value: 'Group 4', child: Text('Group 4')),
                  //   ],
                  // ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderChoiceChip(
                    focusNode: focusNode,
                    name: 'choice_chip',
                    decoration: InputDecoration(
                      labelText: LocaleKeys.current_second_group.tr(),
                    ),
                    options: const [
                      FormBuilderFieldOption(
                          value: 'Group 1', child: Text('Group 1')),
                      FormBuilderFieldOption(
                          value: 'Group 2', child: Text('Group 2')),
                      FormBuilderFieldOption(
                          value: 'Group 3', child: Text('Group 3')),
                      FormBuilderFieldOption(
                          value: 'Group 4', child: Text('Group 4')),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'adress', minLines: 1, maxLines: 3,
                    decoration: InputDecoration(
                        labelText: LocaleKeys.address.tr(),
                        hintText: LocaleKeys.current_second_group.tr()),
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
                    name: 'City',
                    decoration: InputDecoration(
                      labelText: LocaleKeys.city.tr(),
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: const Text('Select City'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: turkishCities
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
                    name: 'district',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.district.tr(),
                        hintText: LocaleKeys.district.tr()),
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
                  child: FormBuilderDropdown(
                    name: 'Country',
                    decoration: InputDecoration(
                      labelText: LocaleKeys.country.tr(),
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: const Text('Select Country'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: ["Turkey"]
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
                    name: 'Business Phone 1',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.business_phone_1.tr(),
                        hintText: LocaleKeys.business_phone_1.tr()),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'Business Phone 2',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.business_phone_2.tr(),
                        hintText: LocaleKeys.business_phone_2.tr()),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'Fax Number',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.fax_number.tr(),
                        hintText: LocaleKeys.fax_number.tr()),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'GSM Number',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.gsm_number.tr(),
                        hintText: LocaleKeys.gsm_number.tr()),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'Tax Administration',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.tax_administration.tr(),
                        hintText: LocaleKeys.current_second_group.tr()),
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
                    name: 'Tax number',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.tax_number.tr(),
                        hintText: LocaleKeys.tax_number.tr()),
                    // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'Email 1',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.email_1.tr(),
                        hintText: LocaleKeys.email_1.tr()),
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
                    name: 'Email 2',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.email_2.tr(),
                        hintText: LocaleKeys.email_2.tr()),
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
                    name: 'Website Address',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.website_address.tr(),
                        hintText: LocaleKeys.website_address.tr()),
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
                  child: FormBuilderDropdown(
                    name: 'Is it active',
                    decoration: InputDecoration(
                      labelText: LocaleKeys.is_it_active.tr(),
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: const Text('Select Is it active'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: ["Yes", "No"]
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
                    name: 'Customer Status',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.customer_status.tr(),
                        hintText: LocaleKeys.customer_status.tr()),
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
                    name: 'Customer Representative',
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
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  width: double.maxFinite,
                  child: FormBuilderSlider(
                    name: 'Possibility',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.min(context, 6),
                    ]),
                    min: 0.0,
                    max: 1.0,
                    // onChanged: _onChanged,
                    numberFormat: NumberFormat.percentPattern(),
                    initialValue: 0.0,
                    divisions: 4,
                    activeColor: Colors.red,
                    inactiveColor: Colors.pink[100],

                    decoration:
                        //  const InputDecoration(
                        //   labelText: 'Customer Representative',
                        // ),
                        inputDecorationStyle(
                            '${LocaleKeys.customer_status.tr()} %'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderDropdown(
                    name: 'Dealer Probability %',
                    decoration: InputDecoration(
                      labelText: '${LocaleKeys.dealer_probability.tr()} %',
                    ),
                    // initialValue: 'Male',
                    allowClear: true,
                    hint: const Text('Select Dealer Probability'),
                    validator: FormBuilderValidators.compose(
                        [FormBuilderValidators.required(context)]),
                    items: [0, 25, 50, 100]
                        .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text('$gender %'),
                            ))
                        .toList(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderDateTimePicker(
                    name: 'date_rae',
                    firstDate: DateTime(1970),
                    lastDate: DateTime(2030),
                    format: DateFormat('yyyy-MM-dd'),
                    // onChanged: _onChanged,
                    decoration: InputDecoration(
                      labelText: LocaleKeys.do_not_get_registered.tr(),
                      hintText: LocaleKeys.do_not_get_registered.tr(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    name: 'Current Product Brand',
                    decoration: InputDecoration(
                        labelText: LocaleKeys.current_product_brand.tr(),
                        hintText: LocaleKeys.current_product_brand.tr()),
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
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: FormBuilderTextField(
                          name: 'Current Product Quantity',
                          decoration: InputDecoration(
                              labelText:
                                  LocaleKeys.current_product_quantity.tr(),
                              hintText:
                                  LocaleKeys.current_product_quantity.tr()),
                          // onChanged: _onChanged,
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context),
                            FormBuilderValidators.max(context, 70),
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(style: BorderStyle.solid, width: .5),
                        ),
                        height: 38.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              child: InkWell(
                                child: const Icon(
                                  Icons.arrow_drop_up,
                                  size: 18.0,
                                  color: Colors.black,
                                ),
                                onTap: () {
                                  int currentValue =
                                      int.parse(_controller.text);
                                  setState(() {
                                    currentValue++;
                                    _controller.text = (currentValue)
                                        .toString(); // incrementing value
                                  });
                                },
                              ),
                            ),
                            InkWell(
                              child: const Icon(
                                Icons.arrow_drop_down,
                                size: 18.0,
                                color: Colors.black,
                              ),
                              onTap: () {
                                int currentValue = int.parse(_controller.text);
                                setState(() {
                                  currentValue--;
                                  _controller.text =
                                      (currentValue > 0 ? currentValue : 0)
                                          .toString(); // decrementing value
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderCheckbox(
                    name: 'accept',
                    initialValue: false,
                    // onChanged: _onChanged,
                    title: Text(
                      LocaleKeys.show_reference.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15),
                    ),

                    validator: FormBuilderValidators.equal(
                      context,
                      true,
                      errorText:
                          'You must accept terms and conditions to continue',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderCheckbox(
                    name: 'accept_terms',
                    initialValue: isCustomerSatisfied,
                    onChanged: (value) {
                      setState(() {
                        isCustomerSatisfied = value!;
                      });
                    },
                    // onChanged: _onChanged,
                    title: Text(
                      LocaleKeys.customer_satisfied.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15),
                    ),

                    validator: FormBuilderValidators.equal(
                      context,
                      false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: FormBuilderTextField(
                    enabled: !isCustomerSatisfied,
                    name: 'Reason', minLines: 2, maxLines: 3,
                    decoration: InputDecoration(
                        labelText: LocaleKeys.If_not_reason.tr(),
                        hintText: LocaleKeys.If_not_reason.tr()),
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
    );
  }
}
