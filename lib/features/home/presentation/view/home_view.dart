
import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';
import 'package:skin_sight_ai/features/home/presentation/view/widgets/choose_image_bloc_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Take Photo',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Chose the suitable way to upload your photo.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ChooseImageBlocBuilder(),
              
             
            ],
          ),
        ),
      ),
    );
  }
}
