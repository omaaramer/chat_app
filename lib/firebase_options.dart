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
    apiKey: 'AIzaSyBD7XSM6Sq1PVxBycxuajBzbuf2eGRiWzA',
    appId: '1:675697241268:web:0e42ef507cc1a66139fbe1',
    messagingSenderId: '675697241268',
    projectId: 'chat-app-19035',
    authDomain: 'chat-app-19035.firebaseapp.com',
    storageBucket: 'chat-app-19035.appspot.com',
    measurementId: 'G-Q4YGX7QQMG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB4fdAxabLD8rQby3FIpsSRf3l-t5xCUZY',
    appId: '1:675697241268:android:f4666a9ec708478839fbe1',
    messagingSenderId: '675697241268',
    projectId: 'chat-app-19035',
    storageBucket: 'chat-app-19035.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBgCtodTsfvfqUHkrZGvoXwVu4iBaWHPXQ',
    appId: '1:675697241268:ios:407c1b265375383039fbe1',
    messagingSenderId: '675697241268',
    projectId: 'chat-app-19035',
    storageBucket: 'chat-app-19035.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBgCtodTsfvfqUHkrZGvoXwVu4iBaWHPXQ',
    appId: '1:675697241268:ios:a78d4b490912f65f39fbe1',
    messagingSenderId: '675697241268',
    projectId: 'chat-app-19035',
    storageBucket: 'chat-app-19035.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
