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
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
            character.image,
            fit: BoxFit.cover,
            ),
         
          ),
          Text(
            character.name,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(character.description),
          Text(
            'Comics available: ' + character.comics.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Series available: ' + character.series.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Stories available: ' + character.stories.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Events available: ' + character.events.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
