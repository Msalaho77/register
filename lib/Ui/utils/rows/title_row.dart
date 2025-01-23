import 'package:flutter/material.dart';
import '../app_theme.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Create new account", style: AppTheme.titleTextStyle),
      ],
    );
  }
}