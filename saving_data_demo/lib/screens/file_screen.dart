import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saving_data_demo/storage/file_helper.dart';

class FileScreen extends StatefulWidget {
  const FileScreen({
    super.key,
    this.fileName,
  });

  final String? fileName; //Nullable
  //Nếu mà fileName == null => Màn hình tạo mới file
  //Nếu mà fileName != null => Màn hình chỉnh sửa file

  @override
  State<FileScreen> createState() => _FileScreenState();
}

class _FileScreenState extends State<FileScreen> {
  final _fileNameController = TextEditingController();
  final _contentController = TextEditingController();
  final _fileHelper = FileHelper();

  @override
  void initState() {
    super.initState();
    if (widget.fileName != null) {
      _fileNameController.text = widget.fileName!;
      _readFile();
    }
  }

  //Hàm để đọc file
  Future<void> _readFile() async {
    if (widget.fileName != null) {
      final data = await _fileHelper.readFile(widget.fileName!);
      setState(() {
        _contentController.text = data;
        _showMessage('File loaded');
      });
    }
  }

  //Hàm ghi file
  Future<void> _writeFile() async {
    await _fileHelper.writeFile(
      _fileNameController.text,
      _contentController.text,
    );
    _showMessage('File saved');
  }

  //Hàm xoá file
  Future<void> _deleteFile() async {
    await _fileHelper.deleteFile(_fileNameController.text);
    setState(() {
      _fileNameController.clear();
      _contentController.clear();
      _showMessage('File deleted');
      Navigator.pop(context);
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  void dispose() {
    _fileNameController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fileName ?? 'New File'),
        actions: [
          if (widget.fileName != null)
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Bạn có muốn xoá file này?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            _deleteFile();
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            'Xoá',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Huỷ'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _writeFile,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _fileNameController,
              enabled: widget.fileName == null,
              decoration: const InputDecoration(
                labelText: 'File Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 10,
            ),
          ],
        ),
      ),
    );
  }
}
