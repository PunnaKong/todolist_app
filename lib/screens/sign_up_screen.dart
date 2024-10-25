import 'package:flutter/material.dart';
import 'package:todolist_app/components/my_button.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screens/sign_in_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final re_passwordController = TextEditingController();

void signUp () async {
  //add data to Firebase on this is Friday!!!
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text, 
      password: passwordController.text
      );
      print("Create account!");
      
  } on FirebaseAuthException {
    print("Failed to create account!");
  } 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        
        padding: const EdgeInsets.fromLTRB(15 ,80, 15,10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to KMUTNB community', style: textTitle,),
              const SizedBox(height: 20,),
              Text('To get start, please provide create an account.', style: textSubTitle,),
              const SizedBox(height: 30,),
              MyTextField(controller: nameController, hintText: 'Enter your name', obscureText: false, labelText: 'Name'),
              const SizedBox(height: 20,),
              MyTextField(controller: emailController, hintText: 'Enter your email', obscureText: false, labelText: 'Email'),
              const SizedBox(height: 20,),
              MyTextField(controller: passwordController, hintText: 'Enter your password', obscureText: false, labelText: 'Password'),
              const SizedBox(height: 20,),
              MyTextField(controller: re_passwordController, hintText: 'Enter your password again', obscureText: false, labelText: 'Re-password'),
              const SizedBox(height: 30,),
              MyButton(onTap: signUp, hintText: 'Register Now'),
          
            const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const Text(
                        'Have a member? Back to',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                          },
                          child: const Text('Sign In.',
                              style: TextStyle(fontWeight:FontWeight.w500, color: Colors.blue),
                              ),),
                    ],
                  ),
            ],
          ),
        ),
      ),
    );
  }
}