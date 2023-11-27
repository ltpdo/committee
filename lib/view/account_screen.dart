import 'package:committee/component/account_screem_widget/sign_out.dart';
import 'package:flutter/material.dart';
import 'package:committee/component/account_screem_widget/paswordchaging_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final uid = auth.currentUser?.uid ?? "DefaultUID";
    final mad = auth.currentUser?.email ?? "DefaultEmail";

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange, Colors.deepPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 28,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                children: [
                  TextSpan(
                    text: 'コミティ',
                    style: GoogleFonts.zenMaruGothic(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const WidgetSpan(
                    child: Icon(
                      Icons.manage_accounts,
                      size: 36,
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Form(
            child: Column(
              children: <Widget>[
                //始まり
                Container(
                  width: 130,
                  margin: const EdgeInsets.fromLTRB(0, 0, 270, 0),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Text(
                    'ユーザー名',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),

                Container(
                  width: 500,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                  child: Text(
                    mad,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepOrange, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  margin: const EdgeInsets.fromLTRB(0, 0, 270, 0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(64, 57, 58, 59),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'ユーザーid',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  width: 500,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                  ),
                  child: Text(
                    uid,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),

                Container(
                  height: 20, //空白
                  color: const Color.fromARGB(255, 255, 255, 255),
                  alignment: Alignment.center,
                  child: const Text(''),
                ),

                Container(
                  //パスワード変更
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(64, 57, 58, 59),
                    borderRadius: BorderRadius.circular(50),
                  ),

                  width: 250,
                  height: 70,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingScreen(),
                        ),
                      );
                    }, //ボタンを押した後の処理

                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromRGBO(233, 50, 5, 0.705),
                      textStyle: const TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    child: const Text('パスワード変更'),
                  ),
                ),
                Container(
                  height: 20, //空白
                  color: const Color.fromARGB(255, 255, 255, 255),
                  alignment: Alignment.center,
                  child: const Text(''),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(64, 57, 58, 59),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 250,
                  height: 70,
                  alignment: Alignment.center,
                  child: const SignOut(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
