import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_local_database.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_remote_database.dart';
import 'package:podcast_app/app/auth/model/user_model.dart';
import 'package:podcast_app/app/home/view/home_screen.dart';
import 'package:podcast_app/constants.dart';

class FacebookLoginProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  FacebookLogin _facebookLogin = FacebookLogin();

  Future<void> facebookLogin({bool isLogin = false}) async {
    _isLoading = true;
    notifyListeners();
    final FacebookLoginResult facebookLoginResult =
        await _facebookLogin.logIn(['email']);
    String accessToken = facebookLoginResult.accessToken.token;
    final OAuthCredential credential =
        FacebookAuthProvider.credential(accessToken);
    await _auth.signInWithCredential(credential).then((cred) async {
      userId = cred.user!.uid;
      name = cred.user!.displayName!;
      email = cred.user!.email!;
      notifyListeners();
      UserModel userModel = UserModel(userId: userId, name: name, email: email);
      await SignUpRemoteDatabase.saveUserDataRemotely(userModel);
      await SignUpLocalDatabase.saveData(userModel);
      _isLoading = false;
      notifyListeners();
      Get.offAll(HomeScreen());
      Fluttertoast.showToast(
          msg: '${(isLogin ? 'Logged in' : 'Signed up')} successfully');
    });
  }
}
