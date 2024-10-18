import '/constants/index.dart';

class Thumbnail extends StatelessWidget {
  final News news;
  final double width;

  const Thumbnail({
    super.key,
    required this.news,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'thumbnail-${news.thumbPath}',
      transitionOnUserGestures: true,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.red,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.file(
            File(news.thumbPath),
            errorBuilder: (context, error, stackTrace) => Container(),
            width: width,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
