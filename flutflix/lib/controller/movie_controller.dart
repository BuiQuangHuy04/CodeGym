import 'package:flutflix/data/model/movie.dart';
import 'package:flutflix/data/res/repo.dart';

class MoviesController {
  MoviesController(this._repo);

  final Repository _repo;

  Future<List<Movie>> fetchListData(String EP) {
    return _repo.getData(EP);
  }
}