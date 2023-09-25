import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalData {
  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> dataStrings = prefs.getStringList('personal_data') ?? [];

    return dataStrings
        .map((data) => json.decode(data) as Map<String, dynamic>)
        .toList();
  }

  saveData(
    String name,
    String address,
    String phoneNumber,
    String nim,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> dataList = prefs.getStringList('personal_data') ?? [];

    Map<String, String> newData = {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'NIM': nim,
    };

    dataList.add(jsonEncode(newData));
    prefs.setStringList(
      'personal_data',
      dataList,
    );
  }
}
