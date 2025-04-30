import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/helpers/extentions.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/core/widgets/custom_elevated_button.dart';
import 'package:skin_sight_ai/core/widgets/toast.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_in_cubit/sign_in_state.dart';

class SignInBlocConsumer extends StatelessWidget {
  const SignInBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          context.pushNamedAndRemoveUntil(
            Routing.main,
            predicate: (route) => false,
          );
        } else if (state is SignUpFailure) {
          return errorToast(message: state.apiErrorModel.message ?? '');
        }
      },
      builder: (context, state) {
        return state is SignUpLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : CustomElevatedButton(
                onPressed: () {
                  if (context
                      .read<SignInCubit>()
                      .formkey
                      .currentState!
                      .validate()) {
                    context.read<SignInCubit>().signIn();
                  }
                },
                label: 'login',
              );
      },
    );
  }
}
