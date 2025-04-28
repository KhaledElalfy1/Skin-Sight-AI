import 'package:dartz/dartz.dart';
import 'package:skin_sight_ai/core/database/api/api_consumer.dart';
import 'package:skin_sight_ai/core/database/api/api_error_handler.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/core/database/api/end_points.dart';
import 'package:skin_sight_ai/features/auth/data/models/sign_up_request_model.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final ApiConsumer apiConsumer;

  SignUpRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, String>> register({
    required SignUpRequestModel request,
  }) async {
    try {
      final response = await apiConsumer.post(
        'https://skin-sight.runasp.net${EndPoints.register}',
        data: request.toJson(),
      );
      final message = response.data[ApiKeys.message];
      return right(message);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
