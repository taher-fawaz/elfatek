import '../../../app/constant.dart';
import '../../common/components/custom_surfix_icon.dart';
import '../../common/components/default_button.dart';
import '../../common/components/form_error.dart';
import '../../resources/assets_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              Text(
                AppStrings.forgetPassword,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.01),
              const Text(
                AppStrings.returnAccount,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              const ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty &&
                  errors.contains(AppStrings.kEmailNullError)) {
                setState(() {
                  errors.remove(AppStrings.kEmailNullError);
                });
              } else if (Constant.emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(AppStrings.kInvalidEmailError)) {
                setState(() {
                  errors.remove(AppStrings.kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty &&
                  !errors.contains(AppStrings.kEmailNullError)) {
                setState(() {
                  errors.add(AppStrings.kEmailNullError);
                });
              } else if (!Constant.emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(AppStrings.kInvalidEmailError)) {
                setState(() {
                  errors.add(AppStrings.kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: AppStrings.email,
              hintText: AppStrings.emailHint,
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(svgIcon: IconAssets.mail),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
          DefaultButton(
            text: AppStrings.continueText,
            press: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.02),
        ],
      ),
    );
  }
}
