import 'package:dartz/dartz.dart';
import 'package:skin_sight_ai/core/database/api/api_consumer.dart';
import 'package:skin_sight_ai/core/database/api/api_error_handler.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/core/database/api/end_points.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_in_response_model.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_in_repo.dart';

class SignInRepoImpl implements SignInRepo {
  final ApiConsumer apiConsumer;

  SignInRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> login(
      {required String email, required String password}) async {
    try {
      final response = await apiConsumer.post(
        'https://skin-sight.runasp.net${EndPoints.login}',
        data: {
          "email": email,
          "password": password,
        },
      );
      final data = SignInResponseModel.fromJson(response.data);
      return right(data.message);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
