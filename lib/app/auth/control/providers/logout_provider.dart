import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/view/login_screen.dart';
import 'package:podcast_app/constants.dart';

class LogoutProvider with ChangeNotifier {
  Future<void> logout() async {
    try {
      final _auth = FirebaseAuth.instance;
      await _auth.signOut();
      email = '';
      password = '';
      userId = '';
      password = '';
      notifyListeners();
      Get.offAll(LoginScreen());
    } on Exception catch (e) {
      print('Mohamed Ali: LogoutProvider logout error: ${e.toString()}');
      buildSnackBar('Error', 'An error occurred while logout');
    }
  }
}
