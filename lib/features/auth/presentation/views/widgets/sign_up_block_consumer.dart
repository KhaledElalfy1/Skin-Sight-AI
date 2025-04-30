import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/widgets/custom_elevated_button.dart';
import 'package:skin_sight_ai/core/widgets/toast.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';

class SignUpBlockConsumer extends StatelessWidget {
  const SignUpBlockConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = SignUpCubit.get(context);
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpStateFailure) {
          errorToast(message: state.apiErrorModel.message!);
        }
        if (state is SignUpStateSuccess) {
          successToast(message: 'Account created successfully');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return state is SignUpStateLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : CustomElevatedButton(
                onPressed: () {
                  if (cubit.formkey.currentState!.validate()) {
                    cubit.register();
                  }
                },
                label: 'Register',
              );
      },
    );
  }
}
