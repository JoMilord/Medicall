import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC_bVVr62F3mfCeGvC7lecig8JpatCjJ9o",
            authDomain: "medicall-5e65b.firebaseapp.com",
            projectId: "medicall-5e65b",
            storageBucket: "medicall-5e65b.appspot.com",
            messagingSenderId: "66084415619",
            appId: "1:66084415619:web:4bd5439d55cf75a0f913b6",
            measurementId: "G-LT5JXPX1DQ"));
  } else {
    await Firebase.initializeApp();
  }
}
