import 'dart:io';

/*
Mô Tả: Viết một chương trình Dart để so sánh tuổi của hai người và in ra kết quả
ai là người lớn tuổi hơn.

Yêu Cầu:

Khai báo hai biến agePerson1 và agePerson2 để lưu trữ tuổi của hai người.
Sử dụng các toán tử so sánh (>, <, ==) để so sánh tuổi của hai người.
In ra màn hình ai là người lớn tuổi hơn hoặc nếu hai người bằng tuổi.
*/

void main() {
  int agePerson1 = nhapTuoi("Người 1");
  int agePerson2 = nhapTuoi("Người 2");

  print(
    agePerson1 > agePerson2
        ? "Người 1 lớn tuổi hơn người 2."
        : agePerson1 < agePerson2
            ? "Người 2 lớn tuổi hơn người 1."
            : "Hai người bằng tuổi.",
  );
}

int nhapTuoi(String tenNguoi) {
  int? tuoi;
  do {
    print("Nhập tuổi của $tenNguoi: ");
    String? input = stdin.readLineSync();
    tuoi = int.tryParse(input ?? "");
    if (tuoi == null) {
      print("Vui lòng nhập một số hợp lệ.");
    } else if (tuoi <= 0) {
      print("Tuổi phải là số dương.");
      tuoi = null;
    }
  } while (tuoi == null);
  return tuoi;
}
