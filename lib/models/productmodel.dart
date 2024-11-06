class ProductmModel {
  String? productImage;
  String? productname;
  double? productPrice;
  bool? isAvilable;
  String? productDescription;

  ProductmModel({
    required this.productImage,
    required this.productname,
    required this.productPrice,
    this.isAvilable,
    required this.productDescription
  });
}
