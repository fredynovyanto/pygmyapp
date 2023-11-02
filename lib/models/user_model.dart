class UserModel {
  String uid;
  String? email;
  String? username;
  String? role;

  UserModel(
      {required this.uid,
      this.email,
      this.username,
      this.role});

}