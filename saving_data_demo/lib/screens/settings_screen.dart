import 'package:flutter/material.dart';
import 'package:saving_data_demo/storage/sp_helper.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _listName = '';
  int _calories = 0;
  bool _showFileSize = false;
  bool _showDate = false;

  final _listNameController = TextEditingController();
  final _caloriesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SPHelper.getInstance();
    _listName = prefs.getListName();
    _calories = prefs.getCalories();
    _showFileSize = prefs.getShowFileSize();
    _showDate = prefs.getShowDate();

    // final prefs = await SecureHelper.getInstance();
    // _listName = await prefs.getListName();
    // _calories = await prefs.getCalories();
    // _showFileSize = await prefs.getShowFileSize();
    // _showDate = await prefs.getShowDate();

    setState(() {});

    _listNameController.text = _listName;
    _caloriesController.text = _calories.toString();
  }

  Future<void> _saveSettings() async {
    final prefs = await SPHelper.getInstance();
    // final prefs = await SecureHelper.getInstance();
    await prefs.setListName(_listNameController.text);
    await prefs.setCalories(int.tryParse(_caloriesController.text) ?? 0);
    await prefs.setShowFileSize(_showFileSize);
    await prefs.setShowDate(_showDate);

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Settings saved')));
  }

  //Widget sẽ gọi dispose() khi Widget bị xoá
  @override
  void dispose() {
    _listNameController.dispose(); //Xoá _listNameController
    _caloriesController.dispose(); //Xoá _caloriesController
    super.dispose();

    //Ứng dụng Flutter nó sẽ định kỳ dọn dẹp
    //các instance không còn được sủ dụng
    //=> Để tối ưu ứng dụng và tránh rò rỉ bộ nhớ
    //=> Nên dispose các instance khi mà WIdget bị dispose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _listNameController,
              decoration: const InputDecoration(
                labelText: 'List Name',
                labelStyle: TextStyle(fontSize: 22),
              ),
              onChanged: (value) {
                setState(() {
                  _listName = value;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _caloriesController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Maximum Daily Calories',
                labelStyle: TextStyle(fontSize: 22),
              ),
              onChanged: (value) {
                setState(() {
                  _calories = int.tryParse(value) ?? 0;
                });
              },
            ),
          ),
          SwitchListTile(
            value: _showFileSize,
            title: const Text(
              'Show File Size',
              style: TextStyle(fontSize: 22),
            ),
            contentPadding: const EdgeInsets.all(8),
            onChanged: (value) {
              setState(() {
                _showFileSize = value;
              });
            },
          ),
          SwitchListTile(
            value: _showDate,
            title: const Text(
              'Show Date',
              style: TextStyle(fontSize: 22),
            ),
            contentPadding: const EdgeInsets.all(8),
            onChanged: (value) {
              setState(() {
                _showDate = value;
              });
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveSettings,
        child: const Icon(Icons.save),
      ),
    );
  }
}
