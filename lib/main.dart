import 'package:flutter/material.dart';

import 'character_list.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CharacterList(),
    );
  }
}
