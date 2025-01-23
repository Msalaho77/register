import 'package:flutter/material.dart';
import 'package:login_screen/Ui/utils/app_theme.dart';
import 'package:login_screen/Ui/utils/app_colors.dart';

class NationalityDropdown extends StatefulWidget {
  final Function(String?)? onChanged;
  const NationalityDropdown({super.key,this.onChanged});

  @override
  State<NationalityDropdown> createState() => _NationalityDropdownState();
}

class _NationalityDropdownState extends State<NationalityDropdown> {
  String? _selectedNationality;
  final List<String> _nationalities = ["Egyptian", "Saudi", "American"];

  @override
  void initState() {
    super.initState();
    widget.onChanged?.call(_selectedNationality);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Nationality",
          style: AppTheme.regularTitleTextStyle.copyWith(color: AppColors.black),),
        const SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primary
                  )
              ),
              hintText: "Chose your nationality",
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primary
                  )
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.gray
                  )
              )
          ),
          value: _selectedNationality,
          onChanged: (newValue) {
            setState(() {
              _selectedNationality = newValue;
            });
            widget.onChanged?.call(_selectedNationality);
          },
          items: _nationalities.map((nationality) {
            return DropdownMenuItem<String>(
              value: nationality,
              child: Text(nationality, ),
            );
          }).toList(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Pleas chose your nationality';
            }
            return null;
          },
        ),
      ],
    );
  }
}