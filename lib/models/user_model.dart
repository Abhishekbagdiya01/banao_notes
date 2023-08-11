class UserModel {
  String? id;
  String? name;

  String? email;
  UserModel({this.id, this.name, this.email});

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(id: map['id'], name: map['name'], email: map['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
