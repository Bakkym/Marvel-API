import 'package:flutter/material.dart';
import 'character.dart';

class CharacterDetail extends StatelessWidget {
  final Character character;

  const CharacterDetail({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(character.description ?? 'No description available.'),
          ),
        ],
      ),
    );
  }
}
