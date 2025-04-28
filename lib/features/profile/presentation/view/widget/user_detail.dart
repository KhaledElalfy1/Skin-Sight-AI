import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class UserDetail extends StatelessWidget {
  const UserDetail(
      {super.key, required this.userEmail, required this.userName});
  final String userEmail;
  final String userName;

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
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        AppImages.femaleImg,
                      ),
                      fit: BoxFit.cover)),
            ),
            const SizedBox(height: 10),
            Text(
              userEmail,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            Text(
              userName,
              style: const TextStyle(
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
