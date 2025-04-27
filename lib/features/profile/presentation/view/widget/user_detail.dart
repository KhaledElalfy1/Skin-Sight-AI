import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';

import '../../../../../core/utils/app_images.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          color: AppColors.primaryColor),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImages.femaleImg,
                      ),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            const Text(
              'test@gmail.com',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            const Text(
              'Dina Ahmed',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffDBE2EE)),
            ),
          ],
        ),
      ),
    );
  }
}
