import 'dart:convert';

import 'package:flutflix/data/res/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../constant/constant.dart';
import '../model/movie.dart';
import '../model/data.dart';

class DataRepo implements Repository {
  @override
  Future<List<Movie>> getData(String EP) async {
    final List<Movie> movies = [];

    var url = Constants.API + EP;

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final res = Data.fromJson(json);

      final results = res.results;
      if (results != null) {
        if (kDebugMode) {
          // print(results.length);
          // print(results.first);
        }

        for (var movie in results) {
          movies.add(movie);
        }
      }

      return movies;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
