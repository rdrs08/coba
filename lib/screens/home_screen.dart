import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek_29_april/theme_controller.dart';

import 'home_tab.dart';
import 'search_tab.dart';
import 'jadwal_tab.dart';
import 'profile_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _bottomNavIndex = 0;

  final iconList = <IconData>[
    Icons.home,
    Icons.search,
    Icons.favorite,
    Icons.person,
  ];

  // List halaman/tab
  final List<Widget> _pages = [
    HomeTab(),
    SearchTab(),
    JadwalTab(),
    ProfileTab(),
  ];

  // Storage untuk simpan index terakhir
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    // Baca index terakhir dari penyimpanan
    _bottomNavIndex = box.read('nav_index') ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
        title: Text(
          'My Schedule App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () {
              final themeController = Get.find<ThemeController>();
              themeController.toggleTheme();
            },
          ),
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1A237E), Color(0xFFFFD700)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),

      body: IndexedStack(index: _bottomNavIndex, children: _pages),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Get.isDarkMode ? Colors.blueAccent : Colors.blue,
        onPressed: () {
          Get.snackbar('Info', 'FAB Diklik');
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        activeColor: Color(0xFFFFD700), // gold
        inactiveColor: Colors.grey[400],
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        backgroundColor:
            Get.isDarkMode
                ? Color(0xFF303030)
                : Color(0xFF1A237E), // navy or dark gray
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            box.write('nav_index', index);
          });
        },
      ),
    );
  }
}
