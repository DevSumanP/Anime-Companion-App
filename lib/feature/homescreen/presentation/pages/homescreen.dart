import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/anime_service.dart';
import 'package:flutter_application_1/feature/homescreen/presentation/models/anime_card.dart';
import 'package:flutter_application_1/feature/homescreen/presentation/models/popular_anime_card.dart';
import 'package:flutter_application_1/feature/homescreen/presentation/widgets/banner.dart';
import 'package:flutter_application_1/feature/new_episode_releases/presentation/pages/new_episode_releases.dart';
import 'package:flutter_application_1/feature/top_hits_anime/presentation/pages/top_hits_anime.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List topPopularAnimeList = [];
  List newAnimeReleaseList = [];
  List topAiringAnimeList = [];
  List mostFavoriteAnimeList = [];
  List latestCompletedAnimeList = [];

  @override
  void initState() {
    super.initState();
    fetchAnime();
  }

  Future<void> fetchAnime() async {
    try {
      final fetchedTopPopularAnime = await AnimeService.fetchTopPopularAnime();
      final fetchedNewReleaseAnime = await AnimeService.fetchNewReleases();
      final fetchedTopAiringAnime = await AnimeService.fetchTopAiringAnime();
      final fetchedMostFavoriteAnime =
          await AnimeService.fetchMostFavoriteAnime();
      final fetchedLatestCompletedAnime =
          await AnimeService.fetchLatestCompletedAnime();

      setState(() {
        topPopularAnimeList = fetchedTopPopularAnime;
        newAnimeReleaseList = fetchedNewReleaseAnime;
        topAiringAnimeList = fetchedTopAiringAnime;
        mostFavoriteAnimeList = fetchedMostFavoriteAnime;
        latestCompletedAnimeList = fetchedLatestCompletedAnime;
      });
    } catch (e) {
      print('Failed to fetch anime data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: topPopularAnimeList.isEmpty &&
                newAnimeReleaseList.isEmpty &&
                topAiringAnimeList.isEmpty &&
                mostFavoriteAnimeList.isEmpty &&
                latestCompletedAnimeList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AnimeBanner(),
                    const SizedBox(height: 10),
                    // Top Popular Anime Section
                    _buildSectionHeader(
                      title: 'Top Popular Anime',
                      onTapSeeAll: () => _navigateToSeeAllTopAnime(context),
                    ),
                    const SizedBox(height: 10),
                    _buildPopularAnimeHorizontalList(topPopularAnimeList),

                    const SizedBox(height: 15),

                    // Top Airing Anime Section
                    _buildSectionHeader(
                      title: 'Top Airing Anime',
                      onTapSeeAll: () => _navigateToSeeAllTopAnime(context),
                    ),
                    const SizedBox(height: 10),
                    _buildAnimeHorizontalList(topAiringAnimeList),

                    const SizedBox(height: 15),

                    // New Episode Release Section
                    _buildSectionHeader(
                      title: 'New Episode Release',
                      onTapSeeAll: () =>
                          _navigateToSeeAllNewAnimeRelease(context),
                    ),
                    const SizedBox(height: 10),
                    _buildAnimeHorizontalList(newAnimeReleaseList),

                    const SizedBox(height: 15),

                    // Most Favorite Anime Section
                    _buildSectionHeader(
                      title: 'Most Favorite Anime',
                      onTapSeeAll: () => _navigateToSeeAllTopAnime(context),
                    ),
                    const SizedBox(height: 10),
                    _buildAnimeHorizontalList(mostFavoriteAnimeList),

                    const SizedBox(height: 15),

                    // Latest Completed Anime Section
                    _buildSectionHeader(
                      title: 'Latest Completed Anime',
                      onTapSeeAll: () => _navigateToSeeAllTopAnime(context),
                    ),
                    const SizedBox(height: 10),
                    _buildAnimeHorizontalList(latestCompletedAnimeList),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildSectionHeader(
      {required String title, required VoidCallback onTapSeeAll}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          GestureDetector(
            onTap: onTapSeeAll,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'See All',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 53, 185, 0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularAnimeHorizontalList(List animeList) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          final anime = animeList[index];
          return TopPopularAnime(
            imageUrl: anime['images']['jpg']['image_url'] ?? '',
            score: anime['score']?.toString() ?? 'N/A',
            popularity: anime['popularity']?.toString() ?? 'N/A',
            title: anime['title']?.toString() ?? 'N/A',
          );
        },
      ),
    );
  }

  Widget _buildAnimeHorizontalList(List animeList) {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: animeList.length,
        itemBuilder: (context, index) {
          final anime = animeList[index];
          return AnimeCard(
            imageUrl: anime['images']['jpg']['image_url'] ?? '',
            score: anime['score']?.toString() ?? 'N/A',
            title: anime['title'] ?? 'N/A',
            time: anime['duration']?.toString() ?? '24 min',
          );
        },
      ),
    );
  }

  void _navigateToSeeAllTopAnime(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TopHitsAnime()),
    );
  }

  // void _navigateToSeeAllTopAiringAnime(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const TopAiringAnime()),
  //   );
  // }

  void _navigateToSeeAllNewAnimeRelease(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NewEpisodeReleases()),
    );
  }

  // void _navigateToSeeAllMostFavAnime(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const MostFavAnime()),
  //   );
  // }

  // void _navigateToSeeAllLatestCompletedAnime(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const LatestCompletedAnime()),
  //   );
  // }
}
