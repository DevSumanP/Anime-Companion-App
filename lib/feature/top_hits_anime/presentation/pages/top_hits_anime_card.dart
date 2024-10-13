import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopHitsAnimeCard extends StatelessWidget {
  final bool airing;
  final String title;
  final String imageUrl;
  final String score;
  final String popularity;
  final String year;
  final String genres;
  final String episodes;

  const TopHitsAnimeCard({
    super.key,
    required this.airing,
    required this.title,
    required this.imageUrl,
    required this.score,
    required this.popularity,
    required this.year,
    required this.genres,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(),
        child: Row(
          children: [
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
                Positioned(
                  bottom: 5,
                  left: 10,
                  child: Text(
                    popularity,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width - 182,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    airing ? 'Currently Airing' : 'Finished Airing',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: airing
                          ? const Color.fromARGB(255, 253, 134, 125)
                          : const Color.fromARGB(255, 0, 100, 182),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.w800),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '$year | Japan',
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 100, 100, 100)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Genre: $genres',
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        color: const Color.fromARGB(255, 107, 107, 107),
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        '$episodes episodes',
                        style: GoogleFonts.lato(
                            fontSize: 14,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w600),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        height: 30,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.add, size: 14),
                          label: Text(
                            'My List',
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
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
