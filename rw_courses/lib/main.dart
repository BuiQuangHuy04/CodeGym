import 'package:flutter/material.dart';

import 'ui/rw_courses_app.dart';
import '/constants/index.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        titleTextStyle: Style.appbar,
        backgroundColor: Colors.green,
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
    ),
    home: const RwCoursesApp(),
  ));
}
