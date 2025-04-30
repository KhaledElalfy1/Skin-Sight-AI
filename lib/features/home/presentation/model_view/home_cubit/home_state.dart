import 'package:skin_sight_ai/core/database/api/api_error_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class PickImageDone extends HomeState {}

final class CallAIModelLoading extends HomeState {}

final class CallAIModelSuccess extends HomeState {
  final List<String> diagnosis;

  CallAIModelSuccess({required this.diagnosis});
}

final class CallAIModelFailure extends HomeState {
  final ApiErrorModel apiErrorModel;

  CallAIModelFailure({required this.apiErrorModel});
}
