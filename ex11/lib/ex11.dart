/*
Mô tả
Trong phần này, chúng ta sẽ phát triển một ứng dụng cho phép hiển thị 20 số
nguyên tố đầu tiên.
*/

import 'dart:io';
import 'dart:math';

void main() {
  // Bước 1: Nhập số lượng số nguyên tố cần in ra
  int numbers;
  do {
    stdout.write("Nhập số lượng số nguyên tố cần in ra: ");
    String? input = stdin.readLineSync();
    numbers = int.tryParse(input!) ?? 0;
    if (numbers <= 0) {
      print("Vui lòng nhập một số nguyên dương.");
    }
  } while (numbers <= 0);

  // Bước 2: Khởi tạo biến count
  int count = 0;

  // Bước 3: Khởi tạo biến N
  int N = 2;

  // Bước 4: Vòng lặp để tìm và in số nguyên tố
  print("$numbers số nguyên tố đầu tiên là:");
  while (count < numbers) {
    if (isPrime(N)) {
      print(N);
      count++;
    }
    N++;
  }
}

// Hàm kiểm tra số nguyên tố
bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i <= sqrt(number); i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}