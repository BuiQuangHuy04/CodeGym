void main() {
  // Tạo danh sách sinh viên ban đầu
  List<String> students = ["An", "Bình", "Chi"];

  // Thêm sinh viên mới
  themSinhVien(students, "Dung");

  // Xóa sinh viên
  xoaSinhVien(students, "Bình");

  // Tìm vị trí của sinh viên
  timViTriSinhVien(students, "Chi");

  // In số lượng sinh viên
  print("Số lượng sinh viên: ${students.length}");

  // In danh sách sinh viên
  print("Danh sách sinh viên: $students");
}

void themSinhVien(List<String> students, String tenSinhVien) {
  students.add(tenSinhVien);
  print("Đã thêm $tenSinhVien vào danh sách.");
}

void xoaSinhVien(List<String> students, String tenSinhVien) {
  students.remove(tenSinhVien);
  print("Đã xóa $tenSinhVien khỏi danh sách.");
}

void timViTriSinhVien(List<String> students, String tenSinhVien) {
  int position = students.indexOf(tenSinhVien);
  if (position != -1) {
    print("Vị trí của $tenSinhVien: $position");
  } else {
    print("Không tìm thấy $tenSinhVien trong danh sách.");
  }
}