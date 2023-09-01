import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterModel {
  String? email;
  String? password;

  void setEmail(String email) {
    this.email = email;
  }

  void setPassword(String password) {
    this.password = password;
  }

  Future signUp() async {
    if (email != null && password != null) {
      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email!,
        password: password!,
      );
      final User? user = userCredential.user;
      final String uid = user!.uid;

      //firestoreに追加
      final doc = FirebaseFirestore.instance.collection('user');
      await doc.add({'email': user.email, 'uid': uid, 'name': ""});
    }
  }
}
