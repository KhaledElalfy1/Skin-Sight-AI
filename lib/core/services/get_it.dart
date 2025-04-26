
import 'package:get_it/get_it.dart';
import 'package:skin_sight_ai/core/database/api/api_consumer.dart';
import 'package:skin_sight_ai/core/database/api/dio_factory.dart';
import 'package:skin_sight_ai/core/database/cache/cashe_helper.dart';

import '../database/api/dio_consumer.dart';

final getIt = GetIt.instance;

void setup() {
  /// CacheHelper instance
  getIt.registerLazySingleton<CacheHelper>(
    () => CacheHelper(),
  );

  // api data

  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: DioFactory.getDio()),
  );

  // Auth repos


}
