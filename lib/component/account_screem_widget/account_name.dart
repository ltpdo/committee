import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:committee/view/welcome.dart';

//class AccountName extends StatelessWidget {
//  const AccountName({Key? key});
//  @override
//  Widget build(BuildContext context) {
//    final auth = FirebaseAuth.instance;
//    final uid = auth.currentUser?.uid ?? "DefaultUID";
//    DatabaseReference ref =
//        FirebaseDatabase.instance.reference().child("user/$uid/name");

//    return FutureBuilder(
//      future: ref.once(),
//      builder: (context, snapshot) {
//        if (snapshot.connectionState == ConnectionState.waiting) {
//          return CircularProgressIndicator();
//        } else if (snapshot.hasError) {
//          return Text("データを読み取る際にエラーが発生しました: ${snapshot.error}");
//        } else {
//          if (snapshot.hasData) {
//           var data = snapshot.data as String;

//            var name = data.value;
//          return Text(
//          name ?? "No Name",
//             style: const TextStyle(fontSize: 20),
//           );
//         } else {
//           return Text("データはありません");
//         }
//        }
//     },
//   );
//  }
//}
