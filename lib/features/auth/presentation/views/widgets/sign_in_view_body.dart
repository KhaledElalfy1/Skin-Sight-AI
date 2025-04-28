import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/widgets/custom_elevated_button.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignInViewbody extends StatelessWidget {
  const SignInViewbody({super.key});

  @override
  Widget build(BuildContext context) {
    final signInCubit = SignInCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            const CustomAppBar(
              title: 'Sign In',
              canBack: false,
            ),
            const SizedBox(height: 50),
            CustomTextFormField(
              label: 'Email',
              hintText: 'Enter your email',
              controller: signInCubit.emailController,
              keyboardType: TextInputType.emailAddress,
              isSuffixIcon: false,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              label: 'Password',
              hintText: 'Enter password',
              keyboardType: TextInputType.visiblePassword,
              controller: signInCubit.passwordController,
              isSuffixIcon: true,
            ),
            const SizedBox(
              height: 20,
            ),
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
                    CustomElevatedButton(onPressed: () {}, label: 'login'),
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
