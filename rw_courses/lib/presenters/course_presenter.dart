import '/constants/index.dart';

class CoursePresenter with ChangeNotifier {
  /*Strings
    static const String appTitle = 'RW Courses';
    static const String filter = 'Lọc';
    static const String iOS = 'iOS';
    static const String android = 'Android';
    static const String flutter = 'Flutter';
    static const String unity = 'Unity';
    static const String sss = 'Server-Side Swift';
    static const String macOS = 'macOS';
    static const String archived = 'Đã lưu trữ';
    static const String all = 'Tất cả';
    static const String unknown = 'Không xác định';

    Constants
    static String iosDomain = '1';
    static String androidDomain = '2';
    static String unityDomain = '3';
    static String macOSDomain = '5';
    static String archivedDomain = '6';
    static String sssDomain = '8';
    static String flutterDomain = '9';

    static String appTitle = 'RW Courses';
    static String filter = 'Lọc';
    static String iOS = 'iOS';
    static String android = 'Android';
    static String flutter = 'Flutter';
    static String unity = 'Unity';
    static String sss = 'Server-Side Swift';
    static String macOS = 'macOS';
    static String archived = 'Đã lưu trữ';
    static String all = 'Tất cả';
    static String unknown = 'Không xác định';
  */

  var isLoading = false;

  void updateLoading(bool state) {
    if (state != isLoading) {
      isLoading = state;
      WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
    }
  }

  var filter = Strings.all;
  var domain = Constants.allFilter;

  void convertFilter() {
    switch (filter) {
      case Strings.iOS:
        domain = Constants.iosFilter;
        break;
      case Strings.android:
        domain = Constants.androidFilter;
        break;
      case Strings.flutter:
        domain = Constants.flutterFilter;
        break;
      case Strings.sss:
        domain = Constants.sssFilter;
        break;
      case Strings.macOS:
        domain = Constants.macOSFilter;
        break;
      case Strings.all:
      default:
        domain = Constants.allFilter;
        break;
    }

    notifyListeners();
  }

  String domainStrConverter(Data data) {
    var domains = data.relationships!.domains!.data!;
    String domain = '';

    if (domains.length > 1) {
      for (Data data in domains) {
        switch (data.id!) {
          case Constants.iosDomain:
            domain += ', ${Strings.iOS}';
            break;
          case Constants.androidDomain:
            domain += ', ${Strings.android}';
            break;
          case Constants.unityDomain:
            domain += ', ${Strings.unity}';
            break;
          case Constants.macOSDomain:
            domain += ', ${Strings.macOS}';
            break;
          case Constants.archivedDomain:
            domain += ', ${Strings.archived}';
            break;
          case Constants.sssDomain:
            domain += ', ${Strings.sss}';
            break;
          case Constants.flutterDomain:
            domain += ', ${Strings.flutter}';
            break;
          default:
            break;
        }
      }

      domain = domain.substring(2);
    } else {
      switch (domains.first.id) {
        case Constants.iosDomain:
          domain = Strings.iOS;
          break;
        case Constants.androidDomain:
          domain = Strings.android;
          break;
        case Constants.unityDomain:
          domain = Strings.unity;
          break;
        case Constants.macOSDomain:
          domain = Strings.macOS;
          break;
        case Constants.archivedDomain:
          domain = Strings.archived;
          break;
        case Constants.sssDomain:
          domain = Strings.sss;
          break;
        case Constants.flutterDomain:
          domain = Strings.flutter;
          break;
        default:
          break;
      }
    }

    return domain;
  }

  // Future<void> saveFilter(String selectedFilter) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('selectedFilter', selectedFilter);
  // }
  //
  // Future<String?> loadFilter() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString('selectedFilter');
  // }
}
