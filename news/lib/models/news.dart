import '/constants/index.dart';

@Entity()
class News {
  @Id()
  int id = 0;
  final String title;
  final String source;
  final String dateTime;
  final String thumbPath;

  News({
    required this.title,
    required this.source,
    required this.dateTime,
    required this.thumbPath,
  });

  @override
  String toString() {
    return 'News{'
        '\n title: $title,'
        '\n source: $source,'
        '\n dateTime: $dateTime,'
        '\n thumbPath: $thumbPath'
        '\n}';
  }
}
