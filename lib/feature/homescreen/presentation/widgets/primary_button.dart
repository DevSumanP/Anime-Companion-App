import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({super.key});

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.play_arrow_outlined, size: 14),
        label: Text(
          'Watch',
          style: GoogleFonts.lato(
              fontSize: 12,
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
