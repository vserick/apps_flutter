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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCtT9AFlDEX_28dP-f57nNtXcRrPAXvsP0',
    appId: '1:629457049639:web:f2ab7edbe4430887e21602',
    messagingSenderId: '629457049639',
    projectId: 'boleiros-39fad',
    authDomain: 'boleiros-39fad.firebaseapp.com',
    storageBucket: 'boleiros-39fad.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBfJdGos5OZnO4cnNfBu2usT4SxIjq8Nyw',
    appId: '1:629457049639:android:161235ee83fb9d21e21602',
    messagingSenderId: '629457049639',
    projectId: 'boleiros-39fad',
    storageBucket: 'boleiros-39fad.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDcg8lfvQZr9oxLlWO1YDYcoyaPzSyjk_s',
    appId: '1:629457049639:ios:ee931b99875c4031e21602',
    messagingSenderId: '629457049639',
    projectId: 'boleiros-39fad',
    storageBucket: 'boleiros-39fad.appspot.com',
    iosBundleId: 'com.example.appFutebol',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCtT9AFlDEX_28dP-f57nNtXcRrPAXvsP0',
    appId: '1:629457049639:web:f53941fc7424a72be21602',
    messagingSenderId: '629457049639',
    projectId: 'boleiros-39fad',
    authDomain: 'boleiros-39fad.firebaseapp.com',
    storageBucket: 'boleiros-39fad.appspot.com',
  );
}
