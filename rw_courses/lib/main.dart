import '/constants/index.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CourseProvider(),
      child: MaterialApp(
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
      ),
    ),
  );
}
