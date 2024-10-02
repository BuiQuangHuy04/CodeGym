/*
Mô tả
Giả sử bạn đang tham gia viết chương trình cho máy đo chiều cao cân nặng, hãy
viết một chương trình có khả năng đọc các số nguyên không âm có tối đa 3 chữ số.

Ví dụ, với số 261, chương trình in ra màn hình two hundred and sixty one.
*/

import 'dart:io';

void main() {
  stdout.write("Nhập một số nguyên (tối đa 3 chữ số): ");
  String? input = stdin.readLineSync();

  // Kiểm tra đầu vào
  if (input == null || input.isEmpty) {
    print("Vui lòng nhập một số.");
    return;
  }

  int? number = int.tryParse(input);
  if (number == null) {
    print("Đầu vào không hợp lệ.");
    return;
  }

  if (number < 0 || number > 999) {
    print("Số phải là số nguyên không âm và có tối đa 3 chữ số.");
    return;
  }

  // Chuyển đổi số thành chữ
  String result = convertNumberToWords(number);
  print(result);
}

String convertNumberToWords(int number) {
  if (number == 0) {
    return "zero";
  }

  List<String> units = [
    "",
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "ten",
    "eleven",
    "twelve",
    "thirteen",
    "fourteen",
    "fifteen",
    "sixteen",
    "seventeen",
    "eighteen",
    "nineteen"
  ];

  List<String> tens = [
    "",
    "",
    "twenty",
    "thirty",
    "forty",
    "fifty",
    "sixty",
    "seventy",
    "eighty",
    "ninety"
  ];

  String result = "";

  if (number >= 100) {
    result += "${units[number ~/ 100]} hundred";
    number %= 100;
    if (number != 0) {
      result += " and ";
    }
  }

  if (number >= 20) {
    result += "${tens[number ~/ 10]} ";
    number %= 10;
  }

  if (number > 0) {
    result += "${units[number]} ";
  }

  return result.trim();
}