import 'package:authentication_page/components/my_button.dart';
import 'package:authentication_page/components/my_textfield.dart';
import 'package:authentication_page/components/squaretile.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordConroller = TextEditingController();

  void signUserIn(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.lock,
                size: 100,
                ),
            const SizedBox(height: 50),

              //welcome back ...
            const Text(
              'Welcome Back you\'ve been missed',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          
              //username textfield
              MyTextFied(
                controller: usernameController,
                hintText: 'Username',
                obscureText: false,
              ),
          
            const SizedBox(height: 10),

              //password textfield
               MyTextFied(
                controller: passwordConroller,
                hintText: 'Password',
                obscureText: true,
               ),

               const SizedBox(height: 10),
          
              // forgot password?
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.grey[600]), 
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
          
              // signin button
              MyButton(
                onTap: signUserIn,
              ),

              const SizedBox(height: 30),
          
              // or continue with
              Padding(
                padding: const EdgeInsets.symmetric( horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style: TextStyle(color: Colors.grey[700]),
                        ),
                    ), 
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
          
              // google + apple signin buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //google button
                  SquareTile(imagePath: 'lib/images/google_logo.png'),

                  const SizedBox(width: 10),

                  //apple button
                  SquareTile(imagePath: 'lib/images/apple_logo.png'), 
                ],
              ),

              const SizedBox(height: 20),
          
              // not a member ? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[700]),
                    ),
                  const SizedBox(width: 4), 
                  const Text(
                    'Register now',
                    style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
          
            ],
          ),
        ),
      ),
    );
  }
}