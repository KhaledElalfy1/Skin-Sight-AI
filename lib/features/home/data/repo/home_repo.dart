import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skin_sight_ai/core/database/api/api_error_model.dart';

abstract class HomeRepo {
  Future<Either<ApiErrorModel, List<String>>> diagnoseCase(XFile image);

  Future<Either<ApiErrorModel, String>> addTest(String diagnosis);
  Future<Either<ApiErrorModel, String>> sendEmail(String diagnosis);
}
