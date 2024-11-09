import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/constants/firebaseconstants.dart';
import 'package:pshopapp/models/productmodel.dart';
import 'package:pshopapp/providers/firebaseproviders.dart';

final productServiceProvider = Provider((ref) {
  return ProductService(firestore: ref.watch(firebaseFirestoreProvider));
});

class ProductService {
  final FirebaseFirestore  _firestore;
  ProductService({
    required FirebaseFirestore firestore
  }):_firestore=firestore;


  CollectionReference get _products => _firestore.collection(FirebaseConstants.products);

  Stream<List<Product>>getProducts(){
    return _products.snapshots().map((event) {
      List<Product>products=[];
      for (var doc in event.docs){
        products.add(Product.fromMap(doc.data() as Map<String, dynamic>));
      }
      return products;
    });
  }

  Stream<Product>getProductById(String productId){
    return _products.doc(productId).snapshots()
    .map((event) => Product.fromMap((event.data()as Map<String, dynamic>))); 
  }

  Stream<List<Product>>getProductsByCategory(String categoryname){
    return _products.where("categoryname", isEqualTo: categoryname)
    .snapshots()
    .map((event){
      List<Product>products=[];
      for (var doc in event.docs){
        products.add(Product.fromMap(doc.data()as Map<String, dynamic>));
      }
      return products;
    });
  }

  Stream<List<Product>>getRealatedProducts(String categoryname){
    return _products.where("categoryname", isEqualTo: categoryname)
    .snapshots()
    .map((event){
      List<Product>products=[];
      for (var doc in event.docs){
        products.add(Product.fromMap(doc.data()as Map<String, dynamic>));
      }
      return products;
    });
  }

  
}