import 'dart:io';
import 'dart:math';

/*
Mô tả
Viết một chương trình Dart sử dụng các phương thức xử lý số để tính tổng, trung bình cộng, và căn bậc hai của các số trong một danh sách.
*/

void main() {
  try {
    List<double> diem = [];

    diem.addAll(nhapDiem());

    // Tính tổng
    double sum = diem.reduce((a, b) => a + b);
    print('Tổng: $sum');

    // Tính trung bình cộng
    double average = sum / diem.length;
    print('Trung bình cộng: $average');

    // Tính căn bậc hai và in kết quả
    print('Căn bậc hai:');
    for (double number in diem) {
      var squareRoot = sqrt(number).toStringAsFixed(2);
      print('$number: $squareRoot');
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
