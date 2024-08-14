import 'package:authentication_page/components/my_button.dart';
import 'package:authentication_page/components/my_textfield.dart';
import 'package:authentication_page/components/squaretile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controllers
  final emailController = TextEditingController();

  final passwordConroller = TextEditingController();

  void signUserIn() async {
    // show loading circle
    showDialog(
      context: context, 
      builder: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );

    // try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text, 
      password: passwordConroller.text,
      );
      
      // pop the loading circle
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      // pop the loading circle
      Navigator.pop(context);
      // Show error message
      showErrorMessage(e.code);
    }
  }

  //wrong email popup
  void showErrorMessage( String message){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          backgroundColor: Colors.deepPurple,
          title: Center(
            child: Text(
              message,
              style: const TextStyle(color:Colors.white),
            ),
          ), 
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
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
                  controller: emailController,
                  hintText: 'Email',
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(imagePath: 'lib/images/google_logo.png'),
            
                    SizedBox(width: 10),
            
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
      ),
    );
  }
}