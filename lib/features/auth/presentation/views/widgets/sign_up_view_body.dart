import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/gender_selection_menu.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

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
              title: 'Sign Up',
              canBack: true,
            ),
            const SizedBox(height: 50),
            const CustomTextFormField(
              label: 'Full Name',
              hintText: 'Enter your full name',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              label: 'Email',
              hintText: 'Enter your email',
            ),
            const SizedBox(
              height: 20,
            ),
            const CustomTextFormField(
              label: 'Password',
              hintText: 'Enter password',
            ),
            const SizedBox(
              height: 20,
            ),
            const GenderSelectionMenu(),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        minimumSize: const Size(203, 79),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor.withOpacity(0.6),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Sign In',
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
