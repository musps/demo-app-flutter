class Pokemon {
  String id;
  String name;
  String imageUrl;
  String imageUrlHiRes;
  String hp;

  Pokemon({this.id, this.name, this.imageUrl, this.imageUrlHiRes, this.hp});

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    imageUrlHiRes = json['imageUrlHiRes'] ?? '';
    hp = json['hp'] ?? '';
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'imageUrlHiRes': imageUrlHiRes,
      'hp': hp,
    };
  }

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name}, imageUrl: $imageUrl, imageUrlHiRes: $imageUrlHiRes, hp: $hp}';
  }
}
