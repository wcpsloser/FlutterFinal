import 'package:flutter/material.dart';
import 'package:store_app/database/app_database.dart';
import 'package:store_app/screens/home/home.dart';
import 'package:store_app/screens/register/register.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          width: 300.0,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
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
              const FlutterLogo(
                size: 150.0,
              ),
              const SizedBox(height: 50.0),

              // Username Field
              TextField(
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
                onPressed: () async {
                  // Implement login functionality here
                  final username = usernameController.text;
                  final password = passwordController.text;

                  await AppDatabase.login(username, password).then((user) {
                    if (user == null) {
                      debugPrint('Login failed');
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
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Login',
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
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
