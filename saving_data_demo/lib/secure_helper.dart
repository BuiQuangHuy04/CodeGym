import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SSHelper {
  static const String _listNameKey = 'listName';
  static const String _caloriesKey = 'calories';
  static const String _showFileSizeKey = 'showFileSize';
  static const String _showDateKey = 'showDate';

  SSHelper._internal();

  static final SSHelper _instance = SSHelper._internal();
  late FlutterSecureStorage _storage;

  static Future<SSHelper> getInstance() async {
    _instance._storage = const FlutterSecureStorage();
    return _instance;
  }

  Future<void> setListName(String listName) async {
    await _storage.write(
      key: _listNameKey,
      value: listName,
    );
  }

  Future<String> getListName() async {
    return await _storage.read(
          key: _listNameKey,
        ) ??
        'My Recipes';
  }

  Future<void> setCalories(int calories) async {
    await _storage.write(
      key: _caloriesKey,
      value: calories.toString(),
    );
  }

  Future<int> getCalories() async {
    String? caloriesStr = await _storage.read(
      key: _caloriesKey,
    );
    return int.tryParse(caloriesStr ?? '2000') ?? 2000;
  }

  Future<void> setShowFileSize(bool showFileSize) async {
    await _storage.write(
      key: _showFileSizeKey,
      value: showFileSize.toString(),
    );
  }

  Future<bool> getShowFileSize() async {
    String? showFileSizeStr = await _storage.read(
      key: _showFileSizeKey,
    );
    return showFileSizeStr == 'true' ? true : false;
  }

  Future<void> setShowDate(bool showDate) async {
    await _storage.write(
      key: _showDateKey,
      value: showDate.toString(),
    );
  }

  Future<bool> getShowDate() async {
    String? showDateStr = await _storage.read(
      key: _showDateKey,
    );
    return showDateStr == 'true' ? true : false;
  }

  Future<void> deleteSettings() async {
    await _storage.delete(
      key: _listNameKey,
    );
    await _storage.delete(
      key: _caloriesKey,
    );
    await _storage.delete(
      key: _showFileSizeKey,
    );
    await _storage.delete(
      key: _showDateKey,
    );
  }
}
