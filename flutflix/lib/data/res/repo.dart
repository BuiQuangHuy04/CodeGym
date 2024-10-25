import 'package:flutflix/data/model/movie.dart';

abstract class Repository {
  Future<List<Movie>> getData(String EP);
}