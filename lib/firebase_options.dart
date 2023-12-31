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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyD7RpFcxCwBCMWMgdgy4krZRQS2loEHPJY',
    appId: '1:629643679559:web:babdf1112b48bd9f691e62',
    messagingSenderId: '629643679559',
    projectId: 'flutter-database-1d760',
    authDomain: 'flutter-database-1d760.firebaseapp.com',
    storageBucket: 'flutter-database-1d760.appspot.com',
    measurementId: 'G-3M51H7EKCX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB13PCB-3H1XhLz3_1d_NG-1KUhKJ6D0Js',
    appId: '1:629643679559:android:c80e17877c696647691e62',
    messagingSenderId: '629643679559',
    projectId: 'flutter-database-1d760',
    storageBucket: 'flutter-database-1d760.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBIra--33MIUH2yMPwAj7FQSTBEM5nefeE',
    appId: '1:629643679559:ios:7510077b91fab86d691e62',
    messagingSenderId: '629643679559',
    projectId: 'flutter-database-1d760',
    storageBucket: 'flutter-database-1d760.appspot.com',
    iosBundleId: 'com.example.firebaseFlutter',
  );
}
