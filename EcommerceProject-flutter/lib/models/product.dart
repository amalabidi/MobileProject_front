class Product {
  final String id;
  final String name;
  final String description;
  final String moreInfo;
  final double price;
  final String category;
  final List<String> imgsUrl;
  final String color;

  Product(
      {this.id,
      this.name,
      this.description,
      this.moreInfo,
      this.category,
      this.price,
      this.imgsUrl,
      this.color});

  Product.fromJson(Map<dynamic, dynamic> json)
      : category = json["category"],
        id = json["_id"],
        name = json["name"],
        description = json["description"],
        moreInfo = json["moreInfo"],
        price = double.parse(json["price"]),
        imgsUrl = List<String>.from(json["imgUrls"].map((x) => x)),
        color = json["color"];


  Map<dynamic, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "moreInfo": moreInfo,
        "price": price,
        "imgUrls": imgsUrl,
        "color":color
      };
}
