import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions extends ChangeNotifier {
  // keys
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USEREMAILKEY";

  bool isLoggedIn = false;

  // SET
  Future<void> saveUserLoggedInStatus(bool status) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    await sf.setBool(userLoggedInKey, status);
    notifyListeners();
  }

  Future<void> saveUserNameSF(String status) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    notifyListeners();
    await sf.setString(userNameKey, status);
  }

  Future<void> saveUserEmailSF(String status) async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    notifyListeners();
    await sf.setString(userEmailKey, status);
  }

  // GET
  getUserLoggedInStatus() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    isLoggedIn = sf.getBool(userLoggedInKey) ?? false;
    notifyListeners();
  }

  static Future<String?> getUserEmailFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userEmailKey);
  }

  static Future<String?> getUserNameFromSF() async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getString(userNameKey);
  }
}
