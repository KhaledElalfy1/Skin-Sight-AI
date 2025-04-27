import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/helpers/extentions.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AspectRatio(
              aspectRatio: 2.2 / 4,
              child: Stack(fit: StackFit.expand, children: [
                Image.asset(
                  AppImages.onBoardingImg,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                    bottom: 26,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.0),
                      child: SizedBox(
                        width: 364,
                        child: Text(
                          'Learn about the problems that your skin may face, and get rid of them.',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ))
              ])),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              width: 203,
              height: 79,
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                  color: const Color(0xffDBE2EE),
                  borderRadius: BorderRadius.circular(35)),
              child: IconButton(
                onPressed: () => context.pushNamed(Routing.signIn),
                icon: Container(
                  width: 67,
                  height: 67,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.primaryColor),
                  child: Image.asset(AppImages.arrowRight),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
