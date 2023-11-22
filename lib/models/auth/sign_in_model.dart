import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInModel {
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

  Future signIn(BuildContext context) async {
    if (email != null && password != null) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email!,
          password: password!,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          // ignore: use_build_context_synchronously
          _errorDialog(context, 'アカウントが存在しません。');
        } else if (e.code == 'wrong-password') {
          // ignore: use_build_context_synchronously
          _errorDialog(context, 'パスワードが間違っています。');
        }
      } catch (e) {
        // ignore: use_build_context_synchronously
        _errorDialog(context, '予期せぬエラーが発生しました。\nお手数ですが、もう一度やり直してください。');
      }
    }
  }
}
