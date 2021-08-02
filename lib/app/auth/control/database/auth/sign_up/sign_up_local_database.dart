import 'dart:convert';

import 'package:podcast_app/app/auth/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpLocalDatabase {
  static Future<void> saveData(UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    await sharedPreferences.setString('user', json.encode(userModel.toJson()));
  }

  static Future<UserModel> getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? data = sharedPreferences.getString('user');
    final map = json.decode(data!);
    return UserModel.fromJson(map);
  }
}
