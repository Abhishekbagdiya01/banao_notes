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
    apiKey: 'AIzaSyB5V1DaTefwfzDyRXpMQrwbx_na2QpufV4',
    appId: '1:239860720162:web:0edfc6e7bbf26e8193207b',
    messagingSenderId: '239860720162',
    projectId: 'notecraft-a6e1a',
    authDomain: 'notecraft-a6e1a.firebaseapp.com',
    storageBucket: 'notecraft-a6e1a.appspot.com',
    measurementId: 'G-SDG26WHKVZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaQJds6A_h70RPi07EPpEgjNYF6gUjt64',
    appId: '1:239860720162:android:662dc5a8b76441dd93207b',
    messagingSenderId: '239860720162',
    projectId: 'notecraft-a6e1a',
    storageBucket: 'notecraft-a6e1a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRzcrK-P2WtNbHh4p0ZUcYigZQyotm0oc',
    appId: '1:239860720162:ios:bfa49cabedeea73693207b',
    messagingSenderId: '239860720162',
    projectId: 'notecraft-a6e1a',
    storageBucket: 'notecraft-a6e1a.appspot.com',
    iosClientId:
        '239860720162-iqdgd1ha399m7257b3t4ivut0vbad75u.apps.googleusercontent.com',
    iosBundleId: 'com.example.noteApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRzcrK-P2WtNbHh4p0ZUcYigZQyotm0oc',
    appId: '1:239860720162:ios:22b59cde49aaf48d93207b',
    messagingSenderId: '239860720162',
    projectId: 'notecraft-a6e1a',
    storageBucket: 'notecraft-a6e1a.appspot.com',
    iosClientId:
        '239860720162-tjkm1kpp0at5mou4hdm8digbln0gj00d.apps.googleusercontent.com',
    iosBundleId: 'com.example.noteApp.RunnerTests',
  );
}
