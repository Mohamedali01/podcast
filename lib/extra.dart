// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:podcast/constants.dart';
// import 'package:podcast/widgets/custom_rounded_button.dart';
// import 'package:podcast/widgets/custom_rounded_text_form_field.dart';
// import 'package:podcast/widgets/custom_text.dart';
//
// class LoginScreen extends StatelessWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(kPrimaryColor),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 30, right: 30),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 81.87.w,
//               ),
//               Center(
//                 child: Image.asset(
//                   'assets/images/splash_screen.png',
//                   width: 252.52.w,
//                   height: 86.13.w,
//                 ),
//               ),
//               SizedBox(
//                 height: 23.w,
//               ),
//               CustomText('Welcome Back!',
//                   width: 134.w,
//                   height: 27.w,
//                   fontSize: 20.sp,
//                   color: Colors.white,
//                   fontWeight: FontWeight.w400),
//               CustomText('Login to continue Radio App',
//                   width: 178.w,
//                   height: 19.w,
//                   fontSize: 20.sp,
//                   color: Color(kTextColor),
//                   fontWeight: FontWeight.w400),
//               SizedBox(
//                 height: 26.w,
//               ),
//               Form(
//                 child: Column(
//                   children: [
//                     CustomRoundedTextFormField(
//                       radius: 10,
//                       width: double.infinity,
//                       color: 0xff1D192C,
//                       height: 60,
//                       prefixIcon: Container(
//                         width: 14.94.w,
//                         height: 10.62.w,
//                         child: Icon(
//                           Icons.email,
//                           color: Color(kSecondColor),
//                         ),
//                       ),
//                       hintText: 'Email Address',
//                     ),
//                     SizedBox(
//                       height: 18.w,
//                     ),
//                     CustomRoundedTextFormField(
//                       height: 60,
//                       radius: 10,
//                       width: double.infinity,
//                       color: 0xff1D192C,
//                       prefixIcon: Container(
//                         width: 14.94.w,
//                         height: 10.62.w,
//                         child: Icon(
//                           Icons.lock_outline,
//                           color: Color(kSecondColor),
//                         ),
//                       ),
//                       hintText: 'Password',
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 16.w,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 16.w,
//                         height: 16.w,
//                         child: CircleAvatar(
//                           backgroundColor: Color(0xff1D192C),
//                           child: Icon(
//                             Icons.check,
//                             color: Color(kSecondColor),
//                             size: 7.w,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: 6.w,
//                       ),
//                       CustomText('Remember me',
//                           width: 77.w,
//                           height: 16.w,
//                           color: Color(kTextColor),
//                           fontSize: 12.sp),
//                     ],
//                   ),
//                   Container(
//                     width: 94.w,
//                     height: 16.w,
//                     child: CustomText('Forgot password?',
//                         color: Color(kTextColor), fontSize: 12.sp),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 28.w,
//               ),
//               CustomRoundedButton(
//                 width: double.infinity,
//                 height: 48.w,
//                 child: Center(
//                   child: CustomText(
//                     'Log In',
//                     width: 44.w,
//                     height: 21.w,
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//                 color: Color(0xffF11775),
//               ),
//               SizedBox(
//                 height: 19.w,
//               ),
//               Center(
//                 child: CustomText(
//                   'OR',
//                   color: Color(kTextColor),
//                   height: 16.w,
//                   width: 16.w,
//                   fontSize: 12.sp,
//                 ),
//               ),
//               SizedBox(
//                 height: 20.w,
//               ),
//               SocialButton(
//                 backgroundColor: Colors.white,
//                 text: 'Continue with Google',
//                 image: 'assets/images/google.svg',
//                 textColor: Colors.black,
//               ),
//               SizedBox(
//                 height: 13.w,
//               ),
//               SocialButton(
//                 backgroundColor: Color(0xff39579A),
//                 text: 'Continue with Facebook',
//                 image: 'assets/images/facebook.svg',
//                 iconColor: Colors.white,
//                 textColor: Colors.white,
//               ),
//               SizedBox(
//                 height: 29.w,
//               ),
//               Container(
//                 width: 168.w,
//                 height: 16.w,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomText(
//                       'Don\'t have an account?',
//                       width: 120.w,
//                       color: Color(kTextColor),
//                       fontSize: 12.sp,
//                     ),
//                     CustomText(
//                       ' Sign up',
//                       color: Color(0xffFB6580),
//                       width: 48.w,
//                       fontSize: 12.sp,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 54.w,
//               ),
//               Column(
//                 children: [
//                   CustomText(
//                     'By signing up you indicate that you have read and',
//                     width: 164.w,
//                     fontSize: 8.sp,
//                     color: Color(kTextColor),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CustomText(
//                         'agreed to the Patch ',
//                         width: 70.w,
//                         color: Color(kTextColor),
//                         fontSize: 8.sp,
//                       ),
//                       CustomText(
//                         'Terms of Service',
//                         width: 50.w,
//                         color: Color(0xffFB6580),
//                         fontSize: 8.sp,
//                       ),
//                     ],
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SocialButton extends StatelessWidget {
//   final String image;
//   final String text;
//   final Color backgroundColor;
//   final Color textColor;
//   final Color? iconColor;
//
//   SocialButton(
//       {required this.image,
//         required this.text,
//         required this.backgroundColor,
//         required this.textColor,
//         this.iconColor});
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomRoundedButton(
//       color: backgroundColor,
//       width: double.infinity,
//       height: 48.w,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             image,
//             color: iconColor,
//             width: 18.w,
//             height: 18.w,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(
//             width: 30.w,
//           ),
//           CustomText(
//             text,
//             color: textColor,
//             width: 116.w,
//             height: 16.h,
//           )
//         ],
//       ),
//     );
//   }
// }
