import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget readText(
    {required String text,
      double? size,
      Color? color,
      TextAlign? align,
      FontWeight? fontWeight,
      bool? bold,
      String getFont = 'Inter',
      bool underline = false,
      TextDecoration? textDecorationFormat,
      Color? textDecorationFormatColor,
      FontWeight? textSpanFontWeight}) =>
    RichText(
      textAlign: align ?? TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: text,
              style: GoogleFonts.getFont(getFont,
                  fontWeight: fontWeight ?? FontWeight.w400,
                  fontSize: size ?? 16,
                  color: color ?? Colors.black,
                  decoration: textDecorationFormat ?? TextDecoration.none,
                  decorationColor: textDecorationFormatColor ?? Colors.black)),
        ],
      ),
    );
