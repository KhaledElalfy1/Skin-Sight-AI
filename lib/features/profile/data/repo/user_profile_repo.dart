import 'package:dartz/dartz.dart';
import '../../../../core/database/api/api_error_model.dart';
import '../model/user_profile_model.dart';

abstract class UserProfileRepo {
  Future<Either<UserProfileModel, ApiErrorModel>> getUserProfile();
}