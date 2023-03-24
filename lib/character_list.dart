import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'character.dart';
import 'character_detail.dart';

class CharacterList extends StatefulWidget {
  @override
  _CharacterListState createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  // Creamos una lista vacía de personajes.
  List<Character> _characters = [];

  @override
  void initState() {
    super.initState();
    // Cuando se carga el widget, cargamos los personajes desde la API.
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    // Realizamos una petición HTTP GET a la API.
    final response = await http.get(Uri.parse(
        'https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=700d8cece9125e248a5e3dadb1c12ce5&hash=fc87213c0ba1fefeea56ebe7c27e70d3'));

    // Si la respuesta no es exitosa, lanzamos una excepción.
    if (response.statusCode != 200) {
      throw Exception('Failed to load characters');
    }

    // Si la respuesta es exitosa, convertimos el cuerpo de la respuesta de JSON a una lista de mapas.
    final List<dynamic> data = jsonDecode(response.body)['data']['results'];

    // Creamos una lista de personajes a partir de los mapas.
    final List<Character> characters =
        data.map((json) => Character.fromJson(json)).toList();

    // Actualizamos el estado del widget para incluir los personajes cargados.
    setState(() {
      _characters = characters;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    // Si no hemos cargado ningún personaje, mostramos un indicador de carga.
    if (_characters.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    // Si hemos cargado personajes, mostramos una lista de ellos.
    return ListView.builder(
      itemCount: _characters.length,
      itemBuilder: (context, index) {
        final character = _characters[index];
        return GestureDetector(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CharacterDetail(character: character)),
                ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Container(
                    height:
                        100,
                    width: 100, // Establece una altura fija para el contenedor.
                    child: Image.network(character.image, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 16),
                  Text(character.name),
                ],
              ),
            ));
      },
    );
  }
}
