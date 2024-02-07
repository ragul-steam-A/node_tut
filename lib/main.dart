import 'package:flutter/material.dart';
import 'package:node_tut/providers/user_provider.dart';
import 'package:node_tut/screens/home_screen.dart';
import 'package:node_tut/screens/signup.dart';
import 'package:node_tut/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _messangerKey = GlobalKey<ScaffoldMessengerState>();
  final authService = AuthService();
  @override
  void initState() {
    super.initState();

    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      scaffoldMessengerKey: _messangerKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? const SignUpScreen()
          : const HomeScreen(),
    );
  }
}
