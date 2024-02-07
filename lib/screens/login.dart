import 'package:flutter/material.dart';
import 'package:node_tut/responisive/responsive.dart';
import 'package:node_tut/screens/signup.dart';
import 'package:node_tut/services/auth_services.dart';
import 'package:node_tut/widgets/custom_text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final mailController = TextEditingController();
  final passController = TextEditingController();
  final authService = AuthService();

  void signInUser() {
    authService.signInUser(
        email: mailController.text.trim(),
        password: passController.text.trim(),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              onPressed: signInUser,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SignUpScreen()));
              },
              child: const Text(
                'New User SignUp',
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
