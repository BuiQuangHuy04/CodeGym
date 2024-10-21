import 'package:shared_preferences/shared_preferences.dart';

class SPHelper {
  //Lưu cài đặt của người dùng
  //Hằng số sử dụng để làm key cho các thuộc tính cài đặt của người dùng
  static const String _listNameKey = 'listName';
  static const String _caloriesKey = 'calories';
  static const String _showFileSizeKey = 'showFileSize';
  static const String _showDateKey = 'showDate';

  //Tạo một Singleton Class
  //Constructor private => Ko thể gọi ở đâu khác
  SPHelper._internal();
  //_instance sẽ giữ instance duy nhất của class SPHelper
  static final SPHelper _instance = SPHelper._internal();
  //_preferences chứa instance của SharedPreferences
  late SharedPreferences _preferences;

  //getInstance => ĐIểm truy cập cục bộ để lấy instance
  //=> Các đối tượng khác truy cập đc instance
  static Future<SPHelper> getInstance() async {
    _instance._preferences = await SharedPreferences.getInstance();
    return _instance;
  }

  //listName
  Future<bool> setListName(String listName) async {
    return await _preferences.setString(_listNameKey, listName);
  }

  String getListName() {
    return _preferences.getString(_listNameKey) ?? 'My Recipes';
  }

  //calories
  Future<bool> setCalories(int calories) async {
    return await _preferences.setInt(_caloriesKey, calories);
  }

  int getCalories() {
    return _preferences.getInt(_caloriesKey) ?? 2000;
  }

  //showFileSize
  Future<bool> setShowFileSize(bool showFileSize) async {
    return await _preferences.setBool(_showFileSizeKey, showFileSize);
  }

  bool getShowFileSize() {
    return _preferences.getBool(_showFileSizeKey) ?? true;
  }

  //showDate
  Future<bool> setShowDate(bool showDate) async {
    return await _preferences.setBool(_showDateKey, showDate);
  }

  bool getShowDate() {
    return _preferences.getBool(_showDateKey) ?? true;
  }

  Future<bool> deleteSettings() async {
    return await _preferences.remove(_listNameKey) &&
        await _preferences.remove(_caloriesKey) &&
        await _preferences.remove(_showFileSizeKey) &&
        await _preferences.remove(_showDateKey);
  }
}
