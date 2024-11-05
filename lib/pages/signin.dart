import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                child: Image.asset("assets/banana_plant.png", height: 80, width: 80,),
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
                keyboardType: TextInputType.emailAddress,
                onChanged: (value){
               _password = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'password:',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.black, size:20),
                  alignLabelWithHint: true,
                ),
                validator: ((value) {
                  if(value!.isEmpty ||value.length<6){
                    return "Password is too short";
                  }
                  return null;
                }),
               ),
               Divider(
                thickness: 2,
               ),
               Text("No account? Register",
               style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
               ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}