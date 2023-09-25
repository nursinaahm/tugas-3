import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'PersonalData.dart';

class AddForm extends StatefulWidget {
  const AddForm({Key? key}) : super(key: key);

  @override
  _AddFormState createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController nim = TextEditingController();

  DateTime selectedDate = DateTime.now();

  PersonalData personalData = PersonalData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data Pribadi'),
        backgroundColor: Colors.teal[200],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nama'),
                controller: name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nama Anda';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Alamat'),
                controller: address,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan alamat Anda';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nomor Telepon'),
                controller: phoneNumber,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan nomor telepon Anda';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'NIM'), // Mengubah label
                controller: nim, // Mengubah controller
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Masukkan NIM Anda'; // Mengubah pesan validasi
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal[900], // Warna tombol
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    personalData.saveData(
                      name.text,
                      address.text,
                      phoneNumber.text,
                      nim.text,
                    );

                    Navigator.pop(context);
                  }
                },
                child: Text('Simpan Data'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
