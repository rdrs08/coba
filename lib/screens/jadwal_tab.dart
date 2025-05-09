import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class JadwalTab extends StatefulWidget {
  @override
  _JadwalTabState createState() => _JadwalTabState();
}

class _JadwalTabState extends State<JadwalTab> {
  final box = GetStorage();
  List<Map<String, String>> jadwal = [];

  @override
  void initState() {
    super.initState();
    _loadJadwal();
  }

  void _loadJadwal() {
    final data = List.from(box.read('jadwal') ?? []);
    jadwal =
        data.map<Map<String, String>>((item) {
          return item.map(
            (key, value) => MapEntry(key.toString(), value.toString()),
          );
        }).toList();
  }

  void _hapusJadwal(int index) {
    setState(() {
      jadwal.removeAt(index);
      box.write('jadwal', jadwal);
    });
  }

  void _tambahJadwal() {
    final matkulController = TextEditingController();
    final hariController = TextEditingController();
    final jamController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Tambah Jadwal'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: matkulController,
                  decoration: InputDecoration(labelText: 'Mata Kuliah'),
                ),
                TextField(
                  controller: hariController,
                  decoration: InputDecoration(labelText: 'Hari'),
                ),
                TextField(
                  controller: jamController,
                  decoration: InputDecoration(labelText: 'Jam'),
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Batal'),
                onPressed: () => Navigator.pop(context),
              ),
              ElevatedButton(
                child: Text('Simpan'),
                onPressed: () {
                  setState(() {
                    jadwal.add({
                      'matkul': matkulController.text,
                      'hari': hariController.text,
                      'jam': jamController.text,
                    });
                    box.write('jadwal', jadwal);
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: jadwal.length,
        itemBuilder: (context, index) {
          final item = jadwal[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
            margin: EdgeInsets.only(bottom: 10),
            child: ListTile(
              leading: Icon(Icons.book, color: Colors.blue),
              title: Text(item['matkul'] ?? ''),
              subtitle: Text('${item['hari']} • ${item['jam']}'),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _hapusJadwal(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahJadwal,
        child: Icon(Icons.add),
      ),
    );
  }
}
