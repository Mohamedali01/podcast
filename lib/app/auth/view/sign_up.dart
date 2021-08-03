import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/control/providers/auth_provider.dart';
import 'package:podcast_app/app/auth/control/providers/facebook_login_provider.dart';
import 'package:podcast_app/app/auth/control/providers/google_login_provider.dart';
import 'package:podcast_app/app/auth/control/providers/sign_up_provider.dart';
import 'package:podcast_app/constants.dart';
import 'package:podcast_app/app/core/size_config.dart';
import 'package:podcast_app/widgets/custom_rounded_button.dart';
import 'package:podcast_app/widgets/custom_rounded_text_form_field.dart';
import 'package:podcast_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    final _googleProvider = Provider.of<GoogleLoginProvider>(context);
    final _facebookProvider = Provider.of<FacebookLoginProvider>(context);
    return Scaffold(
      body: (_googleProvider.isLoading || _facebookProvider.isLoading)
          ? Center(
              child: CircularProgressIndicator(
                color: Color(0xFFFB6580),
              ),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: defaultSize * 7,
                        ),
                        buildCenterTexts(defaultSize),
                        SizedBox(
                          height: defaultSize * 3.5,
                        ),
                        buildTextFormFields(defaultSize),
                        SizedBox(
                          height: defaultSize,
                        ),
                        buildReceiveEmailsText(defaultSize),
                        SizedBox(
                          height: defaultSize * 2.5,
                        ),
                        buildSignUpButton(defaultSize),
                        SizedBox(
                          height: defaultSize * 1.5,
                        ),
                        CustomText(
                          'OR',
                          color: Color(kTextColor),
                        ),
                        SizedBox(
                          height: defaultSize * 1.5,
                        ),
                        Consumer<GoogleLoginProvider>(
                          builder: (context, provider, _) {
                            return buildSocialButton(
                              text: 'Continue with Google',
                              backgroundColor: Colors.white,
                              defaultSize: defaultSize,
                              image: 'assets/images/google.svg',
                              textColor: Colors.black,
                              onPressed: () async {
                                await provider.googleLogin();
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: defaultSize * 2,
                        ),
                        buildSocialButton(
                            onPressed: () async {
                              await _facebookProvider.facebookLogin();
                            },
                            text: 'Continue with Facebook',
                            backgroundColor: Color(0xff39579A),
                            defaultSize: defaultSize,
                            image: 'assets/images/facebook.svg',
                            textColor: Colors.white,
                            imageColor: Colors.white),
                        SizedBox(
                          height: defaultSize * 5,
                        ),
                        buildDontHaveAccountText(defaultSize),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Consumer<AuthProvider> buildTextFormFields(double defaultSize) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return Column(
          children: [
            CustomRoundedTextFormField(
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter your name';
                return null;
              },
              onSaved: (String? value) {
                name = value!;
              },
              color: kSecondColor,
              width: double.infinity,
              radius: 10,
              height: defaultSize * 6.5,
              isPasswordVisible: false,
              hintText: 'User Name',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.assignment_ind,
                  size: defaultSize * 2.5,
                  color: Color(kPrimaryColor),
                ),
              ),
            ),
            SizedBox(
              height: defaultSize * 1.5,
            ),
            CustomRoundedTextFormField(
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter your email';
                if (!value.contains('@') || !value.contains('.'))
                  return 'Please enter a right email';
                return null;
              },
              onSaved: (String? value) {
                email = value!;
              },
              color: kSecondColor,
              width: double.infinity,
              radius: 10,
              height: defaultSize * 6.5,
              isPasswordVisible: false,
              hintText: 'Email Address',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.email,
                  size: defaultSize * 2.5,
                  color: Color(kPrimaryColor),
                ),
              ),
            ),
            SizedBox(
              height: defaultSize * 1.5,
            ),
            CustomRoundedTextFormField(
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter your password';
                if (value.length < 5) return 'Password is too short';
                return null;
              },
              onSaved: (String? value) {
                password = value!;
              },
              color: kSecondColor,
              width: double.infinity,
              radius: 15,
              height: defaultSize * 6.5,
              hintText: 'Password',
              isPasswordVisible: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(
                  Icons.lock_outline,
                  size: defaultSize * 2.5,
                  color: Color(kPrimaryColor),
                ),
              ),
              suffix: authProvider.isPasswordVisible
                  ? GestureDetector(
                      onTap: () {
                        authProvider.pressedVisiblePass();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.visibility,
                          color: Color(kPrimaryColor),
                        ),
                      ))
                  : GestureDetector(
                      onTap: () {
                        authProvider.pressedVisiblePass();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.visibility_off,
                          color: Color(kPrimaryColor),
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }

  Column buildTermsOfServiceText(double defaultSize) {
    return Column(
      children: [
        CustomText(
          'By signing up you indicate that you have read and',
          color: Color(kTextColor),
          fontSize: defaultSize * 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              'agreed to the Patch ',
              color: Color(kTextColor),
              fontSize: defaultSize,
            ),
            CustomText(
              'Terms of Service',
              color: Color(0xFFFB6580),
              fontSize: defaultSize * 1,
            ),
          ],
        ),
      ],
    );
  }

  Row buildDontHaveAccountText(double defaultSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          'Already have an account? ',
          color: Color(kTextColor),
          fontSize: defaultSize * 1.6,
        ),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: CustomText(
            'Log in',
            color: Color(0xFFFB6580),
            fontSize: defaultSize * 1.6,
          ),
        ),
      ],
    );
  }

  CustomRoundedButton buildSocialButton(
      {double? defaultSize,
      String? image,
      String? text,
      Color? backgroundColor,
      Color? textColor,
      Color? imageColor,
      void Function()? onPressed}) {
    return CustomRoundedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            image!,
            width: defaultSize! * 2.2,
            height: defaultSize * 2.2,
            color: imageColor,
          ),
          SizedBox(
            width: defaultSize,
          ),
          CustomText(
            text!,
            color: textColor!,
            fontSize: defaultSize * 1.8,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
      color: backgroundColor!,
      width: double.infinity,
      height: defaultSize * 5.7,
    );
  }

  //
  // Widget buildSignUpButton(double defaultSize,GlobalKey<FormState> formKey) {
  //   return ;
  // }

  Widget buildReceiveEmailsText(double defaultSize) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                authProvider.pressedReceiveEmails();
              },
              child: CircleAvatar(
                radius: defaultSize,
                backgroundColor: authProvider.isEmailReceived
                    ? Color(0xffF11775)
                    : Color(kSecondColor),
                child: Icon(
                  Icons.check,
                  size: defaultSize,
                  color: authProvider.isEmailReceived
                      ? Colors.white
                      : Color(kPrimaryColor),
                ),
              ),
            ),
            SizedBox(
              width: defaultSize * 0.5,
            ),
            CustomText(
              'Receive Emails',
              fontSize: defaultSize * 1.7,
              color: Color(kTextColor),
              // maxLine: 1,
            ),
          ],
        );
      },
    );
  }

  // Widget buildTextFormFields(double defaultSize) {
  //   return ;
  // }

  Column buildCenterTexts(double defaultSize) {
    return Column(
      children: [
        CustomText(
          'Sign Up',
          color: Colors.white,
          fontSize: defaultSize * 2.7,
        ),
        CustomText(
          'Sign Up and Start Learning',
          fontSize: defaultSize * 1.7,
          color: Color(kTextColor),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget buildSignUpButton(double defaultSize) {
    return Consumer<SignUpProvider>(builder: (context, provider, _) {
      return CustomRoundedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            print('sign up executed');
            _formKey.currentState!.save();
            await provider.signUp();
          }
        },
        child: Center(
          child: provider.isLoading
              ? CircularProgressIndicator(
                  color: Colors.white,
                )
              : CustomText(
                  'Sign up',
                  color: Colors.white,
                  fontSize: defaultSize * 2.2,
                  fontWeight: FontWeight.w600,
                ),
        ),
        color: Color(0xffF11775),
        width: double.infinity,
        height: defaultSize * 5.7,
      );
    });
  }
}
