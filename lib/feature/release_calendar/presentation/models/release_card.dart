import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ReleaseCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String episodes;

  const ReleaseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.episodes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(),
        child: Row(
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
                    height: 100,
                    fit: BoxFit.cover,
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
              ],
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width - 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.lato(
                        fontSize: 17, fontWeight: FontWeight.w800),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$episodes episodes',
                    style: GoogleFonts.lato(
                        fontSize: 13,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
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
