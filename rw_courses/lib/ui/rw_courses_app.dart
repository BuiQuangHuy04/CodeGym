import '/constants/index.dart';

class RwCoursesApp extends StatefulWidget {
  const RwCoursesApp({super.key});

  @override
  State<RwCoursesApp> createState() => _RwCoursesAppState();
}

class _RwCoursesAppState extends State<RwCoursesApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appTitle),
        toolbarHeight: 65,
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: DropdownFilter(),
          ),
        ],
      ),
      body: const CoursesPage(),
    );
  }
}
