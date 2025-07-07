import 'package:flutter/material.dart';
import 'package:get_cally_app/language_selection_screen.dart';
import 'package:get_cally_app/signin_screen.dart';
import 'package:get_cally_app/signup_screen.dart';
import 'views/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calley App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: LanguageSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
