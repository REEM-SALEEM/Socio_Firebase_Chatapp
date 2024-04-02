import 'dart:developer';
import 'package:firebase_chatapp/constants/size/size.dart';
import 'package:firebase_chatapp/controller/login_prov.dart';
import 'package:firebase_chatapp/pages/register_page.dart';
import 'package:firebase_chatapp/widgets/elevatedbutton_widget.dart';
import 'package:firebase_chatapp/widgets/textformfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final GlobalKey<FormState> _formKeyLogin = GlobalKey<FormState>();

  LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<LoginProv>(
          builder: (BuildContext context, value, Widget? child) {
            return Form(
              key: _formKeyLogin,
              child: Column(
                children: [
                  const Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(
                          "Socio",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        kHeight10,
                        Text("Login now to see what they are talking!",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400)),
                      ])),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        customTextFormField(
                          controller: value.emailController,
                          context: context,
                          iconData: Icons.email,
                          labelText: 'Email',
                          validator: (val) => value.emailValidation(val),
                        ),
                        kHeight15,
                        customTextFormField(
                          controller: value.passwordController,
                          context: context,
                          iconData: Icons.lock,
                          labelText: 'Password',
                          validator: (val) => value.passwordValidation(val),
                        ),
                        kHeight24,
                        customElevatedButton(
                            context: context,
                            onPressed: () {
                              if (_formKeyLogin.currentState!.validate()) {
                                value.login(context);
                              }
                            },
                            title: 'Login'),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ));
                            },
                            child: const Text('Sign Up here')),
                        kHeight10,
                        Text.rich(TextSpan(
                          text: "Don't have an account? ",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 14),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Register here",
                              style: const TextStyle(
                                  color: Colors.black,
                                  decoration: TextDecoration.underline),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  log('tapped');
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => RegisterPage(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
