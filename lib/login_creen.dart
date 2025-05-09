import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek_29_april/screens/home_screen.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'User Name',
                hintText: 'Enter your username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final box = GetStorage();
                box.write("username", usernameController.text);

                Get.to(() => HomeScreen());
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
