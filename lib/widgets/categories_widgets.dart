import 'package:pshopapp/controllers/categoriescontroller.dart';
import 'package:pshopapp/views/productsbycategory.dart';
import 'package:pshopapp/widgets/errortext.dart';
import 'package:pshopapp/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesWidget extends ConsumerWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 130, 
      child: ref.watch(categoriesProvider).when(
        data: (data) => ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductsByCategoryPage(),
                      settings: RouteSettings(arguments: data[index]),
                    ),
                  );
                },
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16), 
                    color: Colors.grey[200],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          data[index].image.toString(),
                          fit: BoxFit.cover,
                          height: 60,
                          width: 60,
                        ),
                      ),
                      const SizedBox(height: 8), 
                      Flexible(
                        child: Text(
                          data[index].name.toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis, 
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => Loader(),
      ),
    );
  }
}
