import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/anime_service.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/models/popular_anime_card.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/widgets/badge.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/widgets/badge_with_icon.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/widgets/banner.dart';
import 'package:flutter_application_1/feature/anime_detail/presentation/widgets/episodes.dart';
import 'package:flutter_application_1/feature/top_hits_anime/presentation/models/top_hits_anime_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class AnimeDetail extends StatefulWidget {
  final String animeTitle;

  const AnimeDetail({super.key, required this.animeTitle});

  @override
  State<AnimeDetail> createState() => _AnimeDetailState();
}

class _AnimeDetailState extends State<AnimeDetail> {
  List<dynamic> animeDetail = [];
  bool isLoading = true; // Loading state to manage fetching
  bool hasError = false; // To handle errors
  List recommendedAnimeList = [];

  @override
  void initState() {
    super.initState();
    fetchAnime();
  }

  Future<void> fetchAnime() async {
    try {
      final fetchAnimeDetail =
          await AnimeService.fetchAnimeWithTheirName(widget.animeTitle);

      if (fetchAnimeDetail.isNotEmpty) {
        setState(() {
          animeDetail = fetchAnimeDetail;
          print(recommendedAnimeList);
          fetchAnimeWithGenre();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          hasError = true;
        });
      }
    } catch (e) {
      print('Failed to fetch anime data: $e');
      setState(() {
        isLoading = false;
        hasError = true; // Handle the error state
      });
    }
  }

  String getGenreNames() {
    if (animeDetail.isNotEmpty && animeDetail[0]['genres'] != null) {
      List<dynamic> genres = animeDetail[0]['genres'];

      // Map through the genres to extract names
      List<String> genreNames =
          genres.map((genre) => genre['name']?.toString() ?? 'N/A').toList();

      String genre = genreNames.join(', ');

      print('Genre: $genre');

      // Join the names into a single string
      return genre; // You can customize the delimiter
    }
    return 'N/A'; // Return a default value if there are no genres
  }

  Future<void> fetchAnimeWithGenre() async {
    final fetchRecommendedAnimeDetail =
        await AnimeService.fetchAnimeWithTheirGenre(getGenreNames());
    setState(() {
      recommendedAnimeList = fetchRecommendedAnimeDetail;
      print(recommendedAnimeList);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(), // Show loading indicator
              )
            : hasError || animeDetail.isEmpty
                ? const Center(
                    child: Text(
                        'Failed to load data or no data available'), // Show error or empty message
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Anime Banner with Image
                        AnimeViewBanner(
                          imageUrl: animeDetail[0]['images']['jpg']
                                      ['large_image_url']
                                  ?.toString() ??
                              'N/A',
                        ),
                        const SizedBox(height: 10),

                        // Title Section
                        buildTitleSection(),

                        // Score and Rating Section
                        buildScoreAndRatingSection(),

                        // Genre and Synopsis Section
                        buildGenreAndSynopsisSection(),

                        // Episodes Section
                        buildEpisodesSection(),

                        //Tab Section
                        buidTabContentSection(),
                      ],
                    ),
                  ),
      ),
    );
  }

  // Title Section
  Widget buildTitleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250,
            child: Text(
              animeDetail[0]['title_english']?.toString() ?? 'N/A',
              style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Row(
            children: [
              Icon(IconlyLight.bookmark, size: 23),
              SizedBox(width: 25),
              Icon(IconlyLight.send, size: 23),
            ],
          ),
        ],
      ),
    );
  }

  // Score and Rating Section
  Widget buildScoreAndRatingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 600,
          child: Row(
            children: [
              const Icon(
                IconlyBold.star,
                color: Colors.amber,
                size: 16,
              ),
              const SizedBox(width: 5),
              Text(
                animeDetail[0]['score']?.toString() ?? 'N/A',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: const Color(0xff1a1a1a),
                ),
              ),
              const SizedBox(width: 10),
              badge(
                animeDetail[0]['rating']?.toString() ?? 'N/A',
                const Color(0xffffffff),
                const Color(0xff1a1a1a),
              ),
              badge(
                'HD',
                const Color(0xff1a1a1a),
                const Color(0xFFFFC107),
              ),
              badgeWithIcon(
                Icons.subtitles,
                '19',
                const Color(0xff1a1a1a),
                const Color.fromARGB(255, 181, 255, 146),
              ),
              badgeWithIcon(
                Icons.mic,
                '17',
                const Color(0xff1a1a1a),
                const Color.fromARGB(255, 245, 166, 248),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Genre and Synopsis Section
  Widget buildGenreAndSynopsisSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              'Genre: ${getGenreNames()}',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 116, 116, 116)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              animeDetail[0]['synopsis']?.toString() ?? 'N/A',
              style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 138, 138, 138)),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Episodes Section
  Widget buildEpisodesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Trailer',
            style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 0, 0, 0)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  EpisodeCard(
                    videoUrl:
                        animeDetail[0]['trailer']['url']?.toString() ?? 'N/A',
                    imageUrl: animeDetail[0]['trailer']['images']
                                ['maximum_image_url']
                            ?.toString() ??
                        'N/A',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buidTabContentSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              indicatorColor: Color(0xff1a1a1a),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 1,
              labelColor: Color(0xff1a1a1a),
              unselectedLabelColor: Color(0xff9d9d9d),
              tabs: [
                Tab(text: 'More Like This'),
                Tab(text: 'Comments'),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: MediaQuery.of(context).size.height - 420,
                width: 600,
                child: TabBarView(
                  children: [
                    Column(children: [
                      SizedBox(
                        width: 600,
                        height: MediaQuery.of(context).size.height - 420,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: recommendedAnimeList.length,
                          itemBuilder: (context, index) {
                            final anime = recommendedAnimeList[index];
                            return TopHitsAnimeCard(
                              title: anime['title_english'] ?? 'Unknown',
                              imageUrl:
                                  anime['images']['jpg']['image_url'] ?? '',
                              score: anime['score']?.toString() ?? 'N/A',
                              popularity:
                                  anime['popularity']?.toString() ?? 'N/A',
                              year: anime['aired']['prop']['from']['year']
                                      ?.toString() ??
                                  'Unknown',
                              genres: (anime['genres'] as List)
                                  .map((genre) => genre['name'])
                                  .join(', '),
                              airing: anime['airing'] ?? false,
                              episodes: anime['episodes']?.toString() ?? '',
                            );
                          },
                        ),
                      )
                    ]),
                    Center(child: Text('Tab 2 Content')),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
