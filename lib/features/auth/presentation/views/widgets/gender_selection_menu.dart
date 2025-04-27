import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';

class GenderSelectionMenu extends StatefulWidget {
  const GenderSelectionMenu({
    super.key,
  });

  @override
  State<GenderSelectionMenu> createState() => _GenderSelectionMenuState();
}

class _GenderSelectionMenuState extends State<GenderSelectionMenu> {
  String? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Gender',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            )),
        DropdownButtonFormField<String>(
          validator: (value) {
            if (value == null) {
              return 'Please select your gender';
            }
            return null;
          },
          items: const [
            DropdownMenuItem(
              value: 'Male',
              child: Text('Male'),
            ),
            DropdownMenuItem(
              value: 'Female',
              child: Text('Female'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              selectedGender = value;
            });
          },
          decoration: InputDecoration(
            fillColor: const Color(0xffC3CFE2).withOpacity(0.4),
            filled: true,
            hintText: "your gender",
            hintStyle: TextStyle(
              color: AppColors.primaryColor.withOpacity(0.4),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
