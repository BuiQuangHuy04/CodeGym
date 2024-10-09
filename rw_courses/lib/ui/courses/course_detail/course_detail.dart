import '/constants/index.dart';

class CourseDetail extends StatelessWidget {
  final Data data;

  const CourseDetail(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [ScrollingTitle(data: data)]),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            //banner
            _bannerWidget(context),
            //main
            _mainWidget(context),
            //detail
            _detailWidget(context),
            //view course btn,
            _viewCourseBtn(context),
          ],
        ),
      ),
    );
  }

  Widget _bannerWidget(BuildContext context) {
    return Hero(
      tag: 'cardArtwork-${data.id}',
      transitionOnUserGestures: true,
      child: Center(
        child: data.attributes!.cardArtworkUrl != null ? Image.network(
          data.attributes!.cardArtworkUrl!,
          width: MediaQuery.sizeOf(context).width * 0.68,
        ):Image.asset(
          'assets/images/flutter_icon.png',
          width: MediaQuery.sizeOf(context).width * 0.68,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _mainWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data.attributes!.name!,
          style: Style.contentBigBold,
          textAlign: TextAlign.justify,
        ),
        Text(
          data.attributes!.description!
              .replaceAll('<p>', '')
              .replaceAll('</p>', ''),
          style: Style.subContentBig,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _detailWidget(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, presenter, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Domain(s): ${presenter.domainStrConverter(data)}',
              style: Style.subContentBig,
              textAlign: TextAlign.justify,
            ),
            Text(
              'Level: '
              '${data.attributes!.difficulty!.split('')[0].toUpperCase()}'
              '${data.attributes!.difficulty!.substring(1)}',
              style: Style.subContentBig,
            ),
            Text(
              data.attributes!.contributorString!,
              style: Style.contentBigBold,
              textAlign: TextAlign.justify,
            ),
          ],
        );
      },
    );
  }

  Widget _viewCourseBtn(BuildContext context) {
    return TextButton(
      onPressed: () => _launchInBrowserView(Uri(
        scheme: 'https://www.kodeco.com/${data.id}',
      )),
      child: const Text(
        'Xem khóa học',
        style: Style.subContent,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Future<void> _launchInBrowserView(Uri url) async {
    // if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
    //   throw Exception('Could not launch $url');
    // }
  }
}
