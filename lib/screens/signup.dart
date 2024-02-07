import 'package:flutter/material.dart';
import 'package:node_tut/responisive/responsive.dart';
import 'package:node_tut/screens/login.dart';
import 'package:node_tut/services/auth_services.dart';
import 'package:node_tut/widgets/custom_text_feild.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final authService = AuthService();

  void signUp() {
    authService.signUpUser(
        context: context,
        email: mailController.text,
        password: passController.text,
        name: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFeild(
              controller: nameController,
              hintText: 'Enter Name',
            ),
            CustomTextFeild(
              controller: mailController,
              hintText: 'Enter Email Address',
            ),
            CustomTextFeild(
              controller: passController,
              hintText: 'Enter Password',
            ),
            const SizedBox(
              height: 4,
            ),
            ElevatedButton(
              onPressed: signUp,
              child: const Text('SignUp'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const LoginScreen()));
              },
              child: const Text(
                'Already a User Login',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
