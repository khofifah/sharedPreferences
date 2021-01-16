import 'dart:convert';

import 'package:belajar_flutter/utils/shared_preferences_handler.dart';
import 'package:flutter/material.dart';

class AddNumber extends StatefulWidget {
  @override
  _AddNumberState createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> with SharedPreferencesHandler {
  int dataCount;

  @override
  void initState() {
    getDataCount();
    super.initState();
  }

  getDataCount() async {
    final int countNumber = await getCountNumber();
    setState(() {
      dataCount = countNumber == null ? 0 : countNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Tambah Data Object'),
              onPressed: () {
                final data = {
                  'nama': 'khofifah',
                  'gender': 'perempuan',
                  'hobi': 'bermain musik',
                };
                final String json = jsonEncode(data);
                setObjectData(json);
              },
            ),
            ElevatedButton(
              child: Text('Tampilkan Data Object'),
              onPressed: () async {
                final json = await getObjectData();
                final data = jsonDecode(json);
                print(data);
              },
            ),
          ],
        ),
      ),
    );
  }
}
