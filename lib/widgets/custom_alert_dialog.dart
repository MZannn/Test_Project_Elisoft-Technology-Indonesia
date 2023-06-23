import 'package:flutter/material.dart';
import 'package:test_project/themes/text_themes.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.message,
  });

  final String message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: Colors.red,
      content: Row(
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            message,
            style: Themes.light.textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
