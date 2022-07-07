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
    apiKey: 'AIzaSyB3wbMyw8-5XubAoXKDPchslBf8Me1xfJw',
    appId: '1:865669750356:web:c9da9cb3cd77987e6f57c1',
    messagingSenderId: '865669750356',
    projectId: 'shop-app-71a88',
    authDomain: 'shop-app-71a88.firebaseapp.com',
    storageBucket: 'shop-app-71a88.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD_3xFc_tJEx6RGpCHSs3m2_OwNtVbcf9g',
    appId: '1:865669750356:android:901eabb8686a53056f57c1',
    messagingSenderId: '865669750356',
    projectId: 'shop-app-71a88',
    storageBucket: 'shop-app-71a88.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwsnRDfeX0eLZLhXeWSGR7e_9raIDexwA',
    appId: '1:865669750356:ios:7e06b7294ef71c136f57c1',
    messagingSenderId: '865669750356',
    projectId: 'shop-app-71a88',
    storageBucket: 'shop-app-71a88.appspot.com',
    iosClientId: '865669750356-0ajr2t0kl1k2oqhscd5hq60fiohvaebs.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterShopAppWithProvider',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwsnRDfeX0eLZLhXeWSGR7e_9raIDexwA',
    appId: '1:865669750356:ios:7e06b7294ef71c136f57c1',
    messagingSenderId: '865669750356',
    projectId: 'shop-app-71a88',
    storageBucket: 'shop-app-71a88.appspot.com',
    iosClientId: '865669750356-0ajr2t0kl1k2oqhscd5hq60fiohvaebs.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterShopAppWithProvider',
  );
}