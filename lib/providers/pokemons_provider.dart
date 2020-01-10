import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:testapp/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

class PokemonsProvider with ChangeNotifier {
  static final String endpoint = 'https://api.pokemontcg.io/v1/cards';
  List<Pokemon> items = [
    Pokemon(id: '1', name: 'name', imageUrl: 'https://images.pokemontcg.io/dp6/90.png'),
    Pokemon(id: '1', name: 'name', imageUrl: 'https://images.pokemontcg.io/dp6/90.png'),
    Pokemon(id: '1', name: 'name', imageUrl: 'https://images.pokemontcg.io/dp6/90.png'),
    Pokemon(id: '1', name: 'name', imageUrl: 'https://images.pokemontcg.io/dp6/90.png'),
  ];

  Future<void> fetchAll() async {
    final response = await http.get(endpoint);

     if (response.statusCode == 200) {
       Map<String, dynamic> tmp = jsonDecode(response.body);

       for (var item in tmp['cards']) {
         items.add(Pokemon.fromJson(item));
       }
       notifyListeners();
       print('ko');
     }
  }
}
