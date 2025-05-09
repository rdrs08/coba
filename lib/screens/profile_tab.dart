import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:projek_29_april/login_creen.dart'; // pastikan ini import file login kamu

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = GetStorage(); // panggil GetStorage

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          bottom: 80, // supaya tidak ketutup tombol tambah
        ),
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.edit, color: Colors.blueGrey),
                      title: Text('Edit Profil'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 10),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.settings, color: Colors.blueGrey),
                      title: Text('Pengaturan'),
                      trailing: Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(height: 10),
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
                        // ✅ Hapus username
                        box.remove('username');

                        // ✅ Pindah ke halaman login & hapus semua history (tidak bisa back)
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
    );
  }
}
