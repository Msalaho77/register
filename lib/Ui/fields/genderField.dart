import 'package:flutter/material.dart';
import 'package:login_screen/Ui/utils/app_theme.dart';
import 'package:login_screen/Ui/utils/app_colors.dart';

class GenderField extends StatefulWidget {
  final Function(Gender)? onChanged;
  const GenderField({super.key, this.onChanged});

  @override
  State<GenderField> createState() => _GenderFieldState();
}

enum Gender {male, female}

class _GenderFieldState extends State<GenderField> {
  Gender? _selectedGender;
  @override
  void initState() {
    super.initState();
    _selectedGender = null;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: AppTheme.regularTitleTextStyle.copyWith(color: AppColors.black)),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = Gender.male;
                    widget.onChanged?.call(_selectedGender!);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: _selectedGender == Gender.male
                        ? AppColors.lightBlue
                        : AppColors.transparent,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color:
                    _selectedGender == Gender.male
                        ? AppColors.primary
                        : AppColors.gray,),
                  ),
                  child: Center(
                    child: Text(
                      "Male",
                      style: TextStyle(
                        color: _selectedGender == Gender.male
                            ? AppColors.black
                            : AppColors.gray,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedGender = Gender.female;
                    widget.onChanged?.call(_selectedGender!);
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: _selectedGender == Gender.female
                        ? AppColors.lightBlue
                        : AppColors.transparent,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: _selectedGender == Gender.female
                        ? AppColors.primary
                        : AppColors.gray,),
                  ),
                  child:  Center(
                    child: Text(
                      "Female",
                      style: TextStyle(
                        color: _selectedGender == Gender.female
                            ? AppColors.black
                            : AppColors.gray,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}