import 'package:flutter/material.dart';
import 'package:rw_courses/constants/index.dart';
import 'package:rw_courses/presenters/course_presenter.dart';

class CourseDetail extends StatelessWidget {
  final Data data;
  final CoursePresenter presenter;

  const CourseDetail(this.data, this.presenter, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.attributes!.name!),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Center(
              child: Image.network(
                data.attributes!.cardArtworkUrl!,
                width: MediaQuery.sizeOf(context).width * 0.68,
              ),
            ),
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
            Text(
              'Domain(s): ${presenter.domainConverter(data)}',
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
        ),
      ),
    );
  }
}
