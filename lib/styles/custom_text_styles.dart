import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTitleStyle({required Color color, bool isBold = false}) {
  return GoogleFonts.robotoMono(
      textStyle: TextStyle(
        fontSize: 18.0,
        color: color,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
  );
}

TextStyle customCardTitle({Color? color}) {
  return GoogleFonts.robotoMono(
    textStyle: TextStyle(
      fontSize: 12.0,
      color: color ?? const Color(0xFF333333),
      fontWeight: FontWeight.w400,
    )
  );
}

TextStyle customCardLinkStyle() {
  return GoogleFonts.robotoMono(
      textStyle: const TextStyle(
        fontSize: 16.0,
        color: Color(0xFFD94A4A),
        fontWeight: FontWeight.w700,
      )
  );
}

TextStyle customDashboardText({Color? color}) {
  return GoogleFonts.robotoMono(
      textStyle: TextStyle(
        fontSize: 15.0,
        color: color ?? const Color(0xFF048ABF),
        fontWeight: FontWeight.w700,
      )
  );
}

TextStyle customListCardTitle({Color? color}) {
  return GoogleFonts.robotoMono(
      textStyle: TextStyle(
        fontSize: 14.0,
        color: color ?? Color(0xFF333333),
        fontWeight: FontWeight.w500,
      )
  );
}

TextStyle customButtonText({Color? color}) {
  return GoogleFonts.robotoMono(
      textStyle: TextStyle(
        fontSize: 16.0,
        color: color ?? Color(0xFF333333),
        fontWeight: FontWeight.w700,
      )
  );
}
