import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SearchTab extends StatefulWidget {
  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final box = GetStorage();
  List<Map<String, String>> jadwal = [];
  List<Map<String, String>> hasilPencarian = [];

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

  void _cariJadwal(String query) {
    setState(() {
      hasilPencarian =
          jadwal.where((item) {
            final matkul = item['matkul']?.toLowerCase() ?? '';
            final hari = item['hari']?.toLowerCase() ?? '';
            return matkul.contains(query.toLowerCase()) ||
                hari.contains(query.toLowerCase());
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Cari mata kuliah atau hari...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: _cariJadwal,
          ),
          SizedBox(height: 20),
          Expanded(
            child:
                hasilPencarian.isEmpty
                    ? Center(child: Text('Belum ada hasil pencarian'))
                    : ListView.builder(
                      itemCount: hasilPencarian.length,
                      itemBuilder: (context, index) {
                        final item = hasilPencarian[index];
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
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
