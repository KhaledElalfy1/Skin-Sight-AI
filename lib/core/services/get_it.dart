import 'package:get_it/get_it.dart';
import 'package:skin_sight_ai/core/database/api/api_consumer.dart';
import 'package:skin_sight_ai/core/database/api/dio_factory.dart';
import 'package:skin_sight_ai/core/database/cache/cashe_helper.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_in_repo.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_in_repo_impl.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_up_repo.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_up_repo_impl.dart';
import 'package:skin_sight_ai/features/home/data/repo/home_repo.dart';
import 'package:skin_sight_ai/features/home/data/repo/home_repo_impl.dart';
import 'package:skin_sight_ai/features/profile/data/repo/user_profile_repo.dart';

import '../../features/profile/data/repo/user_profile_repo_impl.dart';
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
  getIt.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<SignInRepo>(
    () => SignInRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
  getIt.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<UserProfileRepo>(
    () => UserProfileRepoImpl(apiConsumer: getIt<ApiConsumer>()),
  );
}
