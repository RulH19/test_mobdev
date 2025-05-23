import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTyphography {
  static final _commonPoppinsStyle = GoogleFonts.poppins();
  static final _commonHinduGunturStyle = GoogleFonts.hindGuntur();

  static TextStyle headlineHigh = _commonPoppinsStyle.copyWith(
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headlineSmall = _commonPoppinsStyle.copyWith(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static TextStyle kontenHigh = _commonHinduGunturStyle.copyWith(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static TextStyle kontenSmall = _commonHinduGunturStyle.copyWith(
    color: Colors.white,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );
}
