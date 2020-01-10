class PokemonListType {
  String type;
  String value;

  PokemonListType({ this.type, this.value });
  PokemonListType fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? '';
    value = json['value'] ?? '';
    return this;
  }
}

class PokemonWeaknesse extends PokemonListType {}
class PokemonResistance extends PokemonListType {}

class PokemonAttack {
  String name;
  String text;
  String damage;
  String convertedEnergyCost;
  List<dynamic> cost = [];

  PokemonAttack({ this.name, this.text, this.damage, this.convertedEnergyCost, this.cost });
  PokemonAttack.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    text = json['text'] ?? '';
    damage = json['damage'] ?? '';
    convertedEnergyCost = (json['convertedEnergyCost'] ?? '').toString();
    cost = json['cost'] ?? [];
  }
}

class Pokemon {
  String id;
  String name;
  String imageUrl;
  String imageUrlHiRes;
  String hp;
  String set;
  String series;
  List<dynamic> types = [];
  List<PokemonWeaknesse> weaknesses = [];
  List<PokemonResistance> resistances = [];
  List<PokemonAttack> attacks = [];

  Pokemon({
    this.id,
    this.name,
    this.imageUrl,
    this.imageUrlHiRes,
    this.hp,
    this.set,
    this.series,
    this.types,
    this.weaknesses,
    this.resistances,
    this.attacks,
  
  });

  Pokemon.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
    imageUrlHiRes = json['imageUrlHiRes'] ?? '';
    hp = json['hp'] ?? '';
    set = json['set'] ?? '';
    series = json['series'] ?? '';
    types = json['types'] ?? [];
    
    (json['resistances'] ?? []).forEach((resistance) {
      resistances.add((PokemonResistance()).fromJson(resistance));
    });

    (json['attacks'] ?? []).forEach((attack) {
      attacks.add(PokemonAttack.fromJson(attack));
    });
  }

  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'imageUrlHiRes': imageUrlHiRes,
      'hp': hp,
      'set': set,
      'series': series,
      'types': types,
      'weaknesses': weaknesses,
      'resistances': resistances,
      'attacks': attacks,
    };
  }

  @override
  String toString() {
    return 'Pokemon{id: $id, name: $name}';
  }
}
