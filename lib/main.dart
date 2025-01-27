import 'package:flutter/material.dart';
import 'package:login_screen/Ui/sign_in/sign_in.dart';
import 'package:login_screen/Ui/utils/app_theme.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
      home: ResponsiveSignInScreen(),
    );
  }
}

class ResponsiveSignInScreen extends StatelessWidget {
  ResponsiveSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SignIn(sizingInformation: sizingInformation);
      },
    );
  }
}