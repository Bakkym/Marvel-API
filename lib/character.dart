class Character {
  final int id;
  final String name;
  final String image;
  final String description;

  Character({required this.id, required this.name, required this.image, required this.description});

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['thumbnail']['path'] + '.' + json['thumbnail']['extension'],
      description: json['description']
    );
  }
}
