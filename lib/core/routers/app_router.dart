import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/sign_in_view.dart';
import 'package:skin_sight_ai/features/auth/presentation/views/sign_up_view.dart';
import 'package:skin_sight_ai/features/home/presentation/view/home_view.dart';

import 'package:skin_sight_ai/features/onBoarding/presentation/view/onBoarding_view.dart';

import 'package:skin_sight_ai/features/splash/presentation/view/splash_view.dart';


class AppRouter {
  static Route? generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case Routing.splash:
        return _buildRoute(const SplashView());
      case Routing.onboarding:
        return _buildRoute(const OnboardingView());
      case Routing.signIn:
        return _buildRoute(const SignInView());
      case Routing.signUp:
        return _buildRoute(const SignUpView());
      case Routing.otp:
        return _buildRoute(const Scaffold());
      case Routing.home:
        return _buildRoute(BlocProvider(
          create: (context) => HomeCubit(),
          child: const HomeView(),
        ));
      case Routing.profile:
        return _buildRoute(const Scaffold());
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
