import 'package:authentication_page/pages/home_page.dart';
import 'package:authentication_page/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.hasData){
            // User is logged in
            return HomePage();
          }else{
            // User NOT logged in
            return LoginPage();
          }
        },
      )
    );
  }
}