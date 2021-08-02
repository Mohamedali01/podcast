import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:podcast_app/app/auth/model/user_model.dart';
import 'package:podcast_app/constants.dart';

class SignUpRemoteDatabase {
  static final _cloud = FirebaseFirestore.instance;

  static Future<void> saveUserDataRemotely(UserModel userModel) async {
    try {
      await _cloud.collection("users").doc(userId).set(userModel.toJson());
    } on Exception catch (e) {
      buildSnackBar('Error!', 'Error while registering');
      print('SignUpRemoteDatabase error: ${e.toString()}');
    }
  }
}
