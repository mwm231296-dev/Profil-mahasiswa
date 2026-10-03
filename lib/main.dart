import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const ProfilPage(),
    );
  }
}

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  String _nama = 'Wihdal';
  String _nim = '2024001001';
  int _semester = 5;
  bool _aktif = true;

  final TextEditingController _namaController = TextEditingController(text: 'Wihdal');
  final TextEditingController _nimController = TextEditingController(text: '2024001001');

  void _updateNama(String value) {
    setState(() => _nama = value);
    _namaController.text = value;
  }

  void _updateNim(String value) {
    setState(() => _nim = value);
    _nimController.text = value;
  }

  void _saveNama() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('✅ Data berhasil disimpan!'),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _updateSemester(int value) {
    setState(() => _semester = value);
  }

  void _toggleAktif(bool value) {
    setState(() => _aktif = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00695C),
        foregroundColor: Colors.white,
        title: const Text('Profil Mahasiswa'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== KARTU PROFIL =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFE0F2F1),
                    child: Icon(Icons.person, size: 60, color: Color(0xFF00695C)),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _nama,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text('NIM: $_nim', style: TextStyle(color: Colors.grey[600])),
                  Text('Jurusan: Teknik Informatika', style: TextStyle(color: Colors.grey[600])),
                  Text('Semester: $_semester', style: TextStyle(color: Colors.grey[600])),
                  Text(_aktif ? 'Status: Aktif' : 'Status: Tidak Aktif',
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // ===== FORM EDIT =====
            const Text(
              'Contoh StatefulWidget',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text('Ubah data di bawah. setState memperbarui kartu profil.'),
            const SizedBox(height: 16),

            // Nama
            TextField(
              controller: _namaController,
              onChanged: _updateNama,
              decoration: InputDecoration(
                labelText: 'Nama mahasiswa',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 12),

            // NIM
            TextField(
              controller: _nimController,
              onChanged: _updateNim,
              decoration: InputDecoration(
                labelText: 'Nomor NIM',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: _saveNama,
                icon: const Icon(Icons.save),
                label: const Text('Simpan nama'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[700],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Semester
            const Text(
              'Semester',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    if (_semester > 1) setState(() => _semester--);
                  },
                ),
                Text(
                  '$_semester',
                  style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => setState(() => _semester++),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Toggle Aktif
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Mahasiswa aktif',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _aktif,
                  onChanged: _toggleAktif,
                  activeColor: Colors.green,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}