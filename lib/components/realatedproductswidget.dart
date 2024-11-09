import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/components/errorwidget.dart';
import 'package:pshopapp/controllers/productcontroller.dart';
import 'package:pshopapp/pages/loadingScreen.dart';
import 'package:pshopapp/pages/productdetailspage.dart';

class RealatedProductsWidget extends ConsumerWidget {

  String categoryname;

  RealatedProductsWidget({required this.categoryname ,super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final realatedProducts=ref.watch(getRealatedProductsProvider(categoryname));

    return realatedProducts.when(data: (data){
      return Container(
        height: 300,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index){
           return Padding(
              padding: const EdgeInsets.all(2),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailsPage(),
                  settings: RouteSettings(arguments: data[index])
                  ));
                },
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
                          data[index].image!,
                          fit: BoxFit.fitHeight,
                          height: 150,
                        ),
                        Center(
                          child: Text(
                            data[index].name!,
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
                                "\$${data[index].price}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Old Price (Strikethrough)
                              Text(
                                "\$${data[index].oldprice}",
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
              ),
            );
          } 
          ),
      );

    }, error: (error, StackTrace)=>ErrorText(error: error.toString()), 
    loading: () => Loadingscreen());
  }
}