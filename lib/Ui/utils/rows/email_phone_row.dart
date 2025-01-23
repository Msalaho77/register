import 'package:flutter/material.dart';
import '../../fields/email_text_field.dart';
import '../../fields/phone_text_field.dart';

class EmailPhoneRow extends StatelessWidget {
  final Function(String?)? onEmailSaved;
  final Function(String?)? onPhoneSaved;

  const EmailPhoneRow(
      {super.key, required this.onEmailSaved, required this.onPhoneSaved});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EmailTextField(onSaved: onEmailSaved),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: PhoneTextField(onSaved: onPhoneSaved),
        ),
      ],
    );
  }
}