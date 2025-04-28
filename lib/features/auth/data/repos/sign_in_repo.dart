import 'package:dartz/dartz.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_in_request_model.dart';

abstract class SignInRepo {
  Future<Either<ApiErrorModel, String>> login({
    required SignInRequestModel signInRequestModel 
  });
}
