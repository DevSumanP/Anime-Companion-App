import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/anime_service.dart';
import 'package:flutter_application_1/feature/top_hits_anime/presentation/models/top_hits_anime_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class TopHitsAnime extends StatefulWidget {
  const TopHitsAnime({super.key});

  @override
  State<TopHitsAnime> createState() => _TopHitsAnimeState();
}

class _TopHitsAnimeState extends State<TopHitsAnime> {
  List animeList = [];

  @override
  void initState() {
    super.initState();
    fetchAnime();
  }

  Future<void> fetchAnime() async {
    try {
      final fetchedAnime = await AnimeService.fetchTopPopularAnime();
      setState(() {
        animeList = fetchedAnime;
      });
    } catch (e) {
      print('Failed to fetch anime data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Top Hits Anime',
            style: GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(context),
            child: const Icon(
              IconlyLight.arrow_left,
              size: 24,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Icon(IconlyLight.search),
              ),
            ),
          ],
        ),
        body: animeList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: animeList.length,
                itemBuilder: (context, index) {
                  final anime = animeList[index];
                  return TopHitsAnimeCard(
                    title: anime['title_english'] ?? 'Unknown',
                    imageUrl: anime['images']['jpg']['image_url'] ?? '',
                    score: anime['score']?.toString() ?? 'N/A',
                    popularity: anime['popularity']?.toString() ?? 'N/A',
                    year: anime['aired']['prop']['from']['year']?.toString() ??
                        'Unknown',
                    genres: (anime['genres'] as List)
                        .map((genre) => genre['name'])
                        .join(', '),
                    airing: anime['airing'] ?? false,
                    episodes: anime['episodes']?.toString() ?? '',
                  );
                },
              ),
      ),
    );
  }
}
