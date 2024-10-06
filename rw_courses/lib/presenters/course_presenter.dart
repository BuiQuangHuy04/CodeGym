import '/constants/index.dart';

class CoursePresenter {
  String domainConverter(Data data) {
    var domains = data.relationships!.domains!.data!;
    String domain = '';
    /*
    static String iosDomain = '1';
    static String androidDomain = '2';
    static String unityDomain = '3';
    static String macOSDomain = '5';
    static String archivedDomain = '6';
    static String sssDomain = '8';
    static String flutterDomain = '9';
    */

    if (domains.length > 1) {
      for (Data data in domains) {
        switch (data.id!) {
          case '1':
            domain += ', IOS';
            break;
          case '2':
            domain += ', Android';
            break;
          case '3':
            domain += ', Unity';
            break;
          case '5':
            domain += ', MacOS';
            break;
          case '6':
            domain += ', Archived';
            break;
          case '8':
            domain += ', SSS';
            break;
          case '9':
            domain += ', Flutter';
            break;
          default:
            break;
        }
      }

      domain = domain.substring(2);
    } else {
      switch (domains.first.id) {
        case '1':
          domain = 'IOS';
          break;
        case '2':
          domain = 'Android';
          break;
        case '3':
          domain = 'Unity';
          break;
        case '5':
          domain = 'MacOS';
          break;
        case '6':
          domain = 'Archived';
          break;
        case '8':
          domain = 'SSS';
          break;
        case '9':
          domain = 'Flutter';
          break;
        default:
          break;
      }
    }

    return domain;
  }
}