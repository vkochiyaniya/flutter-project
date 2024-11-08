import 'package:pshopapp/models/categoriesmodel.dart';
import 'package:pshopapp/models/productmodel.dart';

class FakeData {
  static List<Category>categories = [
    Category(name: "Air Purifying", image: "assets/categories/c1.png"),
    Category(name: "Low Light", image: "assets/categories/c2.png"),
    Category(name: "Succulents and Cacti", image: "assets/categories/c3.png"),
    Category(name: "Flowering", image: "assets/categories/c4.png"),
    Category(name: "Pet Friendly", image: "assets/categories/c5.png")
    
  ];

  static List<ProductmModel>products = [
    ProductmModel(productImage: "assets/products/p1.png", productname: "Snake Plant ", productPrice: 15, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
    ProductmModel(productImage: "assets/products/p2.png", productname: "ZZ Plant", productPrice: 20, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
    ProductmModel(productImage: "assets/products/p3.png", productname: "Monstera Deliciosa", productPrice: 25, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
    ProductmModel(productImage: "assets/products/p4.png", productname: "Spider Plant", productPrice: 10, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
    ProductmModel(productImage: "assets/products/p2.png", productname: "Peace Lily", productPrice: 18, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
    ProductmModel(productImage: "assets/products/p6.png", productname: "Pothos", productPrice: 12, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
    ProductmModel(productImage: "assets/products/p7.png", productname: "Fiddle Leaf Fig", productPrice: 35, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
    ProductmModel(productImage: "assets/products/p8.png", productname: "True Aloe", productPrice: 8, productDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultricies mattis posuere. Cras sit amet luctus urna. Donec non fringilla mi, sed accumsan nulla. Ut fermentum accumsan sagittis."),
  ];
}
