import 'package:flutter/material.dart';
import 'package:test_project/constants/color_constants.dart';
import 'package:test_project/themes/text_themes.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.suffixIcon = false,
    this.onPressed,
  });

  final TextEditingController controller;
  final String label;
  final bool? obscureText;
  final bool? suffixIcon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConstants.tertiaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            style: Themes.light.textTheme.titleSmall,
          ),
          TextField(
            controller: controller,
            obscureText: obscureText!,
            obscuringCharacter: '*',
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.zero,
              suffixIcon: suffixIcon == true
                  ? IconButton(
                      onPressed: onPressed,
                      icon: obscureText!
                          ? Icon(
                              Icons.visibility,
                              color: ColorConstants.secondaryColor,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: ColorConstants.secondaryColor,
                            ),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
