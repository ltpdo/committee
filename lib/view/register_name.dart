import 'package:committee/models/auth/register_model.dart';
import 'package:committee/view/select_tag_screen.dart';
import 'package:flutter/material.dart';
import 'package:profile_image_selector/profile_image_selector.dart';

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
  final ProfileImageSelector userImage = ProfileImageSelector(
    size: 100,
    backgroundColor: Colors.grey,
  );
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: GestureDetector(
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
                        height: size.height / 10,
                      ),
                      userImage,
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("使用する画像を選んでください"),
                      SizedBox(
                        height: size.height / 20,
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
                        height: size.height / 8.1,
                      ),
                      ElevatedButton(
                        onPressed: !_isLoading
                            ? () async {
                                setState(() {
                                  _isLoading = true;
                                });
                                await register
                                    .registerNameAndPicture(
                                      context,
                                      userImage,
                                    )
                                    .then((_) => setState(() {
                                          _isLoading = false;
                                        }))
                                    .then((_) => Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SelectTagScreen(
                                            urole: widget.urole,
                                          );
                                        })));
                              }
                            : null,
                        style: ButtonStyle(
                          backgroundColor: !_isLoading
                              ? MaterialStateProperty.all<Color>(Colors.red)
                              : MaterialStateProperty.all<Color>(Colors.grey),
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
              Center(
                child: _isLoading ? const CircularProgressIndicator() : null,
              )
            ]),
          )),
    );
  }
}
