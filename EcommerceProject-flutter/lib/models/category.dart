class Category {
  final int id;
  final String name;
  final String imageUrl;

  Category({this.id, this.name, this.imageUrl});


  factory Category.fromJson(Map<dynamic, dynamic> json) {
    return Category(
      id: json["id"],
      name: json["name"],
      imageUrl: json["imgUrl"],
    );
  }

  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,

      };
}

