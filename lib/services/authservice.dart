import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authservice {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?>get authStatechange => _firebaseAuth.authStateChanges();

  Future<void>signInWithEmailAndPassword(String email, String password, BuildContext context) async{
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    }
    on FirebaseAuthException catch(e){
      await showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Erorr Occured"),
        content: Text(e.toString()),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("OK"),),
        ],
      ));
    }
  }

  Future<void>signUpWithEmailAndPassword(String email, String password, BuildContext context)async{
    try{
      _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e) {
      await showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Error Occured"),
        content: Text(e.toString()),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      ),
      );
    } catch(e){
      if(e=='email already in used'){
        showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Error Occured"),
        content: Text("Email already is use"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      ),);
      } else {
        showDialog(context: context, builder: (context) => AlertDialog(
        title: Text("Error Occured"),
        content: Text("Error:$e"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text("Ok"))
        ],
      ),);
      }
    }
  }
  Future<void>signOut() async{
    await _firebaseAuth.signOut();
  }
}