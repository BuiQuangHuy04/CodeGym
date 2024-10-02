import 'dart:io';

void main() {
  // Tỷ giá USD sang VNĐ (ví dụ: 1 USD = 24000 VNĐ)
  const double exchangeRate = 23000;

  // Nhập giá trị tiền USD từ người dùng
  stdout.write("Nhập số tiền USD: ");
  String? input = stdin.readLineSync();

  // Chuyển đổi đầu vào thành số double
  double? usdAmount = double.tryParse(input!);

  // Kiểm tra xem đầu vào có hợp lệ không
  if (usdAmount == null) {
    print("Số tiền USD không hợp lệ.");
    return;
  }

  // Tính giá trị tiền VNĐ
  double vndAmount = usdAmount * exchangeRate;

  // In kết quả
  print("$usdAmount USD = $vndAmount VNĐ");
}