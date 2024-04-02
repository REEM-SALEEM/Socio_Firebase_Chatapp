// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAp-WDR5XP93riAuzG-0jxYcfEphBXaxZU',
    appId: '1:810607576915:web:8ab83396b64c344f1d43a6',
    messagingSenderId: '810607576915',
    projectId: 'chatapp-fca35',
    authDomain: 'chatapp-fca35.firebaseapp.com',
    storageBucket: 'chatapp-fca35.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4U2xCEEhhRQWLgcwos8K8KB5H2jAFUII',
    appId: '1:810607576915:android:1cdf1d79e47eaab91d43a6',
    messagingSenderId: '810607576915',
    projectId: 'chatapp-fca35',
    storageBucket: 'chatapp-fca35.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCs6akyCmhh4VKwWWRPSXKy9-yMscHTmKk',
    appId: '1:810607576915:ios:fb5e3759060819621d43a6',
    messagingSenderId: '810607576915',
    projectId: 'chatapp-fca35',
    storageBucket: 'chatapp-fca35.appspot.com',
    iosBundleId: 'com.example.firebaseChatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCs6akyCmhh4VKwWWRPSXKy9-yMscHTmKk',
    appId: '1:810607576915:ios:9abf1b0ce371eef81d43a6',
    messagingSenderId: '810607576915',
    projectId: 'chatapp-fca35',
    storageBucket: 'chatapp-fca35.appspot.com',
    iosBundleId: 'com.example.firebaseChatapp.RunnerTests',
  );
}