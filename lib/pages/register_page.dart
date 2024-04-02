import 'package:firebase_chatapp/constants/size/size.dart';
import 'package:firebase_chatapp/controller/register_prov.dart';
import 'package:firebase_chatapp/pages/login_page.dart';
import 'package:firebase_chatapp/widgets/elevatedbutton_widget.dart';
import 'package:firebase_chatapp/widgets/textformfield_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<RegisterProv>(
          builder: (BuildContext context, value, Widget? child) {
            return Form(
              key: _formKeyRegister,
              child: value.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: const Column(children: [
                              Text(
                                "Socio",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              kHeight10,
                              Text(
                                  "Create your account now to chat and explore",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                            ])),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              customTextFormField(
                                controller: value.fullnameController,
                                context: context,
                                iconData: Icons.person,
                                labelText: 'Full Name',
                                validator: (val) =>
                                    value.textFormValidation(val),
                              ),
                              kHeight15,
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
                                validator: (val) =>
                                    value.passwordValidation(val),
                              ),
                              kHeight24,
                              customElevatedButton(
                                  context: context,
                                  onPressed: () {
                                    if (_formKeyRegister.currentState!
                                        .validate()) {
                                      value.register(context);
                                    }
                                  },
                                  title: 'Register'),
                              kHeight10,
                              Text.rich(TextSpan(
                                text: "Already have an account? ",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 14),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Login now",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.underline),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginPage(),
                                                  ),
                                                  (route) => false);
                                        }),
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
