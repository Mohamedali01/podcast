import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/control/providers/auth_provider.dart';
import 'package:podcast_app/app/auth/control/providers/facebook_login_provider.dart';
import 'package:podcast_app/app/auth/control/providers/google_login_provider.dart';
import 'package:podcast_app/app/auth/control/providers/login_provider.dart';
import 'package:podcast_app/app/auth/view/forget_password_screen.dart';
import 'package:podcast_app/app/auth/view/sign_up.dart';
import 'package:podcast_app/app/auth/view/terms_screen.dart';
import 'package:podcast_app/constants.dart';
import 'package:podcast_app/app/core/size_config.dart';
import 'package:podcast_app/widgets/custom_rounded_button.dart';
import 'package:podcast_app/widgets/custom_rounded_text_form_field.dart';
import 'package:podcast_app/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<GoogleLoginProvider>(context);
    SizeConfig().init(context);
    final defaultSize = SizeConfig.defaultSize;
    final _facebookProvider = Provider.of<FacebookLoginProvider>(context);
    return Scaffold(
      // appBar: buildAppBar(),
      body: SafeArea(
        child: (provider.isLoading || _facebookProvider.isLoading)
            ? Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFB6580),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: defaultSize * 7,
                        ),
                        buildCenterImage(defaultSize),
                        SizedBox(
                          height: defaultSize * 2.2,
                        ),
                        buildCenterTexts(defaultSize),
                        SizedBox(
                          height: defaultSize * 2.4,
                        ),
                        buildTextFormFields(defaultSize),
                        SizedBox(
                          height: defaultSize,
                        ),
                        buildRememberAndForget(defaultSize),
                        SizedBox(
                          height: defaultSize * 2.5,
                        ),
                        buildLoginButton(defaultSize),
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
                              onPressed: () async {
                                await provider.googleLogin(isLogin: true);
                              },
                              backgroundColor: Colors.white,
                              defaultSize: defaultSize,
                              image: 'assets/images/google.svg',
                              textColor: Colors.black);
                        }),
                        SizedBox(
                          height: defaultSize * 2,
                        ),
                        buildSocialButton(
                            onPressed: () async {
                              await _facebookProvider.facebookLogin(
                                  isLogin: true);
                            },
                            text: 'Continue with Facebook',
                            backgroundColor: Color(0xff39579A),
                            defaultSize: defaultSize,
                            image: 'assets/images/facebook.svg',
                            textColor: Colors.white,
                            imageColor: Colors.white),
                        SizedBox(
                          height: defaultSize * 2,
                        ),
                        buildDontHaveAccountText(defaultSize),
                        SizedBox(
                          height: defaultSize * 8,
                        ),
                        buildTermsOfServiceText(defaultSize)
                      ],
                    ),
                  ),
                ),
              ),
      ),
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
            InkWell(
              onTap: ()=>Get.to(TermsScreen()),
              child: CustomText(
                'Terms of Service',
                color: Color(0xFFFB6580),
                fontSize: defaultSize * 1,
              ),
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
          'Don\'t have an account? ',
          color: Color(kTextColor),
          fontSize: defaultSize * 1.6,
        ),
        InkWell(
          onTap: () {
            Get.to(SignUpScreen());
          },
          child: CustomText(
            'Sign up',
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

  Widget buildLoginButton(double defaultSize) {
    return Consumer<LoginProvider>(
      builder: (context, provider, _) {
        return CustomRoundedButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              await provider.login(email, password);
            }
          },
          child: Center(
            child: provider.isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : CustomText(
                    'Log In',
                    color: Colors.white,
                    fontSize: defaultSize * 2.2,
                    fontWeight: FontWeight.w600,
                  ),
          ),
          color: Color(0xffF11775),
          width: double.infinity,
          height: defaultSize * 5.7,
        );
      },
    );
  }

  Row buildRememberAndForget(double defaultSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            return Row(
              children: [
                GestureDetector(
                  onTap: () {
                    authProvider.pressedRemember();
                  },
                  child: CircleAvatar(
                    radius: defaultSize,
                    backgroundColor: authProvider.isRememberMe
                        ? Color(0xffF11775)
                        : Color(kSecondColor),
                    child: Icon(
                      Icons.check,
                      size: defaultSize,
                      color: authProvider.isRememberMe
                          ? Colors.white
                          : Color(kPrimaryColor),
                    ),
                  ),
                ),
                SizedBox(
                  width: defaultSize * 0.5,
                ),
                CustomText(
                  'Remember me',
                  fontSize: defaultSize * 1.7,
                  color: Color(kTextColor),
                ),
              ],
            );
          },
        ),
        InkWell(
          onTap: () {
            Get.to(ForgetPasswordScreen());
          },
          child: CustomText(
            'Forgot password?',
            fontSize: defaultSize * 1.7,
            color: Color(kTextColor),
          ),
        ),
      ],
    );
  }

  Widget buildTextFormFields(double defaultSize) {
    return Consumer<AuthProvider>(
      builder: (context, authProvider, _) {
        return Column(
          children: [
            CustomRoundedTextFormField(
              onSaved: (String? value) {
                email = value!;
              },
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter the email';
                if (!value.contains('@') || !value.contains('.'))
                  return 'Enter the right email';
                return null;
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
                  Icons.lock_outline,
                  size: defaultSize * 2.5,
                  color: Color(kPrimaryColor),
                ),
              ),
            ),
            SizedBox(
              height: defaultSize * 1.5,
            ),
            CustomRoundedTextFormField(
              onSaved: (String? value) {
                password = value!;
              },
              validator: (String? value) {
                if (value!.isEmpty) return 'Please enter the password';
                if (value.length < 5) return 'Password is too short';
                return null;
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
                  Icons.email,
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

  Column buildCenterTexts(double defaultSize) {
    return Column(
      children: [
        CustomText(
          'Welcome Back!',
          color: Colors.white,
          fontSize: defaultSize * 2.5,
        ),
        CustomText(
          'Login to continue Radio App',
          fontSize: defaultSize * 1.7,
          color: Color(kTextColor),
        ),
      ],
    );
  }

  Image buildCenterImage(double defaultSize) {
    return Image.asset(
      'assets/images/splash_screen.png',
      height: defaultSize * 9,
      width: defaultSize * 25,
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
