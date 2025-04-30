import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/helpers/extentions.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/widgets/custom_elevated_button.dart';
import 'package:skin_sight_ai/core/widgets/toast.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_state.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/calling_ai_loading_dialog.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/calling_ai_success_dialog.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/option_after_success_diagnosis.dart';

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
        BlocConsumer<HomeCubit, HomeState>(
          listenWhen: (previous, current) =>
              current is CallAIModelLoading ||
              current is CallAIModelSuccess ||
              current is CallAIModelFailure,
          listener: (context, state) {
            if (state is CallAIModelLoading) {
              // log('message');
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const CallingAILoadingDialog(),
              );
            } else if (state is CallAIModelSuccess) {
              context.pop();
              showDialog(
                context: context,
                builder: (context) => const CallingAISuccessDialog(),
              );
            } else if (state is CallAIModelFailure) {
              context.pop();
              errorToast(
                message:
                    state.apiErrorModel.message ?? 'Model failed to detect',
              );
            }
          },
          buildWhen: (previous, current) =>
              current is CallAIModelLoading ||
              current is CallAIModelSuccess ||
              current is CallAIModelFailure,
          builder: (context, state) {
            return state is CallAIModelSuccess
                ? OptionAfterSuccessDiagnosis(
                    diagnosis: state.diagnosis.first,
                  )
                : CustomElevatedButton(
                    onPressed: () {
                      context.read<HomeCubit>().diagnosisStateEmitter();
                    },
                    label: 'Start Diagnosis',
                  );
          },
        ),
      ],
    );
  }
}
