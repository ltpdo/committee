import 'package:committee/models/auth/register_model.dart';
import 'package:committee/view/register_name.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  final String urole;
  const SignUpScreen({Key? key, required this.urole}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  final RegisterModel register = RegisterModel();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(children: [
          Center(
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
                      obscureText: true,
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
                    onPressed: !_isLoading
                        ? () async {
                            if (register.email == null ||
                                register.password == null) {
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
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                      ],
                                    );
                                  });
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      title: const Text("よろしいですか？"),
                                      content: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Column(
                                          children: <Widget>[
                                            const Text("以下の内容でアカウントを作成しますか？"),
                                            const Text("メールアドレス"),
                                            Text(register.email!),
                                            const Text("パスワード"),
                                            Text(register.password!),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text(
                                              "Cancel",
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                        TextButton(
                                          onPressed: () async {
                                            setState(() {
                                              _isLoading = true;
                                            });
                                            Navigator.pop(context);
                                            await register
                                                .signUp(
                                                  context,
                                                  widget.urole,
                                                )
                                                .then((_) => setState(() {
                                                      _isLoading = false;
                                                    }))
                                                .then((_) =>
                                                    Navigator.push(context,
                                                        MaterialPageRoute(
                                                            builder: (context) {
                                                      return RegisterName(
                                                        urole: widget.urole,
                                                      );
                                                    })));
                                          },
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor: !_isLoading
                          ? MaterialStateProperty.all<Color>(Colors.red)
                          : MaterialStateProperty.all<Color>(Colors.grey),
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
          Center(
            child: _isLoading ? const CircularProgressIndicator() : null,
          )
        ]),
      ),
    );
  }
}
