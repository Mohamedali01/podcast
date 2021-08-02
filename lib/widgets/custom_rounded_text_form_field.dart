import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/app/auth/control/providers/auth_provider.dart';
import 'package:podcast_app/constants.dart';
import 'package:podcast_app/app/core/size_config.dart';
import 'package:provider/provider.dart';

class CustomRoundedTextFormField extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final int color;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffix;
  final bool isPasswordVisible;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomRoundedTextFormField(
      {this.width,
      this.height,
      this.radius = 10,
      required this.color,
      this.prefixIcon,
      this.hintText,
      this.suffix,
      this.isPasswordVisible = false,
      required this.onSaved,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    return Consumer<AuthProvider>(builder: (context, auth, _) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Color(color),
          width: width,
          height: height,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            obscureText: isPasswordVisible
                ? (auth.isPasswordVisible ? false : true)
                : false,
            style: TextStyle(color: Colors.white),
            cursorColor: Color(kPrimaryColor),
            // scrollPadding: EdgeInsets.all(0),
            decoration: InputDecoration(
              labelText: hintText,
              labelStyle: TextStyle(color: Color(kPrimaryColor)),
              // focusColor: Colors.white,
              // hoverColor: Colors.white,
              // fillColor: Colors.green,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              // contentPadding: EdgeInsets.only(left: 10,top: 5.w),
              prefixIcon: prefixIcon,
              suffixIcon: suffix,

              // hintText: hintText,
              hintStyle: TextStyle(
                  color: Color(kPrimaryColor),
                  fontWeight: FontWeight.w400,
                  fontSize: defaultSize * 1.5),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(radius),
              ),
            ),
          ),
        ),
      );
    });
  }
}
