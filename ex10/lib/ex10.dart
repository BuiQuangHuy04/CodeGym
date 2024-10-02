/*
Mô tả
Trong phần này, chúng ta sẽ phát triển một ứng dụng cho phép hiển thị các số
nguyên tố nhỏ hơn 100.
*/

import 'dart:math';

void main() {
  print("Các số nguyên tố nhỏ hơn 100:");
  for (int i = 2; i < 100; i++) {
    if (isPrime(i)) {
      print(i);
    }
  }
}

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