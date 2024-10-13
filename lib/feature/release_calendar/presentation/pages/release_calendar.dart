import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/service/anime_service.dart';
import 'package:flutter_application_1/feature/release_calendar/presentation/models/release_card.dart';
import 'package:flutter_application_1/feature/release_calendar/presentation/widgets/calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class ReleaseCalendar extends StatefulWidget {
  const ReleaseCalendar({super.key});

  @override
  State<ReleaseCalendar> createState() => _ReleaseCalendarState();
}

class _ReleaseCalendarState extends State<ReleaseCalendar> {
  List animeList = [];

  @override
  void initState() {
    super.initState();
    fetchAnime();
  }

  Future<void> fetchAnime() async {
    try {
      final fetchedAnime = await AnimeService.fetchTopAiringAnime();
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
            title: Text(
              'Release Calendar',
              style:
                  GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w600),
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                const Calendar(),
                SizedBox(
                  height: 600,
                  width: double.infinity,
                  child: animeList.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: animeList.length,
                          itemBuilder: (context, index) {
                            final anime = animeList[index];
                            return ReleaseCard(
                              title: anime['title_english'] ?? 'Unknown',
                              imageUrl:
                                  anime['images']['jpg']['image_url'] ?? '',
                              episodes: anime['episodes']?.toString() ?? '',
                            );
                          },
                        ),
                ),
              ],
            ),
          )),
    );
  }
}
