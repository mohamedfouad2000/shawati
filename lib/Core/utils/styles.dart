import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shawati/Core/utils/colors.dart';

abstract class StylesData {
  static TextStyle font28 = const TextStyle(
    color: Color(0xFF404D53),
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font12 = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: const Color(0xff000000).withOpacity(.5),
      fontSize: 12,
      fontWeight: FontWeight.w300,
    ),
  );
  static TextStyle font13 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
  );

  static TextStyle font17 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color(0xff101623),
      fontSize: 17,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle font14 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
  );

  static TextStyle font9 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.grey,
      fontSize: 9,
      fontWeight: FontWeight.w300,
    ),
  );

  static TextStyle font24Google = GoogleFonts.raleway(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
  );

  //  color: Colors.black,
  // fontSize: 24,
  // fontWeight: FontWeight.w600,

  static TextStyle font16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color(0xff001829),
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  );
  static TextStyle font12Rubik = GoogleFonts.rubik(
    textStyle: const TextStyle(
      color: Color(0xff030303),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle font16raleway = GoogleFonts.raleway(
    textStyle: const TextStyle(
      color: Color(0xff001829),
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
  );
  static TextStyle font18 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
  );

  static TextStyle font10 = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: ConstColor.kMainColor,
      fontSize: 10,
      fontWeight: FontWeight.w700,
    ),
  );
  static TextStyle font10Rubik = GoogleFonts.rubik(
    textStyle: const TextStyle(
      color: Color(0xff3B3B3B),
      fontSize: 10,
      fontWeight: FontWeight.w700,
    ),
  );
  static TextStyle font11 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color(0xff2369FC),
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
  );

  static TextStyle font8 = const TextStyle(
    color: Color(0xFF94949D),
    fontSize: 8.88,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font7 = const TextStyle(
    color: Color(0xFFE92929),
    fontSize: 7.66,
    fontWeight: FontWeight.w500,
  );

  static TextStyle font20 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: Color(0xff2369FC),
      fontSize: 20.7,
      fontWeight: FontWeight.w500,
    ),
  );
}
