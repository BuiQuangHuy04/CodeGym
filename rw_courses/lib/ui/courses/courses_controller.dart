import 'package:rw_courses/constants/index.dart';

class CoursesController {
  CoursesController(this._repo);

  final Repository _repo;

  Future<List<Data>> fetchListData(int domainFilter) {
    return _repo.getListData(domainFilter);
  }
}