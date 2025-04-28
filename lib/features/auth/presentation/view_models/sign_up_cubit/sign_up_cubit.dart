import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
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

  void changeGender(String? gender) {
    selectedGender = gender;
    emit(SignUpGenderChanged());
  }
}
