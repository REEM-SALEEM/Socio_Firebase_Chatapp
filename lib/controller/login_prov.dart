import 'package:firebase_chatapp/pages/home_page.dart';
import 'package:firebase_chatapp/services/auth_services.dart';
import 'package:firebase_chatapp/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';

class LoginProv extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authservice = AuthService();

  bool isLoading = false;

  // login
  Future<void> login(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await authservice
        .loginWithUserNameandPassword(
      emailController.text,
      passwordController.text,
    )
        .then((value) {
      if (value == true) {
        isLoading = false;
        clearTextFields();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
        customSnackbar(
          context,
          message: 'Successfully Logged In',
          status: true,
        );
      } else {
        customSnackbar(
          context,
          message: value,
          status: false,
        );
      }
    });
    notifyListeners();
  }

  // validation

  emailValidation(String? val) {
    return RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(val!)
        ? null
        : "Please enter a valid email";
  }

  passwordValidation(String? val) {
    if (val!.length < 6) {
      return "Password must be at least 6 characters";
    } else {
      return null;
    }
  }

  // clear fields
  clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }
}
