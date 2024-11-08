import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/models/categoriesmodel.dart';
import 'package:pshopapp/services/categoryservice.dart';

final categoriesControllerProvider = StateNotifierProvider<CategoriesController, bool>((ref){
  final categoriesService=ref.watch(categoryServiceProvider);
  return CategoriesController(categoryService: categoriesService, ref: ref);
});

final getProductsProvider = StreamProvider((ref){
  final categoriesController=ref.watch(categoriesControllerProvider.notifier);
 return categoriesController.getCategories();
});

class CategoriesController extends StateNotifier<bool>{
  final CategoryService _categoryService;
  final Ref _ref;
  
  CategoriesController({
    required CategoryService categoryService,
    required Ref ref
  }): _categoryService=categoryService,_ref=ref,super(false);

  Stream<List<Category>>getCategories(){
    return _categoryService.getCategories();
  }
}