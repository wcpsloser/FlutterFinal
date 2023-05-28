import 'package:flutter/material.dart';
import 'package:store_app/screens/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.r
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
            primaryColorDark: Colors.grey.shade700,
            primarySwatch: Colors.amber,
            backgroundColor: Colors.amber.shade300,
            errorColor: Colors.redAccent),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
