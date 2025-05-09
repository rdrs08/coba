import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek_29_april/screens/home_screen.dart';
import 'package:projek_29_april/login_creen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      final box = GetStorage();
      final statusUsername = box.read('username');

      if (statusUsername == null) {
        Get.off(() => LoginScreen());
      } else {
        Get.off(() => HomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.rocket_launch, size: 100),
            SizedBox(height: 100),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
