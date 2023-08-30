import 'dart:io';
import 'package:flutter/material.dart';

class User {
  const User({
    required this.userid,
    required this.password,
    required this.username,
    required this.userpicture,
  });

  final String userid;
  final String password;
  final String username;
  final File userpicture;
}
