import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/widgets/toast.dart';
import 'package:skin_sight_ai/features/profile/presentation/view/widget/last_result.dart';
import 'package:skin_sight_ai/features/profile/presentation/view_model/user_profile_cubit/user_profile_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import 'widget/profile_shimmer.dart';
import 'widget/user_detail.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoading) {
              return const ProfileShimmer();
            } else if (state is UserProfileSuccess) {
              final userProfile = state.userProfile;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UserDetail(
                    userEmail: userProfile.email,
                    userName: userProfile.name,
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text(
                      'LAST RESULT',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  LastResult(
                    userHistory: userProfile.history,
                  ),
                ],
              );
            } else if (state is UserProfileFailure) {
              errorToast(message: state.apiErrorModel.message ?? '');
              return const SizedBox.shrink();
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
