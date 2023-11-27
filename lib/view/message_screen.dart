import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:committee/models/community.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../component/message_screen_widget/chat_list/chat_list_list.dart';
import 'package:google_fonts/google_fonts.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  bool _switchValue = false;
  bool _initialSwitchValue = false;

  @override
  void initState() {
    super.initState();
    _initialSwitchValue = false;
    _switchValue = _initialSwitchValue;
  }

  Widget build(BuildContext context) {
    final authenticatedUser = FirebaseAuth.instance.currentUser!;
    String _authUid = authenticatedUser.uid;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                  text: 'メッセージ',
                  style: GoogleFonts.zenMaruGothic(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const WidgetSpan(
                  child: Icon(
                    Icons.mail,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
              },
            )
          ],
        ),
        body: _switchValue
            ? _buildCommunityList(
                'representaitive',
                _authUid,
                [Colors.deepPurple, Colors.deepOrange],
              )
            : _buildCommunityList(
                'members',
                _authUid,
                [Colors.deepPurple, Colors.deepOrange],
              ),
      ),
    );
  }

  Widget _buildCommunityList(String field, String authUid, List<Color> colors) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('community')
          .where(field, arrayContains: authUid)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Container(
            width: double.infinity,
            child: const Center(
              child: Text('所属しているコミュニティはありません'),
            ),
          );
        }

        List<Community> communityList =
            snapshot.data!.docs.map((DocumentSnapshot doc) {
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
          return Community(
            circleId: doc.id,
            name: data['name'],
          );
        }).toList();

        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: TolkList(
                    interlocuter: communityList,
                    onRemoveTolk: (community) {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
