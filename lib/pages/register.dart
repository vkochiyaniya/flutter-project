import 'package:flutter/material.dart';
import 'package:pshopapp/pages/signin.dart';
import 'package:pshopapp/services/authservice.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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
               const  SizedBox(height: 32,),

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
                  hintText: 'confirm password:',
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.password_outlined, color: Colors.black, size:20),
                  alignLabelWithHint: true,
                ),
                validator: ((value) {
                  if(value != _password){
                    return "Password is not matched";
                  }
                  return null;
                }),
               ),
               const Divider(
                thickness: 2,
               ),
               Center(
                 child: GestureDetector( onTap: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SignIn(),), (route) => false);
                 },
                   child: const Text("Already have an account? SignIn",
                   style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold), 
                   ),
                 ),
               ),
               SizedBox(width: 300, height: 50,
               child: ElevatedButton(onPressed: (){
                _authservice.signUpWithEmailAndPassword(_email.trim(), _password.trim(), context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SignIn()));
               }, 
               child: Text("Register"),
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