/*
Mô tả
Viết một chương trình để quản lý điểm số của học sinh trong một lớp học.
*/

void main() {
  // Tạo Map để lưu trữ tên học sinh và điểm số
  Map<String, double> studentScores = {};

  // Thêm điểm số cho 5 học sinh
  studentScores["An"] = 8.5;
  studentScores["Bình"] = 9.0;
  studentScores["Chi"] = 7.8;
  studentScores["Dung"] = 8.2;
  studentScores["Giang"] = 9.5;

  // Thêm điểm số cho học sinh mới
  themDiem(studentScores, "Huy", 8.0);

  // Cập nhật điểm số của học sinh
  capNhatDiem(studentScores, "An", 8.8);

  // Xóa học sinh
  xoaHocSinh(studentScores, "Bình");

  // In danh sách học sinh và điểm số
  print("\nDanh sách học sinh và điểm số:");
  inDanhSachDiem(studentScores);

  // Tìm và in điểm số của học sinh
  timDiemHocSinh(studentScores, "Chi");
}

// Hàm thêm điểm số cho học sinh mới
void themDiem(Map<String, double> studentScores, String ten, double diem) {
  studentScores[ten] = diem;
  print("Đã thêm điểm cho học sinh $ten.");
}

// Hàm cập nhật điểm số của học sinh
void capNhatDiem(Map<String, double> studentScores, String ten, double diem) {
  if (studentScores.containsKey(ten)) {
    studentScores[ten] = diem;
    print("Đã cập nhật điểm cho học sinh $ten.");
  } else {
    print("Học sinh $ten không tồn tại.");
  }
}

// Hàm xóa học sinh
void xoaHocSinh(Map<String, double> studentScores, String ten) {
  if (studentScores.containsKey(ten)) {
    studentScores.remove(ten);
    print("Đã xóa học sinh $ten.");
  } else {
    print("Học sinh $ten không tồn tại.");
  }
}

// Hàm in danh sách học sinh và điểm số
void inDanhSachDiem(Map<String, double> studentScores) {
  studentScores.forEach((ten, diem) {
    print("$ten: $diem");
  });
}

// Hàm tìm và in điểm số của học sinh
void timDiemHocSinh(Map<String, double> studentScores, String ten) {
  if (studentScores.containsKey(ten)) {
    double diem = studentScores[ten]!;
    print("\nĐiểm của $ten: $diem");
  } else {
    print("Học sinh $ten không tồn tại.");
  }
}
