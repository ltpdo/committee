import 'package:committee/models/auth/register_model.dart';
import 'package:flutter/material.dart';

class RegisterName extends StatefulWidget {
  final String urole;
  const RegisterName({required this.urole, super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterNameState();
  }
}

class RegisterNameState extends State<RegisterName> {
  final RegisterModel register = RegisterModel();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: GestureDetector(
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
                      height: size.height / 12 * 2.8,
                    ),
                    //名前入力用テキストフィールド
                    SizedBox(
                      width: size.width / 7 * 6,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "名前"),
                        onChanged: (String value) {
                          setState(() {
                            register.setName(value);
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height / 5,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        register.registerName(context, widget.urole);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        elevation: MaterialStateProperty.all<double>(2.0),
                      ),
                      child: Text(
                        "名前を登録",
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
          )),
    );
  }
}
