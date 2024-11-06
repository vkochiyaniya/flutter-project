import 'package:flutter/material.dart';
import 'package:pshopapp/fakedata/fakedata.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    childAspectRatio: 2/3,
    ),
    itemCount: FakeData.products.length,
    shrinkWrap: true,
    physics: ClampingScrollPhysics(),
    scrollDirection: Axis.vertical,
    itemBuilder: (context, index) {
      return Padding(padding: EdgeInsets.all(2),
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
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              Image.asset(FakeData.products[index].productImage!,
              fit: BoxFit.fitHeight,
              height: 150,
              ),
              Center(child: Text(FakeData.products[index].productname!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.bold
              ),
              ),
              ),
              const SizedBox(height: 16,),
              Text("\$${FakeData.products[index].productPrice}",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.green,
                fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
      );
    },
    );
  }
}