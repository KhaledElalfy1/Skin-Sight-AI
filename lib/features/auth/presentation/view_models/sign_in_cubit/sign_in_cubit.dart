import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_in_request_model.dart';

import 'package:skin_sight_ai/features/auth/data/repos/sign_in_repo.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_in_cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignUpInitial());
  final SignInRepo signInRepo;

  static SignInCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() async {
    emit(SignUpLoading());
    final result = await signInRepo.login(
      signInRequestModel: SignInRequestModel(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    result.fold(
      (apiErrorModel) => emit(
        SignUpFailure(
          apiErrorModel: apiErrorModel,
        ),
      ),
      (r) => emit(SignUpSuccess()),
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
