import '/constants/index.dart';
import 'package:path/path.dart' as p;

class ObjectBox {
  late final Store store;
  late final Box<News> newsBox;

  ObjectBox._create(this.store) {
    newsBox = store.box<News>();
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "news"));
    return ObjectBox._create(store);
  }
}
