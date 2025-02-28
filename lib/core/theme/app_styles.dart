import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsappclone/core/theme/app_color.dart';

class AppStyles {
  static TextStyle headingPrimary(
          {double fontSize = 16, FontWeight fontWeight = FontWeight.w600,Color? color}) =>
      TextStyle(
          color: color?? AppColor.lightThemeColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        fontFamily: GoogleFonts.roboto().fontFamily
      );
}
