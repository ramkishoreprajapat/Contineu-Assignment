import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwh1jIeiDaVbwPm1pWR3Qo3EkBuqD8l_0',
    appId: '1:768777817488:android:629e1387a94bece1e93715',
    messagingSenderId: '768777817488',
    projectId: 'contineu-assignment',
    storageBucket: 'contineu-assignment.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDx29V__yhqzrDVZGEGz07qeCK2AC1twwc',
    appId: '1:768777817488:ios:3d79062624c852fce93715',
    messagingSenderId: '768777817488',
    projectId: 'contineu-assignment',
    storageBucket: 'contineu-assignment.firebasestorage.app',
    iosBundleId: 'com.example.contineuAssignment',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDnUp0VedaequtRGpEDJvl7W-eMT-ToB_o',
    appId: '1:768777817488:web:435e92e8a2cff3e2e93715',
    messagingSenderId: '768777817488',
    projectId: 'contineu-assignment',
    authDomain: 'contineu-assignment.firebaseapp.com',
    storageBucket: 'contineu-assignment.firebasestorage.app',
    measurementId: 'G-0D320MN9LT',
  );
}
