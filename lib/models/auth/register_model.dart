import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterModel {
  String? email;
  String? password;

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  void _errorDialog(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text("おっとっと？"),
            content: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                children: <Widget>[
                  Text(message),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "OK",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future signUp(BuildContext context, String urole) async {
    if (email != null && password != null) {
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        final User? user = userCredential.user;
        final String uid = user!.uid;
        //firestoreに追加
        final doc = FirebaseFirestore.instance.collection('user');
        await doc.add({
          'email': user.email,
          'uid': uid,
          'name': "",
          'urole': urole,
          'picture': "",
        });
        // ignore: use_build_context_synchronously
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const HomeScreen();
        }));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // ignore: use_build_context_synchronously
          _errorDialog(context, 'パスワードは６文字以上にしてください。');
        } else if (e.code == 'email-already-in-use') {
          // ignore: use_build_context_synchronously
          _errorDialog(context, 'このメールアドレスはすでに登録されています。');
        }
      } catch (e) {
        // ignore: use_build_context_synchronously
        _errorDialog(context, '予期せぬエラーが発生しました。\nお手数ですが、もう一度やり直してください。');
      }
    }
  }
}
