import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_local_database.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_remote_database.dart';
import 'package:podcast_app/app/auth/model/user_model.dart';
import 'package:podcast_app/app/home/view/home_screen.dart';
import 'package:podcast_app/constants.dart';

class LoginProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> login(String localEmail, String localPassword) async {
    try {
      _isLoading = true;
      notifyListeners();
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: localEmail, password: localPassword);
      userId = userCredential.user!.uid;
      UserModel? userModel =
          await SignUpRemoteDatabase.getUserDataRemotely(userId);
      name = userModel!.name!;
      email = userModel.email!;
      await SignUpLocalDatabase.saveData(userModel);
      _isLoading = false;
      notifyListeners();
      Get.to(HomeScreen());
    } on Exception catch (e) {
      _isLoading = false;
      notifyListeners();
      print('Mohamed Ali: LoginProvider, loginError: ${e.toString()}');
      buildSnackBar('Error!', 'An error occurred ');
    }
  }
}
