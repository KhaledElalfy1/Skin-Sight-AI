import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_sight_ai/core/database/api/api_consumer.dart';
import 'package:skin_sight_ai/core/database/api/api_error_handler.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';
import 'package:skin_sight_ai/core/database/api/end_points.dart';
import 'package:skin_sight_ai/core/functions/upload_image_to_api.dart';
import 'package:skin_sight_ai/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiConsumer apiConsumer;

  HomeRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ApiErrorModel, List<String>>> diagnoseCase(XFile image) async {
    try {
      final raw = await uploadImageToAPI(image);
      final Response response = await apiConsumer.post(
        'http://10.0.2.2:5000/predict',
        isFormData: true,
        data: {
          'file': raw,
        },
      );
      List<String> diagnosis = [];
      for (var element in response.data['class_name']) {
        diagnosis.add((element));
      }
      return right(diagnosis);
    } on Exception catch (_) {
      return left(
        ApiErrorModel(message: 'Failed to Connect to connect to model'),
      );
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> addTest(String diagnosis) async {
    try {
      final response = await apiConsumer
          .post('${EndPoints.baseUrl}${EndPoints.addTest}', data: {
        'date': DateTime.now().toUtc().toIso8601String(),
        'diagnosis': diagnosis,
      });
      return right(response.data['message']);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, String>> sendEmail(String diagnosis) async {
    try {
      final response = await apiConsumer
          .post('${EndPoints.baseUrl}${EndPoints.sendEmail}', data: {
        'date': DateTime.now().toUtc().toIso8601String(),
        'diagnosis': diagnosis,
      });
      return right(response.data['message']);
    } catch (e) {
      return left(ApiErrorHandler.handleError(e));
    }
  }
}
