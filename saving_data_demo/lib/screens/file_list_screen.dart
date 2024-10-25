import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saving_data_demo/screens/file_screen.dart';
import 'package:saving_data_demo/screens/settings_screen.dart';
import 'package:saving_data_demo/storage/file_helper.dart';
import 'package:saving_data_demo/storage/sp_helper.dart';

class FileListScreen extends StatefulWidget {
  const FileListScreen({super.key});

  @override
  State<FileListScreen> createState() => _FileListScreenState();
}

class _FileListScreenState extends State<FileListScreen> {
  String _listName = '';
  bool _showSize = false;
  bool _showDate = false;

  @override
  void initState() {
    super.initState();
    _getSettings();
  }

  //Hàm load cài đặt từ Shared Preferences
  Future<void> _getSettings() async {
    final prefs = await SPHelper.getInstance();
    setState(() {
      _listName = prefs.getListName();
      _showSize = prefs.getShowFileSize();
      _showDate = prefs.getShowDate();
    });
  }

  //Hàm truy xuất danh sách các tệp
  Future<List<File>> _getFiles() async {
    final dir = await getApplicationDocumentsDirectory();
    //listSync => liệt kê tất cả nội dung trong thư mục dir
    //(Các tệp, thư mục con, liên kết)
    return dir.listSync().whereType<File>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_listName),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                builder: (context) => const SettingsScreen(),
              ))
                  .then((value) {
                _getSettings();
              });
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openFileScreen(),
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _getFiles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          final files = snapshot.data as List<File>;
          if (files.isEmpty) {
            return const Center(
              child: Text('No files found'),
            );
          }

          return ListView.builder(
            itemCount: files.length,
            itemBuilder: (context, index) {
              final file = files[index]; //Tệp
              final date = file.lastModifiedSync();
              final dateString =
                  '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute} ';
              final size = file.lengthSync();
              final fileName = file.path.split('/').last; //File Name
              final subtitle = <String>[];
              if (_showSize) {
                subtitle.add('Size: $size bytes');
              }
              if (_showDate) {
                subtitle.add('Last modified: $dateString');
              }

              return Dismissible(
                key: ValueKey(fileName),
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.all(16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (direction) {
                  final fileHelper = FileHelper();
                  fileHelper.deleteFile(fileName).then((value) {
                    setState(() {});
                  });
                },
                child: ListTile(
                  title: Text(fileName),
                  subtitle: Text(subtitle.join(', ')),
                  onTap: () {
                    _openFileScreen(fileName: fileName);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _openFileScreen({String? fileName}) {
    Navigator.of(context)
        .push(MaterialPageRoute(
      builder: (context) => FileScreen(
        fileName: fileName,
      ),
    ))
        .then((value) {
      setState(() {});
    });
  }
}
