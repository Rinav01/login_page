import 'package:firebase_backend/uihelper.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          UiHelper.customButton(() {}, "Login",context),
          const SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account ? ",style: TextStyle(fontSize: 16),),
              TextButton(onPressed: () {}, child: const Text("Sign Up",style: TextStyle(fontWeight: FontWeight.bold),))
            ],
          )
        ],
      ),
    );

  }
}
