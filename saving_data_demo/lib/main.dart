import 'package:flutter/material.dart';

import 'screens/file_list_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Storage Demo',
      home: StorageDemo(),
    );
  }
}

class StorageDemo extends StatelessWidget {
  const StorageDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                title: const Text('File List'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FileListScreen(),
                  ));
                },
              ),
            ),
            Card(
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                title: const Text('SQLite Demo'),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
