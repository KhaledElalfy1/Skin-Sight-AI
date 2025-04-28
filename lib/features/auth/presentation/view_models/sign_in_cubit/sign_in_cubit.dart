import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_in_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.signInRepo) : super(SignUpInitial());
  static SignInCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final SignInRepo signInRepo;
}
