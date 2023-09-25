import 'package:flutter/material.dart';
import 'package:tugas3/main.dart';
import 'package:tugas3/PersonalData.dart';
import 'package:intl/intl.dart';

class AddForm extends StatefulWidget {
  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nimController = TextEditingController();

  final PersonalData _personalData = PersonalData();

  void _savePersonalData() {
    _personalData.saveData(
      _nameController.text,
      _addressController.text,
      _phoneNumberController.text,
      _nimController.text,
    );

    // Tambahkan logika lain jika diperlukan, seperti menampilkan pesan sukses.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Pribadi'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            TextFormField(
              controller: _nimController,
              decoration: InputDecoration(labelText: 'NIM'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _savePersonalData,
              child: Text('Simpan Data'),
            ),
          ],
        ),
      ),
    );
  }
}
