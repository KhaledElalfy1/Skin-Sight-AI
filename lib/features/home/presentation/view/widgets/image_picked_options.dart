import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/widgets/custom_elevated_button.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';

class ImagePickedOptions extends StatelessWidget {
  const ImagePickedOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return Column(
      children: [
        Stack(
          children: [
            Image.file(
              File(cubit.pickedImage!.path),
              height: 250,
            ),
            IconButton(
              onPressed: () {
                cubit.cancelImage();
              },
              icon: const Icon(
                Icons.cancel,
                color: AppColors.primaryColor,
                size: 25,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 150,
        ),
        CustomElevatedButton(
          onPressed: () {
            log('Hiiiiiiiiiiiiiiiiiiiiii');
          },
          label: 'Start Diagnosis',
        ),
      ],
    );
  }
}
