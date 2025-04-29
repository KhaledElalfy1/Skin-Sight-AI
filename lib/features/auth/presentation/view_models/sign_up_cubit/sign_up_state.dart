part of 'sign_up_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpGenderChanged extends SignUpState {}

final class SignUpStateLoading extends SignUpState {}

final class SignUpStateFailure extends SignUpState {
  final ApiErrorModel apiErrorModel;

  SignUpStateFailure({required this.apiErrorModel});
}

final class SignUpStateSuccess extends SignUpState {
  final String message;

  SignUpStateSuccess({required this.message});
}
