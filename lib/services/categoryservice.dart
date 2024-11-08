import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/constants/firebaseconstants.dart';
import 'package:pshopapp/models/categoriesmodel.dart';
import 'package:pshopapp/providers/firebaseproviders.dart';

final categoryServiceProvider = Provider((ref) => CategoryService(firestore: ref.watch(firebaseFirestoreProvider)));

class CategoryService {
  final FirebaseFirestore _firestore;

  CategoryService({
    required FirebaseFirestore firestore
  }): _firestore=firestore;

CollectionReference get _categories => _firestore.collection(FirebaseConstants.categories);

  Stream<List<Category>>getCategories(){
    return _categories.snapshots().map((event){
      List<Category>categoriesList = [];
      for (var doc in event.docs){
        categoriesList.add(Category.fromMap(doc.data() as Map<String, dynamic>));
      }
      return categoriesList;
    });
  }
}