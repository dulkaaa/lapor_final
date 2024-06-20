import 'package:flutter/material.dart';
import 'package:lapor_final/my_form.dart';
import 'package:lapor_final/my_form1.dart';
import 'package:lapor_final/my_form2.dart';
import 'package:lapor_final/my_form3.dart';
import 'login_screen.dart'; 
// Import the LoginScreen file
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(), // Set LoginScreen as the initial screen
    );
  }
}
class Dashboard extends StatelessWidget {
   void _showAspirasiForm(BuildContext context) {
    // Tutup drawer jika masih terbuka
    Navigator.pop(context);

    // Navigasi ke halaman form pengaduan
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AspirasiForm()),
    );
  }
  void _showPengaduanForm(BuildContext context) {
    // Tutup drawer jika masih terbuka
    Navigator.pop(context);

    // Navigasi ke halaman form pengaduan
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PengaduanForm()),
    );
  }
  void _showKomentForm(BuildContext context) {
    // Tutup drawer jika masih terbuka
    Navigator.pop(context);

    // Navigasi ke halaman form pengaduan
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => KomentForm()),
    );
  }
    void _showEmailForm(BuildContext context) {
    // Tutup drawer jika masih terbuka
    Navigator.pop(context);

    // Navigasi ke halaman form pengaduan
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EmailForm()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 57, 3, 138),
              ),
            ),
            ListTile(
              title: Text('Aspirasi'),
              onTap: () {
                 _showAspirasiForm(context);
                // Tambahkan aksi untuk menu item 1 di sini
              },
            ),
            ListTile(
              title: Text('Pengaduan'),
              onTap: () {
                _showPengaduanForm(context);
                // Tambahkan aksi untuk menu item 2 di sini
              },
            ),
            ListTile(
              title: Text('Email'),
              onTap: () {
                _showEmailForm(context);
                // Tambahkan aksi untuk menu item 2 di sini
              },
            ),
            ListTile(
              title: Text('komentar aplikasi'),
              onTap: () {
                _showKomentForm(context);
                // Tambahkan aksi untuk menu item 2 sini
              }
            )
          ],
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(25),
        crossAxisCount: 2,
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.home, size: 110, color: Colors.blueAccent,),
                   
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.new_releases, size: 110, color: Colors.redAccent,),
                  
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.military_tech, size: 110, color: Colors.greenAccent,),
                  
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(8),
            child: InkWell(
              onTap: (){},
              splashColor: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const <Widget>[
                    Icon(Icons.android, size: 110, color: Colors.blueGrey,),
                   
                  ],
                ),
              ),
            ),
          ),
          // Tambahkan card lainnya di sini
        ],
      ),
    );
  }
}
