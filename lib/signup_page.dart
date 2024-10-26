import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_backend/main.dart';
import 'package:firebase_backend/ui_helper.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password)async{
    if(email==""&& password ==""){
      UiHelper.customAlertDialog(context, "Enter Required Data");
    }
    else{
      UserCredential? usercredential;
      try{
        usercredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MyHomePage(title: "Home Page")));
          return null;
        });
      }
      on FirebaseAuthException catch(ex){
        return UiHelper.customAlertDialog(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up Page"),
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
            signUp(emailController.text.toString(), passwordController.text.toString());
          }, "Sign Up",context),
          const SizedBox(height: 16,),
        ],
      ),
    );
  }
}
