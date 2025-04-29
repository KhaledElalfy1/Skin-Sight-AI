import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/sign_in_bloc_consumer.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/sign_in_form.dart';

class SignInViewbody extends StatelessWidget {
  const SignInViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const CustomAppBar(
              title: 'Welcome Back!',
              canBack: false,
            ),
            const SizedBox(height: 50),
            const SignInForm(),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SignInBlocConsumer(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor.withOpacity(0.6),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routing.signUp);
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
