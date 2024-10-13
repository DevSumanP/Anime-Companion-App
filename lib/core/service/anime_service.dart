import 'dart:convert';
import 'package:flutter_application_1/core/constants/genreid.dart';
import 'package:http/http.dart' as http;

class AnimeService {
  static const String _baseUrl = 'https://api.jikan.moe/v4';
  static const String _animeWatchUrl = 'https://vidsrc.icu/embed/anime';

  // Function to fetch top popular anime data
  static Future<List<dynamic>> fetchTopPopularAnime() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/top/anime?filter=bypopularity'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch top popular anime data');
    }
  }

  // Function to fetch top airing anime data
  static Future<List<dynamic>> fetchTopAiringAnime() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/top/anime?filter=airing'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch top airing anime data');
    }
  }

  // Function to fetch new releases anime data
  static Future<List<dynamic>> fetchNewReleases() async {
    const url = '$_baseUrl/anime?status=airing&order_by=start_date&sort=desc';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch new releases');
    }
  }

  // Function to fetch most favorite anime data
  static Future<List<dynamic>> fetchMostFavoriteAnime() async {
    final response =
        await http.get(Uri.parse('$_baseUrl/top/anime?filter=favorite'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch most favorite anime data');
    }
  }

  // Function to fetch latest completed anime data
  static Future<List<dynamic>> fetchLatestCompletedAnime() async {
    const url =
        '$_baseUrl/top/anime?status=complete&order_by=end_date&sort=desc';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch latest completed anime');
    }
  }

  static Future<List<dynamic>> fetchAnimeWithTheirName(String title) async {
    var url = '$_baseUrl/anime?q=$title';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch latest completed anime');
    }
  }

  static Future<List<dynamic>> fetchAnimeVideoWithTheirName(int id) async {
    var url = '$_animeWatchUrl/23/1/1';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch latest completed anime');
    }
  }

  static Future<List<dynamic>> fetchAnimeWithTheirGenre(String genres) async {
    // Split the incoming genres by comma and trim whitespace
    print('Function:$genres');
    List<String> genreList =
        genres.split(',').map((genres) => genres.trim()).toList();

    print(genreList);
    // Map each genre to its corresponding ID
    List<int> genreIds = genreList.map((genres) {
      return genreIdMap[genres] ?? 0; // Default to 0 if not found
    }).toList();

    print(genreIds);

    // Store all results here
    List<dynamic> allResults = [];

    // Loop through each valid genre ID
    for (int id in genreIds) {
      // Construct the URL for each genre ID
      String url = '$_baseUrl/anime?genres=$id'; // Use a valid ID

      print('Fetching data from: $url'); // Print the URL for debugging

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Assuming you want to collect all data in a single list
        allResults
            .addAll(data['data']); // Add the results to the allResults list
      } else {
        throw Exception('Failed to fetch anime with genre ID: $id');
      }
    }

    return allResults; // Return all combined results
  }
}
