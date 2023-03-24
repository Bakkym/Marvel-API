import 'dart:ffi';

class Character {
  final int id;
  final String name;
  final String image;
  final String description;
  final int comics;
  final int series;
  final int stories;
  final int events;


  Character({required this.id, required this.name, required this.image, required this.description, required this.comics, required this.series, required this.stories, required this.events});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      description: validateDescription(json['description']),
      comics: json['comics']['available'],
      series: json['series']['available'],
      stories: json['stories']['available'],
      events: json['events']['available'],

      
    );
  }
}
String validateDescription(String description){
  if (description == ''){
    description = 'Description empty';
    return description;
  } else {
    return description;
  }
}
