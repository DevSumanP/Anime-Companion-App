import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget badge(String text, Color textColor, Color bgColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    margin: const EdgeInsets.symmetric(horizontal: 3),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Text(
      text,
      style: GoogleFonts.poppins(
          color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
    ),
  );
}
