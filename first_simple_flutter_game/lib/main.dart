import 'package:first_simple_flutter_game/ui/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screen/game_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((_) {
    runApp(const BullsEyeApp());
  });
}

class BullsEyeApp extends StatelessWidget {
  const BullsEyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hồng tâm",
      home: const GamePage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          foregroundColor: const Color(0xFFFFFFFF),
          backgroundColor: const Color(0xFF654AAA),
          titleTextStyle: CustomTextStyle.title(context),
        ),
        actionIconTheme: ActionIconThemeData(
          backButtonIconBuilder: (_) => const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xFFFFFFFF),
            backgroundColor: const Color(0xFF654AAA),
          ),
        ),
      ),
    );
  }
}
