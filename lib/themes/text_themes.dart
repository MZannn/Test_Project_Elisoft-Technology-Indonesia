import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/constants/color_constants.dart';

class Themes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      labelLarge: GoogleFonts.poppins(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 16,
        color: ColorConstants.secondaryColor,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
