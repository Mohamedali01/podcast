import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_local_database.dart';
import 'package:podcast_app/app/auth/control/database/auth/sign_up/sign_up_remote_database.dart';
import 'package:podcast_app/app/auth/model/user_model.dart';
import 'package:podcast_app/app/home/view/home_screen.dart';
import 'package:podcast_app/constants.dart';

class GoogleLoginProvider with ChangeNotifier {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> googleLogin() async {
    try {
      _isLoading = true;
      notifyListeners();
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      OAuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      _auth.signInWithCredential(credential).then(
        (cred) async {
          userId = cred.user!.uid;
          name = cred.user!.displayName!;
          email = cred.user!.email!;
          notifyListeners();
          UserModel userModel =
              UserModel(userId: userId, name: name, email: email);
          await SignUpRemoteDatabase.saveUserDataRemotely(userModel);
          await SignUpLocalDatabase.saveData(userModel);
          _isLoading = false;
          notifyListeners();
          Get.offAll(HomeScreen());
        },
      );
    } on Exception catch (e) {
      _isLoading = false;
      notifyListeners();
      buildSnackBar('Error!', 'Error while login while google account');
      print(
          'Mohamed Ali: GoogleLoginProvider googleLogin error: ${e.toString()}');
    }
  }
}
