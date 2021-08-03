import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/view/login_screen.dart';
import 'package:podcast_app/constants.dart';

class ForgetPasswordProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> resetPassword(String localEmail) async {
    try {
      _isLoading = true;
      notifyListeners();
      print('Mohamed Ali: before reset');

      await _auth.sendPasswordResetEmail(email: localEmail);
      print('Mohamed Ali: after reset');

      Fluttertoast.showToast(
          msg: 'Email sent successfully!', toastLength: Toast.LENGTH_LONG);
      print('Mohamed Ali: before toast');

      _isLoading = false;
      notifyListeners();
      Get.offAll(LoginScreen());
    } on Exception catch (e) {
      print('Mohamed Ali: error occurred');

      _isLoading = false;
      notifyListeners();
      buildSnackBar('Error!', 'Error happened');
      Get.offAll(LoginScreen());
    }
  }
}
