import 'package:flutter/material.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/pages/anime_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class AnimeCard extends StatelessWidget {
  final String imageUrl;
  final String score;
  final String title;
  final String time;

  const AnimeCard({
    super.key,
    required this.imageUrl,
    required this.score,
    required this.title,
    required this.time,
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
            height: 240,
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 120,
                  child: Text(
                    title,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  time,
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
