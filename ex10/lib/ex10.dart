/*
Mô tả
Trong phần này, chúng ta sẽ phát triển một ứng dụng cho phép hiển thị các số
nguyên tố nhỏ hơn 100.

Số nguyên tố là một số nguyên dương chỉ chia hết cho 1 và chính nó.

Hướng dẫn
Sử dụng vòng lặp để duyệt các số từ 2 đến 100, kiểm tra xem số nào là số nguyên
tố thì hiển thị ra màn hình.

Để kiểm tra một số có phải là số nguyên tố hay không, sử dụng thuật toán: Với
một số nguyên dương A lớn hơn 1, kiểm tra từ  2 đến căn bậc 2 của A, nếu A chia
hết cho một số trong khoảng đó thì A không phải là số nguyên tố, ngược lại A là
số nguyên tố.

Gợi ý các bước thực hiện.
Bước 1: Viết mã kiểm tra một số cho trước có phải là số nguyên tố hay không

Bước 2: Lặp lại việc kiểm tra trên từng số trong khoảng từ 2 tới 100

Chạy vòng lặp trên các số từ 2 tới 100, kiểm tra mỗi trường hợp có phải là số
nguyên tố không bằng mã đã thực hiện ở bước 1. In ra màn hình nếu gặp số nguyên
tố.
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