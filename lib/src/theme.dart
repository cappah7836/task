import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
const Color primaryClr= Color(0xFF3282B8);
const Color darkScreenClr= Color(0xFF1B262C);
const Color textClr= Color(0xFF0F4C75);
const Color secondaryClr = Color(0xFFBBE1FA);
const Color DarkColor = Color(0xFF121a1e);


class Themes{
  static final light = ThemeData(
  backgroundColor: primaryClr,
  primaryColor: secondaryClr,

  brightness: Brightness.light
  );

  static final dark = ThemeData(
      backgroundColor: DarkColor,
      primaryColor: darkScreenClr,
      brightness: Brightness.dark
  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato(
    textStyle:TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color:Get.isDarkMode?Colors.white:textClr
    )
  );
}

TextStyle get HeadingStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
          color:Get.isDarkMode?Colors.white:textClr
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color:Get.isDarkMode?Colors.white:textClr
      )
  );
}

TextStyle get SubtitleStyle{
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color:Get.isDarkMode?Colors.grey[100]:textClr
      )
  );
}