import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:skin_sight_ai/features/profile/data/model/user_profile_model.dart';
import 'package:skin_sight_ai/features/profile/data/repo/user_profile_repo.dart';

import '../../../../../core/database/api/api_error_model.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.userProfileRepo) : super(UserProfileInitial());
  final UserProfileRepo userProfileRepo;

  Future<void> userProfile() async {
    emit(UserProfileLoading());
    final result = await userProfileRepo.getUserProfile();
    result.fold((userProfile) {
      emit(UserProfileSuccess(userProfile: userProfile));
    }, (apiErrorModel) {
      emit(UserProfileFailure(apiErrorModel: apiErrorModel));
    });
  }
}
