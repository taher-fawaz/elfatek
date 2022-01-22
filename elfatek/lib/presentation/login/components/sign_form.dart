import '../../../domain/controller/provider/auth_provider.dart';
import '../../../domain/model/user.dart';
import '../../login_success/login_success_screen.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../../../app/constant.dart';
import '../../common/components/custom_surfix_icon.dart';
import '../../common/components/default_button.dart';
import '../../common/components/form_error.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/keyboard.dart';
import '../../resources/routes_manager.dart';
import '../../resources/size_config.dart';
import '../../resources/strings_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import 'package:flutter/material.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(AppSize.s28)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(AppSize.s28)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: ColorManager.primary,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text(
                AppStrings.rememberMe,
                style: getRegularStyle(
                    color: ColorManager.darkGrey,
                    fontSize: getProportionateScreenHeight(AppSize.s16)),
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(
                    context, Routes.forgotPasswordRoute),
                child: Text(
                  AppStrings.forgetPassword,
                  style: getRegularStyle(
                      color: ColorManager.darkGrey,
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(AppSize.s20)),
          DefaultButton(
            text: AppStrings.continueText,
            press: () {
              // Navigator.pushReplacementNamed(context, Routes.loginSuccessRoute);

              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                userProvider.login(
                    userModel: User(
                        email: _emailController.text,
                        password: _passwordController.text),
                    context: context);

                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: AppStrings.kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: AppStrings.kShortPassError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: AppStrings.kPassNullError);
          return "";
        } else if (value.length < 7) {
          addError(error: AppStrings.kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: AppStrings.password,
        hintText: AppStrings.passwordHint,
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: IconAssets.lock),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: AppStrings.kEmailNullError);
        } else if (Constant.emailValidatorRegExp.hasMatch(value)) {
          removeError(error: AppStrings.kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: AppStrings.kEmailNullError);
          return "";
        } else if (!Constant.emailValidatorRegExp.hasMatch(value)) {
          addError(error: AppStrings.kInvalidEmailError);
          return "";
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
    );
  }
}
