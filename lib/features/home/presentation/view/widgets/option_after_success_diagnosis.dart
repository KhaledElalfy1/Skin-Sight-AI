import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/widgets/custom_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';

class OptionAfterSuccessDiagnosis extends StatelessWidget {
  const OptionAfterSuccessDiagnosis({super.key, required this.diagnosis});
  final String diagnosis;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          diagnosis,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        CustomElevatedButton(
            onPressed: () {
              context.read<HomeCubit>().cancelImage();
            },
            label: 'Make new Diagnosis')
      ],
    );
  }
}
