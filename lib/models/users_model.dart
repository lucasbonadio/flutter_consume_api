class UserData {
  int? id;
  String? name;
  String? email;

  UserData({this.id, this.name, this.email});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}
