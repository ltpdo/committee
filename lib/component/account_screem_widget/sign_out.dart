import 'package:committee/view/welcome.dart'; //1
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignOut extends StatelessWidget {
  const SignOut({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text("サインアウトしますか？"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      () => Navigator.pop(context);
                      () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Welcome()));
                    },
                  ),
                ],
              );
            });
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
