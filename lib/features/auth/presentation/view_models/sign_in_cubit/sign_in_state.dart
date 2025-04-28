part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignUpInitial extends SignInState {}

final class SignUpLoading extends SignInState {}

final class SignUpFailure extends SignInState {
  final ApiErrorModel apiErrorModel;

  SignUpFailure({required this.apiErrorModel});
}

final class SignUpSuccess extends SignInState {}
