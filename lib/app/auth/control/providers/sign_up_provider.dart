import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_local_database.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_remote_database.dart';
import 'package:podcast_app/app/auth/model/user_model.dart';
import 'package:podcast_app/app/home/view/home_screen.dart';
import 'package:podcast_app/constants.dart';

class SignUpProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  final _auth = FirebaseAuth.instance;

  Future<void> signUp() async {
    try {
      _isLoading = true;
      notifyListeners();
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      userId = userCredential.user!.uid;
      notifyListeners();
      UserModel userModel = UserModel(email: email, name: name, userId: userId);
      await SignUpRemoteDatabase.saveUserDataRemotely(userModel);
      await SignUpLocalDatabase.saveData(userModel);
      _isLoading = false;
      Get.to(HomeScreen());
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      Get.snackbar('Error', 'Error in email or password');
    }
  }
}
