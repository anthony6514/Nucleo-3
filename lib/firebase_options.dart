// Archivo generado por FlutterFire CLI.
// INSTRUCCIONES:
// 1. Ve a https://console.firebase.google.com y crea un proyecto.
// 2. Registra tu app Android con el package name: com.taller.travelweather
// 3. Descarga google-services.json y colócalo en android/app/
// 4. Ejecuta: dart pub global activate flutterfire_cli
//    Luego: flutterfire configure
//    Esto reemplazará este archivo con tu configuración real.
// 5. Alternativamente, rellena manualmente los valores de abajo.

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
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions no está configurado para linux.'
          ' Ejecuta FlutterFire CLI para configurarlo.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions no está configurado para esta plataforma.',
        );
    }
  }

  // Configuración del proyecto Firebase: ea-store-f5e54
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDN_TlIs4PrgPNmiC53u6JqjXp0H4cnLGs',
    appId: '1:349134442254:android:8a8bc3cfe58b0b65ab515f', // Actualiza con el App ID Android de Firebase
    messagingSenderId: '349134442254',
    projectId: 'ea-store-f5e54',
    storageBucket: 'ea-store-f5e54.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDN_TlIs4PrgPNmiC53u6JqjXp0H4cnLGs',
    appId: '1:349134442254:ios:8a8bc3cfe58b0b65ab515f', // Actualiza con el App ID iOS de Firebase
    messagingSenderId: '349134442254',
    projectId: 'ea-store-f5e54',
    storageBucket: 'ea-store-f5e54.firebasestorage.app',
    iosBundleId: 'com.taller.travelweather',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDN_TlIs4PrgPNmiC53u6JqjXp0H4cnLGs',
    appId: '1:349134442254:web:8a8bc3cfe58b0b65ab515f',
    messagingSenderId: '349134442254',
    projectId: 'ea-store-f5e54',
    authDomain: 'ea-store-f5e54.firebaseapp.com',
    storageBucket: 'ea-store-f5e54.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDN_TlIs4PrgPNmiC53u6JqjXp0H4cnLGs',
    appId: '1:349134442254:macos:8a8bc3cfe58b0b65ab515f', // Actualiza con el App ID macOS si aplica
    messagingSenderId: '349134442254',
    projectId: 'ea-store-f5e54',
    storageBucket: 'ea-store-f5e54.firebasestorage.app',
    iosBundleId: 'com.taller.travelweather',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDN_TlIs4PrgPNmiC53u6JqjXp0H4cnLGs',
    appId: '1:349134442254:web:8a8bc3cfe58b0b65ab515f',
    messagingSenderId: '349134442254',
    projectId: 'ea-store-f5e54',
    storageBucket: 'ea-store-f5e54.firebasestorage.app',
  );
}
