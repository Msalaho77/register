import 'package:flutter/material.dart';
import 'package:login_screen/Ui/utils/app_colors.dart';
import '../fields/dateOfBirthField.dart';
import '../fields/genderField.dart';
import '../fields/name_text_field.dart';
import '../fields/nationalityFiled.dart';
import '../fields/password_text_field.dart';
import '../utils/create_account_button.dart';
import '../utils/rows/email_phone_row.dart';
import '../utils/rows/have_account_row.dart';
import '../utils/rows/header_row.dart';
import '../utils/rows/title_row.dart';



class CardContainer extends StatefulWidget {
  const CardContainer({super.key});

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  final _formKey = GlobalKey<FormState>();
  String? _fullName;
  String? _email;
  String? _phone;
  String? _nationality;
  DateTime? _dateOfBirth;
  Gender? _gender;
  String? _password;

  bool _validateForm() {
    return _formKey.currentState?.validate() ?? false && _gender != null;
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _saveData() {
    if (_validateForm()) {
      _formKey.currentState!.save();
      print("Name: $_fullName");
      print("Email: $_email");
      print("Phone: $_phone");
      print("Nationality: $_nationality");
      print("Date of Birth: $_dateOfBirth");
      print("Gender: $_gender");
      print("Password: $_password");

      _showSnackBar("Processing Data");
    } else {
      _showSnackBar("Please choose your gender");
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double containerWidth = constraints.maxWidth * 0.8;
        double containerHeight = constraints.maxHeight * 0.8;
        double minContainerWidth = 350;
        double maxContainerWidth = 600;
        double minContainerHeight = 400;
        double maxContainerHeight = 700;
        containerWidth =
            containerWidth.clamp(minContainerWidth, maxContainerWidth);
        containerHeight =
            containerHeight.clamp(minContainerHeight, maxContainerHeight);
        return Center(
          child: Container(
            height: containerHeight,
            width: containerWidth,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HeaderRow(), // Reduced nesting
                      const SizedBox(height: 20),
                      const TitleRow(), // Reduced nesting
                      const SizedBox(height: 20),
                      NameTextField(onSaved: (value) => _fullName = value), // Reduced nesting
                      const SizedBox(height: 15),
                      EmailPhoneRow(
                          onEmailSaved: (value) => _email = value,
                          onPhoneSaved: (value) => _phone = value),
                      const SizedBox(height: 15),
                      NationalityDropdown(
                        onChanged: (value) => _nationality = value,
                      ),
                      const SizedBox(height: 15),
                      DateOfBirthField(
                        onChanged: (value) => _dateOfBirth = value,
                      ),
                      const SizedBox(height: 15),
                      GenderField(
                        onChanged: (value) => _gender = value,
                      ),
                      const SizedBox(height: 15),
                      PasswordTextField(onSaved: (value) => _password = value),
                      const SizedBox(
                        height: 20,
                      ),
                      CreateAccountButton(onPressed: _saveData),  // Reduced nesting
                      const SizedBox(height: 20),
                       const HaveAccountRow() // Reduced nesting
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}