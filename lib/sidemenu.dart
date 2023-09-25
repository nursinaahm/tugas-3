import 'package:flutter/material.dart';
import 'package:tugas3/main.dart';
import 'package:tugas3/add_form.dart';
import 'package:tugas3/logout.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text('Menu'),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Data Pribadi'),
            onTap: () {
              // Navigasi ke halaman Home
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.add),
            title: const Text('Tambah Data Pribadi'),
            onTap: () {
              // Navigasi ke halaman Tambah Data
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddForm(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Navigasi ke halaman Logout
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LogoutPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
