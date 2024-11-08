import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/models/productmodel.dart';
import 'package:pshopapp/services/productservice.dart';

final productsControllerProvider = StateNotifierProvider<ProductController, bool>((ref) {
  final productsService = ref.watch(productServiceProvider);
  return ProductController(productService: productsService, ref: ref); 
});


final getProductsProvider = StreamProvider((ref) => ref.watch(productsControllerProvider.notifier).getProducts());

class ProductController extends StateNotifier<bool> {
  final ProductService _productService;
  final Ref _ref;

  ProductController({
    required ProductService productService, 
    required Ref ref,
  })  : _productService = productService,
        _ref = ref,
        super(false);

  Stream<List<ProductModel>> getProducts() {
    return _productService.getProducts();
  }

  Stream<ProductModel> getProductById(String productId) {
    return _productService.getProductById(productId);
  }
}
