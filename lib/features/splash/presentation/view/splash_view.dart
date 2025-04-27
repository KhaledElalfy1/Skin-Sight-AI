import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/helpers/extentions.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import 'package:skin_sight_ai/core/utils/app_images.dart';
import 'package:skin_sight_ai/core/utils/app_styles.dart';
import '../../../../core/database/cache/cache_keys.dart';
import '../../../../core/database/cache/cashe_helper.dart';
import '../../../../core/services/get_it.dart';
import '../../../../core/utils/app_colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 5),
      () => getInitRoute(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.gradientColor,
              AppColors.primaryColor,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.splashImg,
              ),
              const SizedBox(height: 19),
              Text(
                'Skin Care',
                style: AppStyles.semiBold25(context)
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  getInitRoute() async {
    bool isFirstTime =
        getIt<CacheHelper>().getBool(key: CacheKeys.isFirstTime) ?? true;
    if (mounted) {
      if (!isFirstTime) {
        context.pushReplacementNamed(Routing.home);
      } else {
        context.pushReplacementNamed(Routing.signIn);
      }
    }
  }
}
