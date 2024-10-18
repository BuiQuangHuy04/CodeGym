import '/constants/index.dart';

class MyAppNews extends StatefulWidget {
  final ObjectBox objectBox;

  const MyAppNews(this.objectBox, {super.key});

  @override
  State<MyAppNews> createState() => _MyAppNewsState();
}

class _MyAppNewsState extends State<MyAppNews> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    final isInactive = state == AppLifecycleState.inactive;
    final isPaused = state == AppLifecycleState.paused;
    final isClosed = state == AppLifecycleState.detached;
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build MyAppNews');
    }

    var provider = Provider.of<NewsProvider>(
      context,
      listen: false,
    );

    provider.createObjectbox(widget.objectBox);

    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWS'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) {
                  provider.clearNewsProperties();
                  return const NewsAddingPage();
                }),
              );
            },
            icon: const Icon(
              Icons.add_circle_outline_rounded,
            ),
          )
        ],
      ),
      body: provider.objectBox == null ?
      const Center(
        child: CircularProgressIndicator(
          color: Colors.green,
        ),
      ) : const NewsPage(),
    );
  }
}
