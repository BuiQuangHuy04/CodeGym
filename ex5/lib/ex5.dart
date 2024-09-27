void main() {
  Candidate candidate1 = Candidate(name: "Ánh", age: 18, isRegistered: false);
  Candidate candidate2 = Candidate(name: "Huy", age: 23, isRegistered: true);

  checkValid(candidate1);
  checkValid(candidate2);
}

void checkValid(Candidate candidate) {
  candidate.isEligible()
      ? print("${candidate.name} đủ điều kiện tham gia cuộc thi")
      : print("${candidate.name} không đủ điều kiện tham gia cuộc thi.");
}

class Candidate {
  String name;
  int age;
  bool isRegistered;

  Candidate({
    required this.name,
    required this.age,
    required this.isRegistered,
  });

  bool isEligible() {
    return age >= 18 && isRegistered;
  }
}
