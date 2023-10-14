import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SettingScreenState();
  }
}

class _SettingScreenState extends State<SettingScreen> {
  final _form = GlobalKey<FormState>();
  var _emaileaddres = '';
  var _cureentPassword = '';
  var _changePassword = '';

  Future<void> _submit() async {
    var auth = FirebaseAuth.instance;
    var user = auth.currentUser;

    print(user);

    if (user != null) {
      try {
        await user.reauthenticateWithCredential(
          EmailAuthProvider.credential(
              email: _emaileaddres, password: _cureentPassword),
        );

        await user.updatePassword(_changePassword);
      } catch (error) {
        if (error is FirebaseAuthException) {
          print('Firebase Authentication エラーコード: ${error.code}');
        }
        print('エラー詳細: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('コミティ'),
      ),
      body: Form(
        key: _form, //これ大事
        child: Column(
          children: <Widget>[
            const Text('パスワード変更', style: TextStyle(fontSize: 36)),
            //始まり
            TextFormField(
              decoration: const InputDecoration(labelText: 'メールアドレス'),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false, //自動修正なし
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return '違うメアドです';
                }
                return null;
              },
              onSaved: (value) {
                //ここで入力された値を取得
                _emaileaddres = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '変更前のパスワード'),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false, //自動修正なし
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return 'ぱすわーどは6文字以上にして';
                }
                return null;
              },
              onSaved: (value) {
                //ここで入力された値を取得
                _cureentPassword = value!;
              },
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: '変更後のパスワード'),
              keyboardType: TextInputType.emailAddress,
              autocorrect: false, //自動修正なし
              obscureText: true, //パスワード隠し
              validator: (value) {
                if (value == null || value.trim().length < 6) {
                  return 'ぱすわーどは6文字以上にして';
                }
                return null;
              },
              onSaved: (value) {
                _changePassword = value!;
              },
            ),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              style: ElevatedButton.styleFrom(
                  //色
                  backgroundColor:
                      Theme.of(context).colorScheme.primaryContainer),
              child: const Text('変更'),
            ),
          ],
        ),
      ),
    );
  }
}
