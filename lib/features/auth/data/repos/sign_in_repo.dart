import 'package:dartz/dartz.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';

abstract class SignInRepo {
  Future<Either<ApiErrorModel, String>> login({
    required String email,
    required String password,
  });
}
