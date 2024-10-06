import 'package:flutter/material.dart';
import 'package:rw_courses/constants/index.dart';
import 'package:rw_courses/presenters/course_presenter.dart';
import 'package:rw_courses/ui/courses/course_detail.dart';
import 'package:rw_courses/ui/courses/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(CourseRepo());
  final _presenter = CoursePresenter();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.fetchListData(Constants.allFilter),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data != null) {
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
          return const Center(child: CircularProgressIndicator());
        });
  }

  Widget _buildRow(Data data) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseDetail(data,_presenter)),
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
                  _presenter.domainConverter(data),
                  maxLines: 3,
                  style: Style.subContent,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Image.network(
            data.attributes!.cardArtworkUrl!,
            width: MediaQuery.sizeOf(context).width * 0.25,
          ),
        ],
      ),
    );
  }
}
