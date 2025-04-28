import 'package:flutter/material.dart';
import 'package:skin_sight_ai/core/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.isSuffixIcon,
    this.validator,
  });
  final String label, hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isSuffixIcon;
  final String? Function(String?)? validator;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          obscureText: isSecure,
          controller: widget.controller,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter your ${widget.label}';
            }
            return null;
          },
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            suffixIcon: widget.isSuffixIcon
                ? GestureDetector(
                    onTap: () {
                      isSecure = !isSecure;
                      setState(() {});
                    },
                    child: isSecure
                        ? const Icon(
                            Icons.visibility_off,
                            color: AppColors.primaryColor,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: AppColors.primaryColor,
                          ),
                  )
                : const SizedBox(),
            fillColor: const Color(0xffC3CFE2).withOpacity(0.4),
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: AppColors.primaryColor.withOpacity(0.4),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
