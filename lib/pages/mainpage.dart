import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/components/homecategorywidget.dart';
import 'package:pshopapp/components/productwidget.dart';
import 'package:pshopapp/components/searchdelegate.dart';

class MainPage extends ConsumerWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: SearchProducts(ref));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Card(
                elevation: 1,
                child: SizedBox(
                  height: height * 0.070,
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.black,
                        ),
                        suffixIcon: Icon(Icons.tune),
                        hintText: 'Searcg Product',
                        hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                        contentPadding: EdgeInsets.only(top: 12)),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const HomeCategoryWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Plants",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ProductWidget(),
              )
            ],
          ),
        ));
  }
}
