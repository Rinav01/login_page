import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_backend/forgot_password.dart';
import 'package:firebase_backend/main.dart';
import 'package:firebase_backend/signup_page.dart';
import 'package:firebase_backend/ui_helper.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email,String password)async{
    if(email.isEmpty || password.isEmpty){
      return UiHelper.customAlertDialog(context, "Enter Required Data");
    }
    else{
      UserCredential ? usercredential;
      try{
        usercredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: "Login")));
          return null;
        });
      }
      on FirebaseAuthException catch(e){
        return UiHelper.customAlertDialog(context, e.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(emailController,"Email",Icons.mail,false),
          const SizedBox(height: 16,),
          UiHelper.customTextField(passwordController, "Password", Icons.password, true),
          const SizedBox(height: 30,),
          UiHelper.customButton(() {
            login(emailController.text.toString(), passwordController.text.toString());
          }, "Login",context),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account ? ",style: TextStyle(fontSize: 16),),
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupPage()));
              }, child: const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),))
            ],
          ),
          const SizedBox(height:2,),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
          }, child: const Text("Forgot Password ?? ",style: TextStyle(fontSize: 20),))
        ],
      ),
    );

  }
}
