import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pshopapp/controllers/authcontroller.dart';
import 'package:pshopapp/views/checkoutscreen.dart';
import 'package:pshopapp/widgets/errortext.dart';
import 'package:pshopapp/widgets/loader.dart';

class CheckOutBottomNav extends ConsumerWidget {
  const CheckOutBottomNav({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
    final currentUser = FirebaseAuth.instance.currentUser;
    final userProvider = ref.watch(getUserDataProvider(currentUser!.uid));
    return userProvider.when(
        data: (data) {
          return data.cart!=null
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckOutScreen()));
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child:const Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                            Center(
                              child:  Text(
                                "Proceed To CheckOut",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox();
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => Loader());
  }
}
