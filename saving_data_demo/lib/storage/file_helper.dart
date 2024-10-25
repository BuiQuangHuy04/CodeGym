import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FileHelper {
  //Hàm trả về đường dẫn của thư mục Documents của Ứng dụng
  Future<String> get _path async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  //Hàm trả về tệp tại path fileName chỉ định
  Future<File> getFile(String fileName) async {
    final path = await _path;
    final filePath = p.join(path, fileName);
    return File(filePath);
  }

  //Hàm ghi vào tệp fileName nội dung (chuỗi văn bản )content
  Future<File> writeFile(String fileName, String content) async {
    final localFile = await getFile(fileName);
    return localFile.writeAsString(content);
  }

  //Hàm để đọc nội dung tệp fileName
  Future<String> readFile(String fileName) async {
    try {
      final localFile = await getFile(fileName);
      return await localFile.readAsString();
    } catch (e) {
      print('Error reading file: $e');
      return '';
    }
  }

  //Hàm xoá
  Future<void> deleteFile(String fileName) async {
    final file = await getFile(fileName);
    await file.delete();
  }
}
