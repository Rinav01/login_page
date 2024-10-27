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

  signUp(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      UiHelper.customAlertDialog(context, "Enter Required Data");
    } else {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: "Home Page")),
        );
      } on FirebaseAuthException  catch (e) {
        UiHelper.customAlertDialog(context, "An unexpected error occurred");
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
          UiHelper.customTextField(emailController, "Email", Icons.mail, false),
          const SizedBox(height: 16),
          UiHelper.customTextField(passwordController, "Password", Icons.password, true),
          const SizedBox(height: 30),
          UiHelper.customButton(() {
            signUp(emailController.text.trim(), passwordController.text.trim());
          }, "Sign Up", context),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
