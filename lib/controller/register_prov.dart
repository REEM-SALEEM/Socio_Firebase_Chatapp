import 'package:firebase_chatapp/controller/helper_functions.dart';
import 'package:firebase_chatapp/pages/home_page.dart';
import 'package:firebase_chatapp/services/auth_services.dart';
import 'package:firebase_chatapp/widgets/snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterProv extends ChangeNotifier {
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  AuthService authservice = AuthService();

  bool isLoading = false;

  // register
  Future<void> register(BuildContext context) async {
    isLoading = true;
    notifyListeners();
    await authservice
        .registerUserWithEmailandPassword(
      fullnameController.text,
      emailController.text,
      passwordController.text,
    )
        .then((value) {
      if (value == true) {
        Provider.of<HelperFunctions>(context, listen: false)
            .saveUserLoggedInStatus(true);
        clearTextFields();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
            (route) => false);
        isLoading = false;
        customSnackbar(
          context,
          message: 'Successfully LoggedIn',
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
  textFormValidation(String? val) {
    if (val!.isNotEmpty) {
      return null;
    } else {
      return "Name cannot be empty";
    }
  }

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
    fullnameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
