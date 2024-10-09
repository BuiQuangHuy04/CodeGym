class Constants {
  static get RW_API => 'https://api.raywenderlich.com/api/contents?'
      'filter[content_types][]=collection';

  static const String iosDomain = '1';
  static const String androidDomain = '2';
  static const String unityDomain = '3';
  static const String macOSDomain = '5';
  static const String archivedDomain = '6';
  static const String sssDomain = '8';
  static const String flutterDomain = '9';

  static const int iosFilter = 1;
  static const int androidFilter = 2;
  static const int unityFilter = 3;
  static const int macOSFilter = 5;
  static const int sssFilter = 8;
  static const int flutterFilter = 9;
  static const int allFilter = 0;
  static const int otherFilter = -1;

  static const String filterKey = 'FILTER_KEY';
}
