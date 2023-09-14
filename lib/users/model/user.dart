class User {
  int user_id;
  String user_name;
  String user_email;
  String password;

  User(this.password, this.user_email, this.user_id, this.user_name);

  Map<String, dynamic> toJson() => {
        "user_id": user_id.toString(),
        "user_name": user_name,
        "user_email": user_email,
        "user_password": password
      };
}
