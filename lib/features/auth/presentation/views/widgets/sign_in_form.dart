import 'package:flutter/material.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/widgets/custom_text_form_field.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signInCubit = SignInCubit.get(context);
    return Form(
      key: signInCubit.formkey,
      child: Column(
        children: [
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
            isSecure: true,
            keyboardType: TextInputType.visiblePassword,
            controller: signInCubit.passwordController,
            isSuffixIcon: true,
          ),
        ],
      ),
    );
  }
}
