import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //logo
              Icon(
                Icons.lock,
                size: 100,
                ),
          
              //welcome back ...
          
              //username textfield
          
              //password textfield
          
              // forgot password?
          
              // signin button
          
              // or continue with
          
              // google + apple signin buttons
          
              // not a member ? register now
          
            ],
          ),
        ),
      ),
    );
  }
}