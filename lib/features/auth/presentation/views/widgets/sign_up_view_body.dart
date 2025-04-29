import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/gender_selection_menu.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/sign_up_block_consumer.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final signupcubit = SignUpCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: signupcubit.formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const CustomAppBar(
                title: 'Sign Up',
                canBack: true,
              ),
              const SizedBox(height: 50),
              CustomTextFormField(
                label: 'Full Name',
                hintText: 'Enter your full name',
                controller: signupcubit.nameController,
                keyboardType: TextInputType.name,
                isSuffixIcon: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                label: 'Email',
                hintText: 'Enter your email',
                controller: signupcubit.emailController,
                keyboardType: TextInputType.emailAddress,
                isSuffixIcon: false,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                label: 'Password',
                hintText: 'Enter password',
                controller: signupcubit.passwordController,
                keyboardType: TextInputType.visiblePassword,
                isSuffixIcon: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != signupcubit.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                label: 'Confirm Password',
                hintText: 'Re-enter password',
                controller: signupcubit.confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                isSuffixIcon: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != signupcubit.passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
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
                      const SignUpBlockConsumer(),
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
      ),
    );
  }
}
