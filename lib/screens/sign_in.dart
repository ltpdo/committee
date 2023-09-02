import 'package:committee/models/auth/sign_in_model.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignInScreenState();
  }
}

class SignInScreenState extends State<SignInScreen> {
  final SignInModel signIn = SignInModel();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "コミティ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width / 7,
                  ),
                ),
                SizedBox(
                  height: size.height / 5,
                ),
                //メールアドレス入力用テキストフィールド
                SizedBox(
                  width: size.width / 7 * 6,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "メールアドレス"),
                    onChanged: (String value) {
                      setState(() {
                        signIn.setEmail(value);
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                //パスワード入力用テキストフィールド
                SizedBox(
                  width: size.width / 7 * 6,
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "パスワード"),
                    onChanged: (String value) {
                      signIn.setPassword(value);
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                //ログインボタン
                ElevatedButton(
                  onPressed: () async {
                    if (signIn.email == null || signIn.password == null) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("おっとっと？"),
                              content: const FittedBox(
                                fit: BoxFit.fill,
                                child: Column(
                                  children: <Widget>[
                                    Text("すべてのテキストフォームを入力してください。"),
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
                    } else {
                      await signIn.signIn(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    elevation: MaterialStateProperty.all<double>(2.0),
                  ),
                  child: Text(
                    "ログイン",
                    style: TextStyle(
                      fontSize: size.width / 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
