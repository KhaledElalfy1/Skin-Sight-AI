import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_up_request_model.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_up_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.signUpRepo) : super(SignUpInitial());

  static SignUpCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final SignUpRepo signUpRepo;

  String? selectedGender;
  Future<void> register() async {
    emit(SignUpStateLoading());
    final result = await signUpRepo.register(
        request: SignUpRequestModel(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      gender: selectedGender!,
      confirmPassword: confirmPasswordController.text,
    ));
    result.fold(
      (apiErrorModel) {
        emit(
          SignUpStateFailure(apiErrorModel: apiErrorModel),
        );
      },
      (message) {
        emit(
          SignUpStateSuccess(message: message),
        );
      },
    );
  }

  void changeGender(String? gender) {
    selectedGender = gender;
    emit(SignUpGenderChanged());
  }
}
