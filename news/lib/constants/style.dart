import '/constants/index.dart';

class Style {
  static const appbarTitle = TextStyle(
    color: Color(0xFFFFFFFF),
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
    color: Color(0xFF9E9E9E),
  );

  static const subContentBig = TextStyle(
    color: Color(0xFF9E9E9E),
    fontSize: 18,
  );

  static const elevatedTextBtn = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const textBtn = TextStyle(
    color: Colors.green,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const titleConfirmDialog = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const contentConfirmDialog = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
}

class AppDuration {
  static const slow = Duration(milliseconds: 2000);
  static const normal = Duration(milliseconds: 1000);
  static const fast = Duration(milliseconds: 500);
}

class AppBorderRadius {
  static const normal = 14.0;
}

class AppPadding {
  static const extra = 20.0;
  static const big = 15.0;
  static const normal = 10.0;
  static const small = 5.0;
}