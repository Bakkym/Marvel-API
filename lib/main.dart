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
        fontFamily: 'Alkatra',
        textTheme: TextTheme(
          displayLarge: TextStyle(fontSize: 32, color: Colors.red),
          bodyMedium: TextStyle(fontSize: 13),
          bodyLarge: TextStyle(fontSize: 20, color: Colors.green)
        )

      ),
      home: CharacterList(),
    );
  }
}
