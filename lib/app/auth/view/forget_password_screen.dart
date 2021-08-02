import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/view/login_screen.dart';
import 'package:podcast_app/app/core/size_config.dart';
import 'package:podcast_app/constants.dart';
import 'package:podcast_app/widgets/custom_rounded_button.dart';
import 'package:podcast_app/widgets/custom_rounded_text_form_field.dart';
import 'package:podcast_app/widgets/custom_text.dart';

class ForgetPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildTexts(defaultSize),
                    SizedBox(
                      height: defaultSize * 4,
                    ),
                    buildTextFormField(defaultSize),
                    SizedBox(
                      height: defaultSize * 3,
                    ),
                    buildSendPasswordButton(defaultSize),
                    // SizedBox(
                    //   height: defaultSize * 20,
                    // ),
                  ],
                ),
                buildDontHaveAccountText(
                  defaultSize: defaultSize,
                  onTap: () {
                    Get.offAll(LoginScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CustomRoundedButton buildSendPasswordButton(double defaultSize) {
    return CustomRoundedButton(
      child: Center(
        child: CustomText(
          'Send Password Reset',
          color: Colors.white,
          fontSize: defaultSize * 2.2,
          fontWeight: FontWeight.w600,
        ),
      ),
      color: Color(0xffF11775),
      width: double.infinity,
      height: defaultSize * 5.7,
    );
  }

  CustomRoundedTextFormField buildTextFormField(double defaultSize) {
    return CustomRoundedTextFormField(
      color: kSecondColor,
      width: double.infinity,
      radius: 10,
      height: defaultSize * 6.5,
      isPasswordVisible: false,
      hintText: 'Email Address',
      prefixIcon: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(
          Icons.lock_outline,
          size: defaultSize * 2.5,
          color: Color(kPrimaryColor),
        ),
      ), onSaved: (value){}, validator: (value){},
    );
  }

  Column buildTexts(double defaultSize) {
    return Column(
      children: [
        CustomText(
          'Forget Password',
          fontSize: defaultSize * 2.2,
        ),
        SizedBox(
          height: defaultSize,
        ),
        Column(
          children: [
            CustomText(
              "Enter your email address below.",
              color: Color(kTextColor),
              fontWeight: FontWeight.w600,
              fontSize: defaultSize * 1.7,
            ),
            CustomText(
              "We'll look for your account and send you a ",
              color: Color(kTextColor),
              fontWeight: FontWeight.w600,
              fontSize: defaultSize * 1.7,
            ),
            CustomText(
              "password reset email.",
              color: Color(kTextColor),
              fontWeight: FontWeight.w600,
              fontSize: defaultSize * 1.7,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDontHaveAccountText(
      {double? defaultSize, void Function()? onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          'Already have an account? ',
          color: Color(kTextColor),
          fontSize: defaultSize! * 1.6,
        ),
        InkWell(
          onTap: onTap,
          child: CustomText(
            'Log in',
            color: Color(0xFFFB6580),
            fontSize: defaultSize * 1.6,
          ),
        ),
      ],
    );
  }
}
