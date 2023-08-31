import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
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
                SizedBox(
                  width: size.width / 7 * 6,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "ユーザーID"),
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                SizedBox(
                  width: size.width / 7 * 6,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "パスワード"),
                  ),
                ),
                SizedBox(
                  height: size.height / 10,
                ),
                ElevatedButton(
                  onPressed: () {},
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
