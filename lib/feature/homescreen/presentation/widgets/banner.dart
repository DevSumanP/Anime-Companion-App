import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class AnimeBanner extends StatefulWidget {
  const AnimeBanner({super.key});

  @override
  State<AnimeBanner> createState() => _AnimeBannerState();
}

class _AnimeBannerState extends State<AnimeBanner> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section with image and overlay
          Stack(
            children: [
              Image.network(
                'https://img.flawlessfiles.com/_r/1366x768/100/b8/b1/b8b1bbc386d81a95c40e236089e11312/b8b1bbc386d81a95c40e236089e11312.jpg', // Replace with your image
                width: double.infinity,
                height: 280,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: 280,
                color: Colors.black.withOpacity(0.55),
              ),
              Positioned(
                left: 20,
                bottom: 25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "#8 Spotlight",
                      style: GoogleFonts.poppins(
                          color: Colors.amber, fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Wind Breaker",
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          IconlyLight.play,
                          color: Colors.white70,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "TV",
                          style: GoogleFonts.poppins(
                              color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          IconlyLight.time_circle,
                          color: Colors.white70,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "23m",
                          style: GoogleFonts.poppins(
                              color: Colors.white70, fontSize: 12),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          IconlyLight.calendar,
                          color: Colors.white70,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text("Apr 5, 2024",
                            style: GoogleFonts.poppins(
                                color: Colors.white70, fontSize: 12)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "Watch Now",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xff1a1a1a)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 160, 160, 160),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                              "Detail",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color(0xffffffff)),
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
        ],
      ),
    );
  }
}
