import '/constants/index.dart';

abstract class Repository {
  Future<List<Data>> getListData(int domainFilter);
}