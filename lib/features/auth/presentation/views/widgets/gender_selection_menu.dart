import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';

class GenderSelectionMenu extends StatelessWidget {
  const GenderSelectionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SignUpCubit>();

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
          value: cubit.selectedGender,
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
            cubit.changeGender(value);
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
