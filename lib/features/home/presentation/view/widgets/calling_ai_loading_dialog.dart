

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';


class CallingAILoadingDialog extends StatelessWidget {
  const CallingAILoadingDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      
      child: Container(
        height: 420,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
                'assets/animation/Animation-1745946940838.json'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Connecting to AI...',
              style:  TextStyle(
                fontSize: 20,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
