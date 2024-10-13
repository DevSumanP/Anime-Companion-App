import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/pages/anime_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class TopPopularAnime extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String score;
  final String popularity;

  const TopPopularAnime({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.score,
    required this.popularity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnimeDetail(
            animeTitle: title,
          ),
        ),
      ),
      child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            height: 200,
            decoration: const BoxDecoration(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: SizedBox(
                        width: 70,
                        child: Text(
                          title,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      popularity,
                      style: GoogleFonts.poppins(
                        color: const Color.fromARGB(255, 255, 196, 0),
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 5,
                ),
                Stack(
                  children: [
                    // Image widget
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        imageUrl,
                        width: 130,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Positioned text over the image
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
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
