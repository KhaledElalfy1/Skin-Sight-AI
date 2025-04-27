import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_state.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/image_picked_options.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/image_picker_option.dart';

class ChooseImageBlocBuilder extends StatelessWidget {
  const ChooseImageBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => current is PickImageDone,
      builder: (context, state) {
        if (cubit.pickedImage != null) {
          return const ImagePickedOptions();
        } else {
          return const ImagePickerOptions();
        }
      },
    );
  }
}
