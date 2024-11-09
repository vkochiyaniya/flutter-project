import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/models/productmodel.dart';
import 'package:pshopapp/services/productservice.dart';

final productsControllerProvider = StateNotifierProvider<ProductController, bool>((ref) {
  final productsService = ref.watch(productServiceProvider);
  return ProductController(productService: productsService, ref: ref); 
});


final getProductsProvider = StreamProvider((ref) => ref.watch(productsControllerProvider.notifier).getProducts());
final getProductsByCategoryProvider = StreamProvider.family((ref, String categoryname){
  return ref.watch(productsControllerProvider.notifier).getProductsByCategoryName(categoryname);
});
class ProductController extends StateNotifier<bool> {
  final ProductService _productService;
  final Ref _ref;

  ProductController({
    required ProductService productService, 
    required Ref ref,
  })  : _productService = productService,
        _ref = ref,
        super(false);

  Stream<List<Product>> getProducts() {
    return _productService.getProducts();
  }

  Stream<Product> getProductById(String productId) {
    return _productService.getProductById(productId);
  }

  Stream<List<Product>>getProductsByCategoryName(String categoryname){
    return _productService.getProductsByCategory(categoryname);
  }
}
