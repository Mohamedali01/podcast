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
      print(
          'SignUpRemoteDatabase  saveUserDataRemotely error: ${e.toString()}');
    }
  }

  static Future<UserModel?> getUserDataRemotely(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _cloud.collection("users").doc(uid).get();
      Map<dynamic, dynamic> map =
          documentSnapshot.data() as Map<dynamic, dynamic>;
      return UserModel.fromJson(map);
    } on Exception catch (e) {
      buildSnackBar('Error!', 'Error while registering');
      print('SignUpRemoteDatabase getUserDataRemotely error: ${e.toString()}');
    }
  }
}
