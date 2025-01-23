import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class PasswordTextField extends StatefulWidget {
  final String label;
  final String errorMessage;
  final Function(String?)? onSaved;
  const PasswordTextField({
    super.key,
    this.label = "Enter your Password",
    this.errorMessage = "Please Enter Your Password",
    this.onSaved,
  });

  @override
  PasswordTextFieldState createState() => PasswordTextFieldState();
}

class PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.gray),
        ),
        labelText: widget.label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primary),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.gray,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return widget.errorMessage;
        }
        return null;
      },
      onSaved: widget.onSaved,
      style: const TextStyle(color: Colors.black),
    );
  }
}