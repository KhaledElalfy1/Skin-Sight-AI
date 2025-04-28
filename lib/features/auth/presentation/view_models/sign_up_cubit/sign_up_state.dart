part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpGenderChanged extends SignUpState {}

final class SignUpLoading extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final ApiErrorModel apiErrorModel;

  SignUpFailure({required this.apiErrorModel});
}

final class SignUpSuccess extends SignUpState {
  final String message;

  SignUpSuccess({required this.message});
}
