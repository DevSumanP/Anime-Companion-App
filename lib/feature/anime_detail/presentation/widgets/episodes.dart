import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/pages/player.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class EpisodeCard extends StatelessWidget {
  final String imageUrl;
  final String videoUrl;

  const EpisodeCard(
      {super.key, required this.videoUrl, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => YouTubePlayerScreen(videoUrl: videoUrl)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 110,
          width: 150,
          child: Stack(
            children: [
              // Image widget
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 150,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  height: 110,
                  color: Colors.black.withOpacity(0.2),
                ),
              ),

              // Positioned text over the image
              const Positioned(
                top: 100 / 2 - 10,
                left: 130 / 2 - 10,
                child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      IconlyBold.play,
                      size: 24,
                      color: Color(0xffffffff),
                    )),
              ),

              Positioned(
                bottom: 5,
                left: 10,
                child: Text(
                  'Trailer',
                  style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
