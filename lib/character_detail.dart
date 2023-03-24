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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                character.image,
                fit: BoxFit.cover,
              ),
            ),

            //CHARACTER NAME
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  character.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),

            // DESCRIPTION
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'DESCRIPTION',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                character.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),

            //CHARACTER INFO
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Comics available: ' + character.comics.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Series available: ' + character.series.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Stories available: ' + character.stories.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Events available: ' + character.events.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),

            // TOP 3 SERIES
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top series:',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 8.0),
                  for (var i = 0; i < character.seriesNames.length; i++)
                    Text(
                      '${i + 1}. ${character.seriesNames[i]}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
