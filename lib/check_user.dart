import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_backend/login_page.dart';
import 'package:firebase_backend/main.dart';
import 'package:flutter/material.dart';

class CheckUser extends StatelessWidget {
  const CheckUser({super.key});

  // This function now returns a Future<bool>
  Future<bool> isUserLoggedIn() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: isUserLoggedIn(),
      builder: (context, snapshot) {
        // Check for completion
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("An error occurred"));
        } else if (snapshot.hasData && snapshot.data == true) {
          // If user is logged in, navigate to Home Page
          return const MyHomePage(title: "Home Screen");
        } else {
          // If user is not logged in, navigate to Login Page
          return const Loginpage();
        }
      },
    );
  }
}
