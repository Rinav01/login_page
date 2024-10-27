import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_backend/ui_helper.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  forgotPassword(String email)async{
    if(email.isEmpty){
      return UiHelper.customAlertDialog(context, "Enter a Valid Email");
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UiHelper.customTextField(emailController, "Email", Icons.mail, false),
          const SizedBox(height: 20,),
          UiHelper.customButton(() {
            forgotPassword(emailController.text.toString());
          }, "Reset Password", context)
        ],
      ),
    );
  }
}
