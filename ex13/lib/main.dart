import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() {
    return MyHomePageState();
  }
}

class MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _isLoading = _counter % 2 != 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MyHomePage');
    }
    return CounterInheritedWidget(
      isLoading: _isLoading,
      counter: _counter,
      child: Scaffold(
        body: const MyCenterWidget(),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('rebuild MyCenterWidget');
    }
    return const Center(
      child: CounterWidget(),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final state = CounterInheritedWidget.of(context);
    final isLoading = state?.isLoading ?? false;
    final counter = state?.counter ?? 0;

    if (kDebugMode) {
      print('rebuild CounterWidget');
    }
    return isLoading ? const CircularProgressIndicator() : Text('$counter');
  }
}

class CounterInheritedWidget extends InheritedWidget {
  final bool isLoading;
  final int counter;

  const CounterInheritedWidget({
    super.key,
    required this.isLoading,
    required this.counter,
    required super.child,
  });

  static CounterInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterInheritedWidget>();
  }

  @override
  bool updateShouldNotify(CounterInheritedWidget oldWidget) {
    return oldWidget.isLoading != isLoading || oldWidget.counter != counter;
  }
}
