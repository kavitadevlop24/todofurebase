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
    apiKey: 'AIzaSyA12zZr0tf5RWy4SL0GwYrxnHQSQFXxIfQ',
    appId: '1:754310410427:web:3e9e0529160523bf4a399e',
    messagingSenderId: '754310410427',
    projectId: 'fluttrefire',
    authDomain: 'fluttrefire.firebaseapp.com',
    storageBucket: 'fluttrefire.appspot.com',
    measurementId: 'G-V7BXHH4PVG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRyak6Yb-tMxm5bkHC8l3RWcSHSrwCB60',
    appId: '1:754310410427:android:b8c237add4336d6f4a399e',
    messagingSenderId: '754310410427',
    projectId: 'fluttrefire',
    storageBucket: 'fluttrefire.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmlR25LhUqeYPJlHLC0KlohlHuXwQc11A',
    appId: '1:754310410427:ios:defaf95fdcad99704a399e',
    messagingSenderId: '754310410427',
    projectId: 'fluttrefire',
    storageBucket: 'fluttrefire.appspot.com',
    iosBundleId: 'com.example.todoApplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmlR25LhUqeYPJlHLC0KlohlHuXwQc11A',
    appId: '1:754310410427:ios:defaf95fdcad99704a399e',
    messagingSenderId: '754310410427',
    projectId: 'fluttrefire',
    storageBucket: 'fluttrefire.appspot.com',
    iosBundleId: 'com.example.todoApplication',
  );
}