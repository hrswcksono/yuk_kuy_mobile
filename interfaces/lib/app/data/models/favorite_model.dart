class FavoriteModel {
  final int id;
  final String name;
  final int price;
  final String dateStart;
  final String dateEnd;
  final String image;

  FavoriteModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.dateStart,
      required this.dateEnd,
      required this.image});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'dateStart': dateStart,
      'dateEnd': dateEnd,
      'image': image
    };
  }

  FavoriteModel.fromMap(Map map)
      : id = map['id'],
        name = map['name'],
        price = map['price'],
        dateStart = map['dateStart'],
        dateEnd = map['dateEnd'],
        image = map['image'];
}
