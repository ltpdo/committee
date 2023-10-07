import 'package:committee/app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //Firebaseの初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    /*
    ProviderScope() ... Riverpodを使用できるクラスを指定する
    runAppeメソッドに渡すクラスをこれでラップすることでアプリ全体でRiverpodが使用できるようになる
    */
    const ProviderScope(child: MyApp()),
  );
}
