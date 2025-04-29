import 'package:dartz/dartz.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import '../../../../core/database/api/api_consumer.dart';
import '../../../../core/database/api/api_error_handler.dart';
import '../../../../core/database/api/end_points.dart';
import '../model/user_profile_model.dart';
import 'user_profile_repo.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final ApiConsumer apiConsumer;

  UserProfileRepoImpl({required this.apiConsumer});

  @override
  Future<Either<UserProfileModel, ApiErrorModel>> getUserProfile() async {
    try {
      final response =
          await apiConsumer.get('${EndPoints.baseUrl}${EndPoints.profile}');
      if (response.statusCode == 200) {
        final Map<String,dynamic> data = response.data;
        final userProfile = UserProfileModel.fromJson(data);
        return Left(userProfile);
      } else {
        return Right(ApiErrorModel(message: 'Failed to load user profile'));
      }
    } catch (e) {
      return Right(ApiErrorHandler.handleError(e));
    }
  }
}
