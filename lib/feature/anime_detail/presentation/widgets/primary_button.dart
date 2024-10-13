import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchButton extends StatefulWidget {
  const WatchButton({super.key});

  @override
  State<WatchButton> createState() => _WatchButtonState();
}

class _WatchButtonState extends State<WatchButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.play_arrow_outlined, size: 20),
        label: Text(
          'Watch',
          style: GoogleFonts.lato(
              fontSize: 14,
              color: const Color(0xFF1A1A1A),
              fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
