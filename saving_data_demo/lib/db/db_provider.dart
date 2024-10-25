import 'package:path_provider/path_provider.dart';
import 'package:saving_data_demo/db/client.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DBProvider {
  //Tạo một Singleton Class
  //Constructor private => Ko thể gọi ở đâu khác
  DBProvider._internal();

  static Database? _database;
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'my_db.db');
    return openDatabase(
      path,
      //Hàm này sẽ thực thi khi DB lần đầu tiên được khởi tạo
      onCreate: _onCreate,
      //Hàm này sẽ thực thi nếu nó phát hiện đã có sẵn DB
      onUpgrade: _onUpgrade,
    );
  }

  //Hàm CREATE TABLE => Tạo bảng lưu dữ liệu
  static Future _onCreate(Database db, int version) async {
    final batch = db.batch();
    batch.execute('''
    CREATE TABLE Client (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
    )
    ''');
    await batch.commit(noResult: true);
  }

  //Hàm UPGRADE => Cập nhật các thay đổi khi version thay đổi
  static Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      final batch = db.batch();
      batch.execute('DROP TABLE IF EXISTS Client');
      await batch.commit(noResult: true);
      await _onCreate(db, newVersion);
    }
  }

  //Hàm thêm Client mới
  static Future<int> newClient(Client newClient) async {
    final db = await database;
    //Lấy max id + 1
    final table = await db.rawQuery('SELECT MAX(id) + 1 as id FROM Client');
    final newId = table.first['id'];
    //Thêm vào trong bảng 1 trường mới với id = new id
    final res = await db.rawInsert(
      'INSERT INTO Client(id, first_name, last_name) values (?, ?, ?)',
      [newId, newClient.firstName, newClient.lastName],
    );
    return res; //returns the last inserted row ID
  }

  //Hàm lấy client có id
  static Future<Client?> getClient(int id) async {
    final db = await database;
    final res = await db.query('Client', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty ? Client.fromJson(res.first) : null;
  }

  //Hàm lấy danh sách clients
  static Future<List<Client>> getClients() async {
    final db = await database;
    final res = await db.query('Client');
    return res.isNotEmpty ? res.map((r) => Client.fromJson(r)).toList() : [];
  }

  //Hàm update client có id
  static Future<int> updateClient(Client client) async {
    final db = await database;
    final res = db.update('Client', client.toJson(),
        where: 'id = ?', whereArgs: [client.id]);
    return res;
  }

  //Hàm delete client có id
  static Future<int> deleteClient(int id) async {
    final db = await database;
    final res = db.delete('Client', where: 'id = ?', whereArgs: [id]);
    return res;
  }
}
