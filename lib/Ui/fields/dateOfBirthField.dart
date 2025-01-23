import 'package:flutter/material.dart';
import 'package:login_screen/Ui/utils/app_colors.dart';
import 'package:login_screen/Ui/utils/app_theme.dart';

class DateOfBirthField extends StatefulWidget {
  final Function(DateTime?)? onChanged;
  const DateOfBirthField({super.key, this.onChanged});

  @override
  State<DateOfBirthField> createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
        "${picked.year}-${picked.month}-${picked.day}";
        widget.onChanged?.call(_selectedDate);
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Date of Birth", style: AppTheme.regularTitleTextStyle.copyWith(color: AppColors.black)),
        const SizedBox(height: 5),
        TextFormField(
          controller: _dateController,
          readOnly: true,
          decoration: InputDecoration(
            hintText: "Select your date of birth",
            border: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.primary
                )
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.primary
                )
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.gray
                )
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today,color: AppColors.gray,),
              onPressed: () => _selectDate(context),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please select your date of birth";
            }
            return null;
          },
          onTap: () {
            _selectDate(context);
          },
        ),
      ],
    );
  }
}