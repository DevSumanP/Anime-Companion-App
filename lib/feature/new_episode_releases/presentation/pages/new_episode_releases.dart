import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/anime_service.dart';
import 'package:flutter_application_1/feature/new_episode_releases/presentation/models/new_episodes_releases_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class NewEpisodeReleases extends StatefulWidget {
  const NewEpisodeReleases({super.key});

  @override
  State<NewEpisodeReleases> createState() => _NewEpisodeReleasesState();
}

class _NewEpisodeReleasesState extends State<NewEpisodeReleases> {
  List animeList = [];

  @override
  void initState() {
    super.initState();
    fetchNewReleases();
  }

  Future<void> fetchNewReleases() async {
    try {
      final fetchedAnime = await AnimeService.fetchNewReleases();
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
            'New Anime Releases',
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
            : Padding(
                padding: const EdgeInsets.all(
                  16.0,
                ),
                child: GridView.builder(
                  itemCount: animeList.length,
                  itemBuilder: (context, index) {
                    final anime = animeList[index];
                    return NewEpisodesReleasesCard(
                      imageUrl: anime['images']['jpg']['image_url'] ?? '',
                      score: anime['score']?.toString() ?? 'N/A',
                      episodes: anime['episodes']?.toString() ?? '',
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0),
                ),
              ),
      ),
    );
  }
}
