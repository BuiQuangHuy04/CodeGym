import '/constants/index.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CourseRepo());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoursePresenter>(
      builder: (context, presenter, child) {
        return Stack(
          children: [
            FutureBuilder(
              future: _controller.fetchListData(
                Provider.of<CoursePresenter>(
                  context,
                  listen: true,
                ).domain,
              ),
              builder: (context, snapshot) {
                final data = snapshot.data;
                if (data != null) {
                  Future.delayed(
                    const Duration(seconds: 4),
                    () => presenter.updateLoading(false),
                  );

                  return ListView.builder(
                    itemCount: data.length,
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 30,
                    ),
                    itemExtent: MediaQuery.sizeOf(context).height * 0.15,
                    itemBuilder: (_, i) {
                      return _buildRow(data[i]);
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                );
              },
            ),
            presenter.isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }

  Widget _buildRow(Data data) {
    return Consumer<CoursePresenter>(
      builder: (context, presenter, child) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetail(data),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.attributes!.name!,
                      maxLines: 3,
                      style: Style.contentBigBold,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      presenter.domainStrConverter(data),
                      maxLines: 3,
                      style: Style.subContent,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Hero(
                tag: 'cardArtwork-${data.id}',
                transitionOnUserGestures: true,
                child: data.attributes!.cardArtworkUrl != null
                    ? Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Image.network(
                          errorBuilder: (context, error, stackTrace) =>
                              const LoadingImg(),
                          data.attributes!.cardArtworkUrl!,
                          width: MediaQuery.sizeOf(context).width * 0.25,
                          fit: BoxFit.contain,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.green,
                                ),
                              );
                            }
                          },
                        ),
                      )
                    : const LoadingImg(),
              ),
            ],
          ),
        );
      },
    );
  }
}
