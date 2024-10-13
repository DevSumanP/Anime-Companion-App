import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewEpisodesReleasesCard extends StatelessWidget {
  final String imageUrl;
  final String score;
  final String episodes;

  const NewEpisodesReleasesCard({
    super.key,
    required this.imageUrl,
    required this.score,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 550,
      decoration: const BoxDecoration(color: Color(0xff1a1a1a)),
      child: Stack(
        children: [
          // Image widget
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 220,
              height: 550,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 16,
              width: 25,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 61, 187, 12),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  score,
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Text(
              'Episode $episodes',
              style: GoogleFonts.lato(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
