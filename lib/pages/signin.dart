import 'package:flutter/material.dart';
import 'package:pshopapp/pages/home.dart';
import 'package:pshopapp/pages/register.dart';
import 'package:pshopapp/services/authservice.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  Authservice _authservice = Authservice();

  final GlobalKey _formKey=GlobalKey<FormState>();
  String _email="";
  String _password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
               const SizedBox(height: 32,),
               Center(
                child: ClipRRect(borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/categories/logo.png", height: 80, width: 80,),
                ),
               ),
               const SizedBox(height: 32,),
               TextFormField(
                enableSuggestions: true,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){
               _email = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'email:',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.black, size:20),
                  alignLabelWithHint: true,
                ),
                validator: ((value) {
                  if(value!.isEmpty || !value.contains("@")){
                    return "Invalid Email Adress";
                  }
                  return null;
                }),
               ),
               const SizedBox(height: 32,),
               
                TextFormField(
                enableSuggestions: true,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value){
               _password = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'password:',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.password_outlined, color: Colors.black, size:20),
                  alignLabelWithHint: true,
                ),
                validator: ((value) {
                  if(value!.isEmpty ||value.length<6){
                    return "Password is too short";
                  }
                  return null;
                }),
               ),
               const Divider(
                thickness: 2,
               ),
               Center(
                 child: GestureDetector( onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Register(),), (route) => false);
                 },
                   child: const Text("No account? Register",
                   style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), 
                   ),
                 ),
               ),
               SizedBox(width: 300, height: 50,
               child: ElevatedButton(onPressed: (){
                _authservice.signInWithEmailAndPassword(_email.trim(), _password.trim(), context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
               }, 
               child: Text("LogIn"),
               ),
               ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}