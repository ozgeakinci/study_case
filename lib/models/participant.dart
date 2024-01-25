class Participant {
  final String id;
  final String firstName;
  final String lastName;
  final String avatar;

  Participant(this.id, this.firstName, this.lastName, this.avatar);

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      json['id'].toString(),
      json['first_name'],
      json['last_name'],
      json['avatar'],
    );
  }
}
