import 'package:dartz/dartz.dart';
import 'package:skin_sight_ai/core/database/api/api_consumer.dart';
import 'package:skin_sight_ai/core/database/api/api_error_handler.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/core/database/api/end_points.dart';
import 'package:skin_sight_ai/core/database/cache/cache_keys.dart';
import 'package:skin_sight_ai/core/database/cache/cashe_helper.dart';
import 'package:skin_sight_ai/core/services/get_it.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_in_request_model.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_in_response_model.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final ApiConsumer apiConsumer;

  SignInRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> login(
      {required SignInRequestModel signInRequestModel}) async {
    try {
      final response = await apiConsumer.post(
        '${EndPoints.baseUrl}${EndPoints.login}',
        data: signInRequestModel.toJson(),
      );
      final data = SignInResponseModel.fromJson(response.data);
      await getIt<CacheHelper>()
          .saveData(key: CacheKeys.token, value: data.token);
      return right(data.message);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
