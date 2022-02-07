import 'package:elfatek/app/app_prefs.dart';
import 'package:elfatek/helper/failure.dart';
import 'package:elfatek/presentation/login_success/login_success_screen.dart';
import 'package:elfatek/presentation/resources/font_manager.dart';
import 'package:elfatek/presentation/resources/size_config.dart';
import 'package:elfatek/presentation/resources/strings_manager.dart';
import 'package:elfatek/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:elfatek/app/constant.dart';
import 'package:elfatek/features/auth/domain/models/user.dart';
import 'package:elfatek/features/auth/providers/auth_provider.dart';
import 'package:elfatek/presentation/common/components/custom_surfix_icon.dart';
import 'package:elfatek/presentation/common/components/default_button.dart';
import 'package:elfatek/presentation/common/components/form_error.dart';
import 'package:elfatek/presentation/resources/assets_manager.dart';
import 'package:elfatek/presentation/resources/color_manager.dart';
import 'package:elfatek/presentation/resources/keyboard.dart';
import 'package:elfatek/presentation/resources/routes_manager.dart';
import 'package:elfatek/presentation/resources/styles_manager.dart';
import 'package:provider/provider.dart';

import 'sign_form.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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

  User userData = User();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);
    print(userProvider.loggedInStatus);
    return FutureBuilder(
      future: AppPreferences.instance.isUserLoggedIn(),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (userProvider.loggedInStatus == Status.NotLoggedIn) {
          // return SafeArea(
          //   child: SizedBox(
          //     width: double.infinity,
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(
          //           horizontal: getProportionateScreenWidth(AppSize.s20)),
          //       child: SingleChildScrollView(
          //         child: Column(
          //           children: [
          //             SizedBox(height: SizeConfig.screenHeight * 0.04),
          //             Text(
          //               AppStrings.welcomeBack,
          //               style: TextStyle(
          //                 color: Colors.black,
          //                 fontSize: getProportionateScreenWidth(AppSize.s28),
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             SizedBox(height: SizeConfig.screenHeight * 0.01),
          //             const Text(
          //               AppStrings.signInHint,
          //               textAlign: TextAlign.center,
          //             ),
          //             SizedBox(height: SizeConfig.screenHeight * 0.08),
          // Form(
          //   key: _formKey,
          //   child: Column(
          //     children: [
          //       buildEmailFormField(),
          //       SizedBox(
          //           height:
          //               getProportionateScreenHeight(AppSize.s28)),
          //       buildPasswordFormField(),
          //       SizedBox(
          //           height:
          //               getProportionateScreenHeight(AppSize.s28)),
          //       Row(
          //         children: [
          //           Checkbox(
          //             value: remember,
          //             activeColor: ColorManager.primary,
          //             onChanged: (value) {
          //               setState(() {
          //                 remember = value;
          //               });
          //             },
          //           ),
          //           Text(
          //             AppStrings.rememberMe,
          //             style: getRegularStyle(
          //                 color: ColorManager.darkGrey,
          //                 fontSize: getProportionateScreenHeight(
          //                     AppSize.s16)),
          //           ),
          //           const Spacer(),
          //           TextButton(
          //             onPressed: () =>
          //                 Navigator.pushReplacementNamed(
          //                     context, Routes.forgotPasswordRoute),
          //             child: Text(
          //               AppStrings.forgetPassword,
          //               style: getRegularStyle(
          //                   color: ColorManager.darkGrey,
          //                   decoration: TextDecoration.underline),
          //             ),
          //           )
          //         ],
          //       ),
          //       FormError(errors: errors),
          //       SizedBox(
          //           height:
          //               getProportionateScreenHeight(AppSize.s20)),
          //       DefaultButton(
          //         text: AppStrings.continueText,
          //         press: () {
          //           // Navigator.pushReplacementNamed(context, Routes.loginSuccessRoute);

          //           if (_formKey.currentState!.validate()) {
          //             _formKey.currentState!.save();
          //             userData = User(
          //                 email: _emailController.text,
          //                 password: _passwordController.text);
          //             userProvider.login(userModel: userData);

          //             KeyboardUtil.hideKeyboard(context);
          //           }
          //         },
          //       ),
          //     ],
          //   ),
          // ),
          return const SignForm();
          //             SizedBox(
          //                 height: getProportionateScreenHeight(AppSize.s20)),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // );
        } else if (userProvider.loggedInStatus == Status.LoggedIn) {
          return const LoginSuccessScreen();
        } else if (userProvider.loggedInStatus == Status.Error) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SignForm(),
                  Text(
                    userProvider.failure.message!,
                    style: getMediumStyle(
                            color: Colors.red, fontSize: FontSize.s18)
                        .copyWith(letterSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
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
