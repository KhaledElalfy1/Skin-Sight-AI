import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skin_sight_ai/core/database/cache/cashe_helper.dart';
import 'package:skin_sight_ai/core/routers/app_router.dart';
import 'package:skin_sight_ai/core/routers/routing.dart';
import 'package:skin_sight_ai/core/services/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await getIt<CacheHelper>().init();
  runApp(const SkinSightAI());
}

class SkinSightAI extends StatelessWidget {
  const SkinSightAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routing.onboarding,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: GoogleFonts.nunitoSans().fontFamily,
      ),
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
