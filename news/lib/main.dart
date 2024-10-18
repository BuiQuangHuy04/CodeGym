import 'package:news/constants/index.dart';

Future<void> main() async {
  if (kDebugMode) {
    print('run main');
  }
  WidgetsFlutterBinding.ensureInitialized();
  final objectBox = await ObjectBox.create();
  runApp(
    ChangeNotifierProvider(
      create: (context) => NewsProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'News',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.green,
            titleTextStyle: Style.appbarTitle,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.green,
          ),
          elevatedButtonTheme: const ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll<Color>(
                Color(0xFF4CAF50),
              ),
              textStyle: WidgetStatePropertyAll<TextStyle>(
                Style.elevatedTextBtn,
              ),
            ),
          ),
          textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(
              textStyle: WidgetStatePropertyAll<TextStyle>(
                Style.textBtn,
              ),
            ),
          ),
        ),
        themeAnimationStyle: AnimationStyle(
          duration: AppDuration.normal,
          reverseDuration: AppDuration.normal,
        ),
        themeAnimationDuration: AppDuration.normal,
        home: MyAppNews(objectBox),
      ),
    ),
  );
}
