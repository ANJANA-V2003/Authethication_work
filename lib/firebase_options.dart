// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCh0-CVcLyDkZu9FMUA-2E-csjlN_kGwbs',
    appId: '1:643524391606:web:e2afc3affc09376687ac17',
    messagingSenderId: '643524391606',
    projectId: 'authentication-e24b2',
    authDomain: 'authentication-e24b2.firebaseapp.com',
    storageBucket: 'authentication-e24b2.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_0SMILYKrZMi-tD26V8ebi-1AyV1BhQA',
    appId: '1:643524391606:android:25807cf82edf6a9587ac17',
    messagingSenderId: '643524391606',
    projectId: 'authentication-e24b2',
    storageBucket: 'authentication-e24b2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbWNvnHRc7Epr7nkuCSUTU3z3h1Mgue2o',
    appId: '1:643524391606:ios:a6c36b2cb0842b4387ac17',
    messagingSenderId: '643524391606',
    projectId: 'authentication-e24b2',
    storageBucket: 'authentication-e24b2.firebasestorage.app',
    iosBundleId: 'com.example.authenticationWork',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbWNvnHRc7Epr7nkuCSUTU3z3h1Mgue2o',
    appId: '1:643524391606:ios:a6c36b2cb0842b4387ac17',
    messagingSenderId: '643524391606',
    projectId: 'authentication-e24b2',
    storageBucket: 'authentication-e24b2.firebasestorage.app',
    iosBundleId: 'com.example.authenticationWork',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCh0-CVcLyDkZu9FMUA-2E-csjlN_kGwbs',
    appId: '1:643524391606:web:8e5de1976b6a8a5787ac17',
    messagingSenderId: '643524391606',
    projectId: 'authentication-e24b2',
    authDomain: 'authentication-e24b2.firebaseapp.com',
    storageBucket: 'authentication-e24b2.firebasestorage.app',
  );
}