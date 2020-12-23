class User {
  final String name;
  final String token;
  final String email;
  final List bag;
  final List favorite;
  final bool isAdmin;

  User(
      {this.name,
      this.token,
      this.bag,
      this.email,
      this.favorite,
      this.isAdmin});

  factory User.fromJson(Map<dynamic, dynamic> json) {
    return User(
        name: json["name"],
        token: json["token"],
        bag: json["bag"],
        email: json["email"],
        favorite: json['favorite'],
        isAdmin: json['isAdmin']);
  }

  Map<dynamic, dynamic> toJson() => {
        "name": name,
        "token": token,
        "bag": bag,
        "email": email,
        "favorite": favorite,
        "isAdmin": isAdmin
      };
}
