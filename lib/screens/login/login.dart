import 'package:flutter/material.dart';
import 'package:store_app/database/app_database.dart';
import 'package:store_app/screens/home/home.dart';
import 'package:store_app/screens/register/register.dart';

// Boolean variable for keeping track of form validation

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool validationLogin = false;

  Future<void> login() async {
    // Implement login functionality here
    final username = usernameController.text;
    final password = passwordController.text;

    await AppDatabase.login(username, password).then((user) {
      if (user == null) {
        debugPrint('Login failed');
        setState(() {
          validationLogin = true;
        });

        return null;
      }

      // Clear text in password textfield
      passwordController.clear();

      // If login is success then go to Home screen and pass user who logged in
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            user: user,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 200, 117),
      body: Center(
        child: Container(
          width: 287.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 7,
                offset:
                    const Offset(0, 3), // changes the position of the shadow
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Logo
              Image.asset("assets/pics/logo.png"),
              const SizedBox(height: 50.0),
              if (validationLogin)
                RichText(
                    text: const TextSpan(
                        text: "*Username or Password incorrect",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 10,
                            fontWeight: FontWeight.bold))),
              const SizedBox(height: 5.0),
              // Username Field
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),

              // Login Button
              ElevatedButton(
                onPressed: login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // Register Button
              TextButton(
                onPressed: () {
                  // Implement register button functionality here
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text('Don’t have an account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
