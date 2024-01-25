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
    apiKey: 'AIzaSyButb8Ve9R5bsFP4P2vyo1uq37F5xqSGCk',
    appId: '1:146706591040:web:487d5862981495da0d1ea5',
    messagingSenderId: '146706591040',
    projectId: 'flutterblog-b0bed',
    authDomain: 'flutterblog-b0bed.firebaseapp.com',
    storageBucket: 'flutterblog-b0bed.appspot.com',
    measurementId: 'G-0SGTQ1KT2C',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDY2U7GubVeftvDlQpgdPQBbVOxZJJfD7c',
    appId: '1:146706591040:android:6b58f1b2ce95d0ee0d1ea5',
    messagingSenderId: '146706591040',
    projectId: 'flutterblog-b0bed',
    storageBucket: 'flutterblog-b0bed.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBvuLAZSSEBFOH4j7XFssOJkJgvLGf2GiI',
    appId: '1:146706591040:ios:7ee9ea9b05704f0e0d1ea5',
    messagingSenderId: '146706591040',
    projectId: 'flutterblog-b0bed',
    storageBucket: 'flutterblog-b0bed.appspot.com',
    iosClientId: '146706591040-lama63cptun2vamlegvaitie5304ua2i.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterBlog',
  );
}