import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final box = GetStorage();
  String? username;
  List<Map<String, String>> jadwal = [];

  @override
  void initState() {
    super.initState();
    username = box.read('username');
    _loadJadwal();
  }

  void _loadJadwal() {
    jadwal = List<Map<String, String>>.from(box.read('jadwal') ?? []);
  }

  List<Map<String, String>> get jadwalMingguIni {
    return jadwal.take(3).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, ${username ?? 'User'} 👋',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text(
            'Selamat belajar, semoga harimu produktif!',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          SizedBox(height: 20),
          Divider(),
          Text(
            'Jadwal Minggu Ini',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ...jadwalMingguIni.map(
            (item) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              margin: EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: Icon(Icons.book, color: Colors.blue),
                title: Text(item['matkul'] ?? ''),
                subtitle: Text('${item['hari']} • ${item['jam']}'),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(),
          SizedBox(height: 10),
          Text(
            'Informasi Penting',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.notifications, color: Colors.orange),
              title: Text('Pengisian KRS dibuka hingga 10 Mei'),
            ),
          ),
          SizedBox(height: 10),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            child: ListTile(
              leading: Icon(Icons.event, color: Colors.green),
              title: Text('Libur Nasional: 15 Mei 2025'),
            ),
          ),
        ],
      ),
    );
  }
}
