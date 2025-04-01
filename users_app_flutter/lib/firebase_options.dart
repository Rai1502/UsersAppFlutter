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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6BPmnRA57ZzwlWkp8kYBVj3SlUiBO6Q4',
    appId: '1:139376456594:android:191264d2094de0cd12474b',
    messagingSenderId: '139376456594',
    projectId: 'flutter-varios-70df3',
    databaseURL: 'https://flutter-varios-70df3-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-varios-70df3.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWi2CTR2JgowHjslwfnC4rQw5wrzHMAok',
    appId: '1:139376456594:ios:c328cd4c1b2245df12474b',
    messagingSenderId: '139376456594',
    projectId: 'flutter-varios-70df3',
    databaseURL: 'https://flutter-varios-70df3-default-rtdb.firebaseio.com',
    storageBucket: 'flutter-varios-70df3.firebasestorage.app',
    iosBundleId: 'com.raidev.usersFlutter',
  );
}
