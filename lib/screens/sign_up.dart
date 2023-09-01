import 'package:committee/models/register_model.dart';
import 'package:committee/screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  final RegisterModel register = RegisterModel();

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
                        register.setEmail(value);
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
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: "パスワード"),
                    onChanged: (String value) {
                      register.setPassword(value);
                    },
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                //アカウント作成ボタン
                ElevatedButton(
                  onPressed: () async {
                    await register.signUp();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    elevation: MaterialStateProperty.all<double>(2.0),
                  ),
                  child: Text(
                    "アカウント作成",
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
