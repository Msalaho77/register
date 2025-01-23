import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_theme.dart';

class EmailTextField extends StatelessWidget {
  final String label;
  final String errorMessage;
  final Function(String?)? onSaved;

  const EmailTextField({
    super.key,
    this.label = "Enter Your Email",
    this.errorMessage = "Please Enter Your Email",
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: AppTheme.regularTitleTextStyle.copyWith(color: AppColors.black),
        ),
        const SizedBox(height: 5),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.gray),
            ),
            labelText: label,
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:AppColors.red),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color:AppColors.red),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return errorMessage;
            }
            return null;
          },
          onSaved: onSaved,
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }
}