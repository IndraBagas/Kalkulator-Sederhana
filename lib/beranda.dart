// beranda.dart
import 'package:flutter/material.dart';
import 'scientific.dart';
import 'binary.dart';

class Beranda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beranda'),
      ),

//Khusus Beranda
body: Container(
        color: Color.fromARGB(255, 0, 213, 255), // Warna sebagai latar belakang
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  'HBD Count',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Sidebar(),
    );
  }
}


// Khusus Sidebar
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('HBD Corp'),
            accountEmail: null,
            currentAccountPicture: CircleAvatar(
              child: Text('HBD'),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            title: Text('Scientific'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Calculator()),
              );
            },
          ),
          ListTile(
            title: Text('Binary'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BinaryConverter()),
              );
            },
          ),
          // Tambahkan menu lainnya
        ],
      ),
    );
  }
}
