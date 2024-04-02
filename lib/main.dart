import 'dart:developer';
import 'package:firebase_chatapp/controller/helper_functions.dart';
import 'package:firebase_chatapp/controller/login_prov.dart';
import 'package:firebase_chatapp/controller/register_prov.dart';
import 'package:firebase_chatapp/pages/login_page.dart';
import 'package:firebase_chatapp/shared/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: kIsWeb
        ? FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId,
          )
        : DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences sf = await SharedPreferences.getInstance();
  bool isLoggedIn = sf.getBool("LOGGEDINKEY") ?? false;
  log('isLoggedIn --> ${isLoggedIn.toString()}');
  runApp(MyApp(
    isLoggedIn: isLoggedIn,
  ));
}

class MyApp extends StatelessWidget {
  final bool? isLoggedIn;
  const MyApp({super.key, this.isLoggedIn});

  // @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HelperFunctions()),
        ChangeNotifierProvider(create: (_) => RegisterProv()),
        ChangeNotifierProvider(create: (_) => LoginProv()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isLoggedIn! ? LoginPage() : LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// C:\Users\reems\AppData\Local\Android\Sdk