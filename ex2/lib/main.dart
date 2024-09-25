import 'dart:io';

/*
Mô tả
Viết một chương trình Dart để tính điểm trung bình của một danh sách điểm và phân loại sinh viên dựa trên điểm số.
*/

void main() {
  try {
    List<double> diem = [];

    diem.addAll(nhapDiem());

    double dtb = diemTrungBinh(diem);

    print("Điểm trung bình: $dtb");

    if (dtb >= 9.0) {
      print("Xuất sắc");
    } else if (dtb >= 8.0) {
      print("Giỏi");
    } else if (dtb >= 6.5) {
      print("Khá");
    } else if (dtb >= 5.0) {
      print("Trung bình");
    } else {
      print("Yếu");
    }
  } catch (e) {
    print('err');
  }
}

List<double> nhapDiem() {
  print("Nhập danh sách điểm , cách nhau bởi dấu cách:");
  String input = stdin.readLineSync()!;

  List<String> diemStr = [];

  diemStr.addAll(input.split(' '));

  List<double> diem = [];

  diem.addAll(diemStr.map((e) => double.parse(e)).toList());

  // Kiểm tra điểm hợp lệ (từ 0 đến 10)
  for (double d in diem) {
    if (d < 0 || d > 10) {
      print("Điểm không hợp lệ. Vui lòng nhập lại.");
      return nhapDiem(); // Gọi lại hàm nếu có điểm không hợp lệ
    }
  }
  return diem;
}

double diemTrungBinh(List<double> diem) {
  double tongDiem = 0;
  for (double d in diem) {
    tongDiem += d;
  }
  return tongDiem / diem.length;
}
