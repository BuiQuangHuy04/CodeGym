import 'package:intl/intl.dart';
import '/constants/index.dart';

class NewsAddingPage extends StatefulWidget {
  const NewsAddingPage({super.key});

  @override
  State<NewsAddingPage> createState() => _NewsAddingPageState();
}

class _NewsAddingPageState extends State<NewsAddingPage> {
  final FocusNode _textFieldFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build NewsAddingPage');
    }
    TextEditingController titleController = TextEditingController();
    TextEditingController sourceController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController thumbController = TextEditingController();

    return Consumer<NewsProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('ADD NEWS'),
            actions: [
              IconButton(
                onPressed: () {
                  if (titleController.text.isEmpty ||
                      sourceController.text.isEmpty ||
                      provider.postDate.isEmpty ||
                      provider.thumbPath.isEmpty) {
                    Fluttertoast.showToast(
                      msg: 'Please fill in the information completely!',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  } else {
                    var news = News(
                      title: titleController.text,
                      source: sourceController.text,
                      dateTime: provider.postDate,
                      thumbPath: provider.thumbPath,
                    );
                    if (kDebugMode) {
                      print(news);
                    }
                    provider.addNews(news);
                    // provider.objectBox!.newsBox.put(news);
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.save_outlined),
              )
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    hintText: 'Title',
                    controller: titleController,
                  ),
                  AppTextField(
                    hintText: 'Source',
                    controller: sourceController,
                  ),
                  AppTextField(
                    hintText: provider.postDate.isEmpty
                        ? 'Posting date'
                        : provider.postDate,
                    controller: dateController,
                    readOnly: true,
                    onTap: () async {
                      await showOmniDateTimePicker(
                        context: context,
                        is24HourMode: true,
                        isShowSeconds: false,
                        isForce2Digits: true,
                      ).then((date) {
                        if (date != null) {
                          var datetimeStr =
                              DateFormat('EE dd/MM/yyyy HH:mm:ss').format(date);

                          provider.updatePostDate(datetimeStr);

                          dateController.text = provider.postDate;

                          if (kDebugMode) {
                            print('provider.postDate: ${provider.postDate}');
                          }
                        }
                      });
                    },
                  ),
                  provider.thumbPath.isEmpty
                      ? AppTextField(
                          hintText: 'Pick a thumbnail',
                          controller: thumbController,
                          focusNode: _textFieldFocusNode,
                          readOnly: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppImagePicker(),
                              ),
                            );
                          },
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.big,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              File(provider.thumbPath),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                if (kDebugMode) {
                                  print('error: $error');
                                  print('stackTrace: $stackTrace');
                                }
                                return AppTextField(
                                  hintText: provider.thumbPath,
                                  focusNode: _textFieldFocusNode,
                                );
                              },
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
