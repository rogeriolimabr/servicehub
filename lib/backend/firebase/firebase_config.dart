import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDX-E1vMfSKIx6MKKsaIz-euIjtrlT37lA",
            authDomain: "servicehub-38097.firebaseapp.com",
            projectId: "servicehub-38097",
            storageBucket: "servicehub-38097.appspot.com",
            messagingSenderId: "97567262644",
            appId: "1:97567262644:web:b30a5497b300a9ba9354e1",
            measurementId: "G-RFLB0YQP82"));
  } else {
    await Firebase.initializeApp();
  }
}
