import 'dart:convert';

import 'package:rw_courses/constants/index.dart';
import 'package:http/http.dart' as http;

class CourseRepo implements Repository {
  @override
  Future<List<Data>> getListData(int domainFilter) async {
    final List<Data> data = [];

    var url = Constants.RW_API;

    if (domainFilter != Constants.allFilter) {
      url += '&filter[domain_ids][]=$domainFilter';
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final res = Res.fromJson(json);

      if(res.data != null) {
        for (var d in res.data!) {
          if(d.id != null && d.attributes != null) {
            data.add(d);
          }
        }
      }

      return data;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
