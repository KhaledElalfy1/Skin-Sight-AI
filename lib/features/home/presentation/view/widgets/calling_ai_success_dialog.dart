import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skin_sight_ai/core/helpers/extentions.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/widgets/custom_elevated_button.dart';

class CallingAISuccessDialog extends StatelessWidget {
  const CallingAISuccessDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              'assets/animation/email.json',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Email is sended to you with the Diagnosis',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: CustomElevatedButton(
                  onPressed: () {
                    context.pop();
                  },
                  label: 'Dismes',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
