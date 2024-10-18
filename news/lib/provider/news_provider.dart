import '/constants/index.dart';

class NewsProvider with ChangeNotifier {

  NewsProvider._internal();

  static final NewsProvider _instance = NewsProvider._internal();

  factory NewsProvider() {
    return _instance;
  }

  //data load?
  bool isDataLoaded = false;

  void updateDataLoaded(bool state) {
    isDataLoaded = state;

    notifyDataUpdated();
  }

  //news properties
  String postDate = '';
  String thumbPath = '';

  void clearNewsProperties() {
    postDate = '';
    thumbPath = '';

    notifyDataUpdated();
  }

  void updateThumbPath(String path) {
    thumbPath = path;

    notifyDataUpdated();
  }

  void updatePostDate(String date) {
    postDate = date;

    notifyDataUpdated();
  }

  //list news
  var listNews = <News>[];

  void getListNews() {
    listNews = isDataLoaded ? listNews : objectBox!.newsBox.getAll();
    isDataLoaded = true;

    notifyDataUpdated();
  }

  void addNews(News news) {
    listNews.add(news);

    notifyDataUpdated();
  }

  void addAllNews(List<News> listNews) {
    listNews.addAll(listNews);

    notifyDataUpdated();
  }

  void updateNews(int index, News news) {
    listNews[index] = news;

    notifyDataUpdated();
  }

  //objectbox
  ObjectBox? objectBox;

  Future<void> createObjectbox(ObjectBox value) async {
    objectBox = value;

    notifyDataUpdated();
  }

  void notifyDataUpdated() {
    WidgetsBinding.instance.addPostFrameCallback((_) => notifyListeners());
  }

  void saveLocalStorage() {
    if (objectBox != null) {
      objectBox!.newsBox.putMany(listNews);
    }
  }
}
