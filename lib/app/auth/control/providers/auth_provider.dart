import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_local_database.dart';
import 'package:podcast_app/app/auth/model/user_model.dart';
import 'package:podcast_app/constants.dart';

class AuthProvider with ChangeNotifier {
  bool isRememberMe = false;
  bool isPasswordVisible = false;
  bool isEmailReceived = false;

  final _auth = FirebaseAuth.instance;

  // Ui handling

  void pressedRemember() {
    isRememberMe = !isRememberMe;
    notifyListeners();
  }

  void pressedVisiblePass() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void pressedReceiveEmails() {
    isEmailReceived = !isEmailReceived;
    notifyListeners();
  }

  // firebase Handling

  bool get isLogin {
    User? user = _auth.currentUser;
    return user != null;
  }

  Future<void> autoLogin() async {
    UserModel userModel = await SignUpLocalDatabase.getData();
    email = userModel.email!;
    name = userModel.name!;
    userId = userModel.userId!;
  }
}
