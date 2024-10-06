import 'package:flutter/material.dart';
import 'package:rw_courses/ui/courses/courses_page.dart';
import '../constants/index.dart';

class RwCoursesApp extends StatelessWidget {
  const RwCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appTitle),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.menu_rounded,
            ),
          ),
        ],
      ),
      body: const CoursesPage(),
    );
  }
}
