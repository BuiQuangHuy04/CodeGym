import '/constants/index.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build NewsPage');
    }

    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        provider.getListNews();

        final listNews = provider.listNews;

        return listNews.isEmpty
            ? Center(
                child: IconButton(
                  onPressed: () {
                    provider.clearNewsProperties();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const NewsAddingPage(),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.add_circle_outline_rounded,
                    color: Colors.green,
                    size: MediaQuery.sizeOf(context).width * 0.8,
                  ),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(AppPadding.small),
                itemCount: listNews.length,
                itemBuilder: (context, index) {
                  return newsItemWidget(
                    listNews.reversed.elementAt(index),
                  );
                },
              );
      },
    );
  }
}
