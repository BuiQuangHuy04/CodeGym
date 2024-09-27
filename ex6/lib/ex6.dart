void main() {
  Passenger passenger = Passenger(
    name: "John Doe",
    age: 25,
    isMember: true,
    memberType: "Gold",
  );
  print("${passenger}: ${checkTicketType(passenger)}");
}

class Passenger {
  String name;
  int age;
  bool isMember;
  String memberType;

  Passenger({
    required this.name,
    required this.age,
    required this.isMember,
    required this.memberType,
  });

  @override
  String toString() {
    return 'Passenger{'
        'name: $name, '
        'age: $age, '
        'isMember: $isMember, '
        'memberType: $memberType}';
  }
}

String checkTicketType(Passenger passenger) {
  if (passenger.age < 12) {
    return "Child Ticket";
  } else if (passenger.isMember) {
    if (passenger.memberType == "Gold") {
      return "Gold Member Ticket";
    } else if (passenger.memberType == "Silver") {
      return "Silver Member Ticket";
    }
  }
  return "Standard Ticket";
}
