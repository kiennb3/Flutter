
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDttVyvRPF6aW_E5Rzau8WsMzjtrZEUA6Q',
    appId: '1:403993906895:web:191b31215480406f1931ba',
    messagingSenderId: '403993906895',
    projectId: 'demoflutterfirebase-2e5e3',
    authDomain: 'demoflutterfirebase-2e5e3.firebaseapp.com',
    storageBucket: 'demoflutterfirebase-2e5e3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBSrtMxvXoavJf6blh1hynsRXjNAGoBkI4',
    appId: '1:403993906895:android:bd1d38e5e8be45f31931ba',
    messagingSenderId: '403993906895',
    projectId: 'demoflutterfirebase-2e5e3',
    storageBucket: 'demoflutterfirebase-2e5e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA397zXETBPfVtLq7JaX9R5knQsfP3ND6o',
    appId: '1:403993906895:ios:dfbeb1acc2f0e3961931ba',
    messagingSenderId: '403993906895',
    projectId: 'demoflutterfirebase-2e5e3',
    storageBucket: 'demoflutterfirebase-2e5e3.appspot.com',
    iosBundleId: 'com.example.day1206',
  );
}
