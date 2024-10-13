import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AnimeViewBanner extends StatefulWidget {
  final String imageUrl;
  const AnimeViewBanner({super.key, required this.imageUrl});

  @override
  State<AnimeViewBanner> createState() => _AnimeViewBannerState();
}

class _AnimeViewBannerState extends State<AnimeViewBanner> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Image.network(
            widget.imageUrl,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                IconlyBold.arrow_left_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
          )
        ],
      ),
    );
  }
}
