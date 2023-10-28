import 'package:committee/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.pop(
          context,
        );
      },
      style: TextButton.styleFrom(
        foregroundColor: const Color.fromRGBO(233, 50, 5, 0.705),
        textStyle: const TextStyle(
          fontSize: 30,
        ),
      ),
      child: const Text('サインアウト'),
    );
  }
}
