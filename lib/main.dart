import 'package:flutter/material.dart';
import 'package:tugas3/sidemenu.dart';
import 'package:tugas3/add_form.dart';
import 'package:tugas3/PersonalData.dart'; 
import 'package:tugas3/login_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key); 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PersonalData personalData = PersonalData();
  List data = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });

    List getData = await personalData.getData();
    setState(() {
      data = getData.reversed.toList();
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pribadi'), 
        backgroundColor: Colors.teal[200],
      ),
      drawer: const Sidemenu(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (_, item) {
                return Column(
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(10),
                      // Ubah bagian berikut sesuai dengan konteks data pribadi
                      leading: Icon(Icons.person),
                      title: Text(
                        'Nama: ${data[item]['name']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        'Alamat: ${data[item]['address']} \n'
                        'NIM: ${data[item]['nim']}',
                      ),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddForm(),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 245, 176, 142),
      ),
    );
  }
}
