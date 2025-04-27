

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/utils/app_images.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/image_picker_container.dart';


class ImagePickerOptions extends StatelessWidget {
  const ImagePickerOptions({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
     final cubit = context.read<HomeCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: ImagePickerContainer(
            onTap: () async {
              await cubit.pickImageFromCamera();
            },
            imagePath: AppImages.camera,
            title: 'Camera',
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: ImagePickerContainer(
            onTap: () async {
              await cubit.pickImageFromGallery();
            },
            imagePath: AppImages.gallery,
            title: 'Gallery',
          ),
        ),
      ],
    );
  }
}
