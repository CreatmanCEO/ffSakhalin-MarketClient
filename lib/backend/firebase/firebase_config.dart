import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDIbe4JyWKPHbXdmWq_njcQhuMpdDcK0hs",
            authDomain: "marketsakh-ad3a8.firebaseapp.com",
            projectId: "marketsakh-ad3a8",
            storageBucket: "marketsakh-ad3a8.appspot.com",
            messagingSenderId: "722615212666",
            appId: "1:722615212666:web:75b6809e9f3b85e6c6b9c3"));
  } else {
    await Firebase.initializeApp();
  }
}
