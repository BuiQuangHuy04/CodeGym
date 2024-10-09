import '/constants/index.dart';

class Style {
  static const appbar = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 23,
    overflow: TextOverflow.fade,
  );

  static const contentNormal = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  static const contentBigBold = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20,
  );

  static const subContent = TextStyle(
    color: Colors.grey,
  );

  static const subContentBig = TextStyle(
    color: Colors.grey,
    fontSize: 18,
  );

  static const filterContent = TextStyle(
    color: Colors.white,
    fontSize: 14
  );
}
