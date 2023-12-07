import 'package:committee/component/bottom_navigation_bar/main_page_dtate.dart';
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
                    onPressed: !_isLoading
                        ? () async {
                            if (signIn.email == null ||
                                signIn.password == null) {
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
                              setState(() {
                                _isLoading = true;
                              });
                              await signIn
                                  .signIn(context)
                                  .then((_) => setState(() {
                                        _isLoading = false;
                                      }))
                                  .then((_) => Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const MainPageState();
                                      })));
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
          Center(
            child: _isLoading ? const CircularProgressIndicator() : null,
          )
        ]),
      ),
    );
  }
}
