import '/constants/index.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  const NewsDetail(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ScrollingTitle(news: news),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(AppPadding.extra),
        child: ListView(
          children: [
            _titleWidget(context),
            _sourceWidget(context),
            _dateTimeWidget(context),
            _bannerWidget(context),
          ],
        ),
      ),
    );
  }

  Widget _titleWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.normal),
      alignment: Alignment.center,
      child: Text(
        news.title,
        style: Style.contentNormal,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _bannerWidget(BuildContext context) {
    return Center(
      child: Thumbnail(
        news: news,
        width: MediaQuery.sizeOf(context).width * 0.8,
      ),
    );
  }

  Widget _sourceWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.normal),
      alignment: Alignment.centerLeft,
      child: Text(
        news.source,
        style: Style.subContentBig,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _dateTimeWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.normal),
      alignment: Alignment.centerLeft,
      child: Text(
        news.dateTime,
        style: Style.subContentBig,
        textAlign: TextAlign.justify,
      ),
    );
  }
}