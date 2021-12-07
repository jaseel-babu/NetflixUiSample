import 'dart:convert';
import 'package:http/http.dart' as http;

List revers = [];
List latest = [];
List popular = [];
List toprated = [];
List upcoming = [];
const latesturl =
    "https://api.themoviedb.org/3/movie/top_rated?api_key=045d7c3a7f27aa10218f8b1e095f56c0";
const popularurl =
    "https://api.themoviedb.org/3/movie/popular?api_key=045d7c3a7f27aa10218f8b1e095f56c0";
const upcomingurl =
    'https://api.themoviedb.org/3/movie/upcoming?api_key=045d7c3a7f27aa10218f8b1e095f56c0';
const topratedurl =
    "https://api.themoviedb.org/3/movie/top_rated?api_key=045d7c3a7f27aa10218f8b1e095f56c0";
fetchtoprated() async {
  try {
    final response = await http.get(Uri.parse(topratedurl));
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);

      toprated = data['results'];
    } else {
      throw Exception('Failed to load album');
    }

    return toprated;
  } catch (e) {
    return [];
  }
}

fetchupcoming() async {
  try {
    final response = await http.get(Uri.parse(upcomingurl));
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);

      upcoming = data['results'];
    } else {
      throw Exception('Failed to load album');
    }

    return upcoming;
  } catch (e) {
    return [];
  }
}

fetchPopular() async {
  try {
    final response = await http.get(Uri.parse(popularurl));
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);

      popular = data['results'];
    } else {
      throw Exception('Failed to load album');
    }

    return popular;
  } catch (e) {
    return [];
  }
}

fetchlatest() async {
  try {
    final response = await http.get(Uri.parse(latesturl));
    if (response.statusCode == 200) {
      Map data = json.decode(response.body);

      latest = data['results'];
    } else {
      throw Exception('Failed to load album');
    }

    return latest;
  } catch (e) {
    return [];
  }
}

List categories = [
  "Home",
  "My List",
  "Available for Download",
  "Holiday",
  "Hindi",
  "Tamil",
  "Punjabi",
  "Telugu",
  "Malayalam",
  "Marathi",
  "Bengali",
  "English"
];
