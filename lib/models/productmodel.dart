import 'dart:convert';

class ProductModel {
  String productId;
  String name;
  String image;
  double price;
  double oldPrice;
  bool? isAvailable;
  String description;
  String? Categoryname;

  ProductModel({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.oldPrice,
    this.isAvailable,
    required this.description,
    this.Categoryname,
  });

  ProductModel copyWith({
    String? productId,
    String? name,
    String? image,
    double? price,
    double? oldPrice,
    bool? isAvailable,
    String? description,
    String? Categoryname,
  }) {
    return ProductModel(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      oldPrice: oldPrice ?? this.oldPrice,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
      Categoryname: Categoryname ?? this.Categoryname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'oldPrice': oldPrice,
      'isAvailable': isAvailable,
      'description': description,
      'Categoryname': Categoryname,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: map['productId'] as String? ?? '',
      name: map['name'] as String? ?? '',
      image: map['image'] as String? ?? '',
      price: (map['price'] as num?)?.toDouble() ?? 0.0,
      oldPrice: (map['oldPrice'] as num?)?.toDouble() ?? 0.0,
      isAvailable: map['isAvailable'] as bool? ?? true,
      description: map['description'] as String? ?? '',
      Categoryname: map['Categoryname'] as String? ?? 'Uncategorized',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductModel(productId: $productId, name: $name, image: $image, price: $price, oldPrice: $oldPrice, isAvailable: $isAvailable, description: $description, Categoryname: $Categoryname)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.productId == productId &&
        other.name == name &&
        other.image == image &&
        other.price == price &&
        other.oldPrice == oldPrice &&
        other.isAvailable == isAvailable &&
        other.description == description &&
        other.Categoryname == Categoryname;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
        name.hashCode ^
        image.hashCode ^
        price.hashCode ^
        oldPrice.hashCode ^
        isAvailable.hashCode ^
        description.hashCode ^
        Categoryname.hashCode;
  }
}
