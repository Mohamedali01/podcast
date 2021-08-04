import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kTextColor = 0xff7B7B8B;
const kPrimaryColor = 0xff7477A0;
const kSecondColor = 0xff1D192C;

String email = '';
String password = '';
String name = '';
String userId = '';

buildSnackBar(String title, String text) {
  Get.snackbar(
    title,
    text,
    backgroundColor: Colors.red,
    duration: Duration(
      seconds: 2,
    ),
  );
}
