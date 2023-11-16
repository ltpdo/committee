import 'package:committee/view/welcome.dart';
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
                      BuildContext currentContext =
                          context; // 非同期処理の前にBuildContextを保存

                      await FirebaseAuth.instance.signOut();

                      // 非同期処理が完了した後に保存したBuildContextを使用
                      Future.delayed(Duration.zero, () {
                        Navigator.pop(currentContext); // 前の画面に戻る
                        Navigator.push(
                          currentContext,
                          MaterialPageRoute(
                            builder: (context) => const Welcome(),
                          ),
                        ); // Welcome画面に遷移
                      });
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
