import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    required this.canBack,
  });
  final String title;
  final bool canBack;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        canBack
            ? GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
              )
            : const SizedBox(width: 30),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
