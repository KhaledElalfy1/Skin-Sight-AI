import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import 'package:skin_sight_ai/core/services/get_it.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_in_repo.dart';
import 'package:skin_sight_ai/features/auth/data/repos/sign_up_repo.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_in_cubit/sign_in_cubit.dart';
import 'package:skin_sight_ai/features/auth/presentation/view_models/sign_up_cubit/sign_up_cubit.dart';
import 'package:skin_sight_ai/features/home/data/repo/home_repo.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/sign_in_view.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/sign_up_view.dart';
import 'package:skin_sight_ai/features/home/presentation/view/home_view.dart';
import 'package:skin_sight_ai/features/main/presentation/view/main_view.dart';

import 'package:skin_sight_ai/features/onBoarding/presentation/view/onBoarding_view.dart';
import 'package:skin_sight_ai/features/profile/data/repo/user_profile_repo.dart';
import 'package:skin_sight_ai/features/profile/presentation/view/profile_view.dart';
import 'package:skin_sight_ai/features/profile/presentation/view_model/user_profile_cubit/user_profile_cubit.dart';

import 'package:skin_sight_ai/features/splash/presentation/view/splash_view.dart';

class AppRouter {
  static Route? generateRoute(RouteSettings routeSettings) {

    switch (routeSettings.name) {
      case Routing.splash:
        return _buildRoute(const SplashView());
      case Routing.onboarding:
        return _buildRoute(const OnboardingView());
      case Routing.signIn:
        return _buildRoute(BlocProvider(
          create: (context) => SignInCubit(getIt<SignInRepo>()),
          child: const SignInView(),
        ));
      case Routing.signUp:
        return _buildRoute(BlocProvider(
          create: (context) => SignUpCubit(getIt<SignUpRepo>()),
          child: const SignUpView(),
        ));
      case Routing.main:
        return _buildRoute(const MainView());
      case Routing.home:
        return _buildRoute(BlocProvider(
          create: (context) => HomeCubit(getIt<HomeRepo>()),
          child: const HomeView(),
        ));
      case Routing.profile:
        return _buildRoute(BlocProvider(
          create: (context) => UserProfileCubit(getIt<UserProfileRepo>())..userProfile(),
          child: const ProfileView(),
        ));
      case Routing.clinicDetail:
        return _buildRoute(const Scaffold());

      default:
        return null;
    }
  }

  static Route<dynamic> _buildRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => page,
          )
        : MaterialPageRoute(builder: (_) => page);
  }
}
