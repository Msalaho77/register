import 'package:flutter/material.dart';
import '../app_theme.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Individuals", style: AppTheme.titleTextStyle),
         Text("Company", style: AppTheme.titleTextStyle),
      ],
    );
  }
}