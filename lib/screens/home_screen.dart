import 'package:flutter/material.dart';
import 'package:node_tut/providers/user_provider.dart';
import 'package:node_tut/responisive/responsive.dart';
import 'package:node_tut/services/auth_services.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void signOutUser(BuildContext context) {
    AuthService().signOut(context);
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => signOutUser(context),
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Responsive(
        child: Column(
          children: [
            Text(user.name),
            Text(user.email),
          ],
        ),
      ),
    );
  }
}
