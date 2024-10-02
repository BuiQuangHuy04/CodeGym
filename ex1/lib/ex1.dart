import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
Mô tả
Ứng dụng cho phép người dùng nhấn nút để đếm số lần nhấn và sử dụng thanh trượt (Slider) để điều chỉnh độ sáng của một Container.
*/

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const CounterApp());
  });
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CounterApp',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _brightness = 0.5;

  void _incrementCounter() => setState(() => _counter++);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(bottom: 40),
              color: Colors.blue.withOpacity(_brightness),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You have pushed the button this many times:\n',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  TextSpan(
                    text: '$_counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: Slider(
                value: _brightness,
                onChanged: (value) => setState(() => _brightness = value),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
