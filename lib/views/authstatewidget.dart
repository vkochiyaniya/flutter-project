import 'package:pshopapp/controllers/authcontroller.dart';
import 'package:pshopapp/router.dart';
import 'package:pshopapp/views/home.dart';
import 'package:pshopapp/views/signin.dart';
import 'package:pshopapp/widgets/errortext.dart';
import 'package:pshopapp/widgets/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState extends ConsumerWidget {
  const AuthState({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final authState=ref.watch(authStateChangeProvider);
    return authState.when(data: ( data){
      if(data!=null)return Home();
      return  SignIn();

    }, error:(error,stackTrace)=>ErrorText(error: error.toString()), loading: ()=>Loader());
    
  }
}