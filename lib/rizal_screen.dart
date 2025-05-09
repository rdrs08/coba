import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:projek_29_april/login_creen.dart';
import 'package:projek_29_april/screens/home_screen.dart';

class RizalScreen extends StatefulWidget {
  const RizalScreen({super.key});

  @override
  State<RizalScreen> createState() => _RizalScreenState();
}

class _RizalScreenState extends State<RizalScreen> {
  int _bottomNavIndex = 3; // Index untuk bottom navigation

  // Icon list untuk bottom nav
  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        title: Text('Profil'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20), // Agak turun ke bawah
          child: Column(
            children: [
              // Bagian Atas (Foto + Nama)
              Container(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueGrey,
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '230103076',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Bentakan Rt1/Rw1, Baki Sukoharjo',
                      style: TextStyle(fontSize: 14, color: Colors.blueGrey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Card Data
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    // Card 1
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.edit, color: Colors.blueGrey),
                        title: Text('Edit Profil'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Aksi edit profil
                        },
                      ),
                    ),

                    SizedBox(height: 10),

                    // Card 2
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.settings, color: Colors.blueGrey),
                        title: Text('Pengaturan'),
                        trailing: Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // Aksi pengaturan
                        },
                      ),
                    ),

                    SizedBox(height: 10),

                    // Logout Button
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.logout, color: Colors.red),
                        title: Text(
                          'Logout',
                          style: TextStyle(color: Colors.red),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.red,
                        ),
                        onTap: () {
                          final box = GetStorage();
                          box.remove('username');

                          Get.offAll(() => LoginScreen());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Animated Bottom Navigation
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.softEdge,
        activeColor: Colors.blueAccent,
        inactiveColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });

          // Navigasi ke halaman sesuai index
          if (index == 0) {
            Get.off(() => HomeScreen()); // ganti sesuai route home kamu
          } else if (index == 1) {
            Get.offNamed('/search'); // ganti sesuai route search
          } else if (index == 2) {
            Get.offNamed('/favorite'); // ganti sesuai route favorite
          } else if (index == 3) {
            // Ini halaman profile, jadi tetap di sini
          }
        },
      ),
    );
  }
}
