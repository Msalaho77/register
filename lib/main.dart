import 'package:flutter/material.dart';
import 'package:login_screen/Ui/utils/app_theme.dart';
import 'Ui/sign_in/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      title: "SignIn",
      home:const SignIn(),
    );
  }
}