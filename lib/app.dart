import 'package:committee/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:
            GoogleFonts.zenMaruGothicTextTheme(Theme.of(context).textTheme),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          background: const Color.fromARGB(197, 215, 172, 206), // 任意の背景色
        ),
        useMaterial3: true,
      ),
      home: const Welcome(),
    );
  }
}
