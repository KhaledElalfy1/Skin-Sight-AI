import 'package:dartz/dartz.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_up_request_model.dart';

abstract class SignUpRepo {
  Future<Either<ApiErrorModel, String>> register({
    required SignUpRequestModel request,
  });
}
