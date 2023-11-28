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

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(31, 199, 9, 9),
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
                    Icons.settings,
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
              const SizedBox(
                child: Text(
                  'ユーザー名',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                width: 500,
                child: Text(
                  mad,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 1, // 線の高さ
                width: double.infinity, // 横幅いっぱいに広げる
                color: Colors.black, // 線の色
              ),
              Container(
                height: 50,
              ),
              const SizedBox(
                width: 130,
                child: Text(
                  'ユーザーID',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 500,
                child: Text(
                  uid,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Container(
                height: 1, // 線の高さ
                width: double.infinity, // 横幅いっぱいに広げる
                color: Colors.black, // 線の色
              ),

              const SizedBox(
                height: 30,
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
                    foregroundColor: const Color.fromARGB(179, 134, 33, 8),
                    textStyle: const TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  child: const Text('パスワード変更'),
                ),
              ),

              const SizedBox(
                height: 30,
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
    );
  }
}
