import 'package:committee/models/tag.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as datatTimePicker;
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateCommunityScreen extends StatefulWidget {
  const CreateCommunityScreen({super.key});

  @override
  State<CreateCommunityScreen> createState() => _CreateCommunityScreenState();
}

class _CreateCommunityScreenState extends State<CreateCommunityScreen> {
  final _isNameController = TextEditingController();
  final _isContentController = TextEditingController();
  final _isActivityTimeController = TextEditingController();
  final _isLocationController = TextEditingController();
  final _istag1Controller = TextEditingController();
  final _istag2Controller = TextEditingController();
  final _istag3Controller = TextEditingController();

  @override
  void dispose() {
    _isNameController.dispose();
    _isContentController.dispose();
    _isActivityTimeController.dispose();
    _isLocationController.dispose();
    _istag1Controller.dispose();
    _istag2Controller.dispose();
    _istag3Controller.dispose();
    super.dispose();
  }

  void _addCommunityToFirestore() async {
    if (_isNameController.text.trim().isEmpty ||
        _isContentController.text.trim().isEmpty ||
        _isActivityTimeController.text.trim().isEmpty ||
        _isLocationController.text.trim().isEmpty ||
        _istag1Controller.text.trim().isEmpty) {
      return;
    }

    final _user = FirebaseAuth.instance.currentUser!;

    FirebaseFirestore.instance.collection('community').add({
      'name': _isNameController.text,
      'content': _isContentController.text,
      'activityTime': _isActivityTimeController.text,
      'location': _isLocationController.text,
      'tags': [
        _istag1Controller.text,
        _istag2Controller.text,
        _istag3Controller.text
      ],
      'members': [
        _user.uid,
      ],
      'representaitive': [
        _user.uid,
      ]
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("コミュニティ作成"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: _isNameController,
                  decoration: const InputDecoration(
                    labelText: "名前",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: _isContentController,
                  decoration: const InputDecoration(
                    labelText: "内容",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: _isActivityTimeController,
                  decoration: const InputDecoration(
                    labelText: "活動時間",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                child: TextFormField(
                  controller: _isLocationController,
                  decoration: const InputDecoration(
                    labelText: "場所",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextFormField(
                      controller: _istag1Controller,
                      decoration: const InputDecoration(
                        labelText: "タグ1",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextFormField(
                      controller: _istag2Controller,
                      decoration: const InputDecoration(
                        labelText: "タグ2",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: TextFormField(
                      controller: _istag3Controller,
                      decoration: const InputDecoration(
                        labelText: "タグ3",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: ElevatedButton(
                  onPressed: _addCommunityToFirestore,
                  child: Text("決定"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
