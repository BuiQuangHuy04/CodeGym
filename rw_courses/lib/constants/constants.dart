class Constants {
  static get RW_API => 'https://api.raywenderlich.com/api/contents?'
      'filter[content_types][]=collection';

  static String iosDomain = '1';
  static String androidDomain = '2';
  static String unityDomain = '3';
  static String macOSDomain = '5';
  static String archivedDomain = '6';
  static String sssDomain = '8';
  static String flutterDomain = '9';

  static int iosFilter = 1;
  static int androidFilter = 2;
  static int unityFilter = 3;
  static int macOSFilter = 5;
  static int sssFilter = 8;
  static int flutterFilter = 9;
  static int allFilter = 0;
  static int otherFilter = -1;

  static const String filterKey = 'FILTER_KEY';
}
