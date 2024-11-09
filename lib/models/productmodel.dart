// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  String productId;
  String name;
  String image;
  double price;
  double oldprice;
  bool? isAvailable;
  String description;
  String? categoryname;
  int? qty;

  Product({
    required this.productId,
    required this.name,
    required this.image,
    required this.price,
    required this.oldprice,
    this.isAvailable,
    required this.description,
    this.categoryname,
    this.qty,
  });

  Product copyWith({
    String? productId,
    String? name,
    String? image,
    double? price,
    double? oldprice,
    bool? isAvailable,
    String? description,
    String? categoryname,
    int? qty,
  }) {
    return Product(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      oldprice: oldprice ?? this.oldprice,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
      categoryname: categoryname ?? this.categoryname,
      qty: qty ?? this.qty,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'name': name,
      'image': image,
      'price': price,
      'oldprice': oldprice,
      'isAvailable': isAvailable,
      'description': description,
      'categoryname': categoryname,
      'qty': qty,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      productId: map['productId'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      price: (map['price'] as num).toDouble(),
      oldprice: (map['oldprice'] as num).toDouble(),
      isAvailable: map['isAvailable'] != null ? map['isAvailable'] as bool : null,
      description: map['description'] as String,
      categoryname: map['categoryname'] != null ? map['categoryname'] as String : null,
      qty: map['qty'] != null ? map['qty'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Product(productId: $productId, name: $name, image: $image, price: $price, oldprice: $oldprice, isAvailable: $isAvailable, description: $description, categoryname: $categoryname, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Product &&
      other.productId == productId &&
      other.name == name &&
      other.image == image &&
      other.price == price &&
      other.oldprice == oldprice &&
      other.isAvailable == isAvailable &&
      other.description == description &&
      other.categoryname == categoryname &&
      other.qty == qty;
  }

  @override
  int get hashCode {
    return productId.hashCode ^
      name.hashCode ^
      image.hashCode ^
      price.hashCode ^
      oldprice.hashCode ^
      isAvailable.hashCode ^
      description.hashCode ^
      categoryname.hashCode ^
      qty.hashCode;
  }
}
