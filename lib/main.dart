import 'package:flutter/material.dart';
import 'package:login_screen/Ui/sign_in/sign_in.dart';
import 'package:login_screen/Ui/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: AppTheme.lightTheme,
        title: "SignIn",
        home: SignIn()
    );
  }
}