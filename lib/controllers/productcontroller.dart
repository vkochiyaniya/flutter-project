import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/components/searchdelegate.dart';
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

final getRealatedProductsProvider = StreamProvider.family((ref, String categoryname){
  return ref.watch(productsControllerProvider.notifier).getRealatedProducts(categoryname);
});

final searchProductsProvider=StreamProvider.family((ref, String search){
  return ref.watch(productsControllerProvider.notifier).searchProducts(search);
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

  Stream<List<Product>>getRealatedProducts(String categoryname){
    return _productService.getRealatedProducts(categoryname);
  }

  Stream<List<Product>>searchProducts(String search){
    return _productService.searchProducts(search);
  }
}
