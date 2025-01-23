import 'package:flutter/material.dart';
import '../app_colors.dart';

class HaveAccountRow extends StatelessWidget {
  const HaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Have an account? ", style: TextStyle(color:AppColors.gray)),
        Text("Login",
            style: TextStyle(
                color: AppColors.primary, fontWeight: FontWeight.bold)),
      ],
    );
  }
}