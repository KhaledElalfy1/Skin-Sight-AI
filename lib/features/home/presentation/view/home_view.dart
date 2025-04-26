import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/utils/app_images.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/image_picker_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Take Photo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const Text(
              'Chose the suitable way to upload your photo.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ImagePickerContainer(
                    onTap: () {},
                    imagePath: AppImages.camera,
                  ),
                ),
               const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: ImagePickerContainer(
                    onTap: () {},
                    imagePath: AppImages.gallery,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

