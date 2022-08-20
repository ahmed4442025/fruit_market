class FruitModel {
  String? name;
  String? img;
  String? details;
  double? price;
  double? rate;
  bool? isFavorite;
  List<String>? nutrition;

  FruitModel(
      {this.name,
        this.img,
        this.details,
        this.price,
        this.rate,
        this.isFavorite,
        this.nutrition});

  FruitModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    details = json['details'];
    price = json['price'];
    rate = json['rate'];
    isFavorite = json['isFavorite'];
    nutrition = json['nutrition'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['img'] = img;
    data['details'] = details;
    data['price'] = price;
    data['rate'] = rate;
    data['isFavorite'] = isFavorite;
    data['nutrition'] = nutrition;
    return data;
  }
}