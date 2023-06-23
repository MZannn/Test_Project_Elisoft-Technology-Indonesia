import 'package:flutter/material.dart';
import 'package:test_project/constants/color_constants.dart';
import 'package:test_project/themes/text_themes.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.label,
  });
  final void Function()? onPressed;
  final String label;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          label,
          style: Themes.light.textTheme.labelLarge,
        ),
      ),
    );
  }
}
