class User {
  String name;
  String title;
  String img;

  User({
    required this.name,
    required this.title,
    required this.img,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      title: json['title'],
      img: json['img'],
    );
  }
}
