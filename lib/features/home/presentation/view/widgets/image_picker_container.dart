
import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';



class ImagePickerContainer extends StatelessWidget {
  const ImagePickerContainer({
    super.key,
    required this.onTap,
    required this.imagePath,
  });
  final VoidCallback onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 186,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          imagePath,
          height: 75,
        ),
      ),
    );
  }
}
