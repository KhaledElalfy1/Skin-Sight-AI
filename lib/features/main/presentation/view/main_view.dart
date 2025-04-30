import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skin_sight_ai/core/services/get_it.dart';
import 'package:skin_sight_ai/features/home/data/repo/home_repo.dart';
import 'package:skin_sight_ai/features/home/presentation/model_view/home_cubit/home_cubit.dart';
import 'package:skin_sight_ai/features/home/presentation/view/home_view.dart';
import 'package:skin_sight_ai/features/profile/data/repo/user_profile_repo.dart';
import 'package:skin_sight_ai/features/profile/presentation/view/profile_view.dart';
import 'package:skin_sight_ai/features/profile/presentation/view_model/user_profile_cubit/user_profile_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  NotchBottomBarController notchBottomBarController =
      NotchBottomBarController();

  int currentIndex = 0;
  double kIconSize = 24.0;
  double kBottomRadius = 20.0;
  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => HomeCubit(getIt<HomeRepo>()),
      child: const HomeView(),
    ),
    BlocProvider(
      create: (context) =>
          UserProfileCubit(getIt<UserProfileRepo>())..userProfile(),
      child: const ProfileView(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: AnimatedNotchBottomBar(
        notchBottomBarController: notchBottomBarController,
        bottomBarItems: [
          BottomBarItem(
            activeItem: Image.asset('assets/images/unselected_home.png'),
            inActiveItem: Image.asset('assets/images/selected_home.png'),
          ),
          BottomBarItem(
            activeItem: Image.asset('assets/images/unselected_profile.png'),
            inActiveItem: Image.asset('assets/images/selected_profile.png'),
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        kIconSize: kIconSize,
        kBottomRadius: kBottomRadius,
        color: const Color(0xffC3CFE2),
      ),
    );
  }
}
