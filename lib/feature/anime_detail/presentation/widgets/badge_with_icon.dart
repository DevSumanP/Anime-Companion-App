import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget badgeWithIcon(
    IconData icon, String text, Color textColor, Color bgColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
    margin: const EdgeInsets.symmetric(horizontal: 3),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Icon(icon, size: 15, color: textColor),
        const SizedBox(width: 2),
        Text(
          text,
          style: GoogleFonts.poppins(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 12),
        ),
      ],
    ),
  );
}
