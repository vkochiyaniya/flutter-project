import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/components/errorwidget.dart';
import 'package:pshopapp/pages/loadingscreen.dart';
import 'package:pshopapp/controllers/productcontroller.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(getProductsProvider);

    return products.when(
      data: (data) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
          itemCount: data.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final product = data[index];

            return Padding(
              padding: const EdgeInsets.all(2),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 1,
                child: Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      // Product Image
                      Image.network(
                        product.image!,
                        fit: BoxFit.fitHeight,
                        height: 150,
                      ),
                      Center(
                        child: Text(
                          product.name!,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Current Price
                            Text(
                              "\$${product.price}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // Old Price (Strikethrough)
                            Text(
                              "\$${product.oldPrice}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) => ErrorText(error: error.toString()),
      loading: () => const Loadingscreen(),
    );
  }
}
