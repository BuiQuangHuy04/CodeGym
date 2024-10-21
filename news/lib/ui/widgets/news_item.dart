import 'package:news/ui/news/news_detail_page/news_detail_page.dart';

import '/constants/index.dart';

Widget newsItemWidget(News news) {
  return Consumer<NewsProvider>(
    builder: (context, provider, child) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => NewsDetail(news),
            ),
          );
          if (kDebugMode) {
            print('news item clicked');
          }
        },
        child: Card(
          elevation: 6.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.normal),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.small,
              horizontal: AppPadding.small,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Thumbnail(
                  news: news,
                  width: MediaQuery.sizeOf(context).width * 0.25,
                ),
                const SizedBox(
                  width: AppPadding.normal,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        maxLines: 3,
                        textAlign: TextAlign.justify,
                        style: Style.contentBigBold,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppPadding.small),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            news.source,
                            maxLines: 2,
                            style: Style.subContent,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            news.dateTime,
                            maxLines: 2,
                            style: Style.subContent,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
