import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
   AppText(
    this.text, {
    super.key,
    this.fontSize= 16,
    this.maxLines,
    this.overflow,
    this.fontWeight,
    this.textAlign,
    this.color,
    this.textDirection,
  });

  final String text;
  final double fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
        Color? color;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final TextDirection? textDirection;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: fontSize ,
        fontWeight: fontWeight,
        color: color,
      ),
      maxLines: maxLines ,
      overflow: overflow ?? TextOverflow.ellipsis,
      textAlign: textAlign,
      textDirection: textDirection,
    );
  }
}
