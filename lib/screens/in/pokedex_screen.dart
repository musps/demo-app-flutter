import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/pokemons_provider.dart';
import 'package:testapp/widgets/bottom_menu.dart';
import 'package:testapp/widgets/user_menu_widget.dart';

class PokedexScreen extends StatefulWidget {
  final String title = 'Pokedex';

  PokedexScreen({Key key}) : super(key: key);
  _PokedexScreen createState() => _PokedexScreen();
}

class _PokedexScreen extends State<PokedexScreen> {
  @override
  void initState() {
    Future.microtask(() async {
      Provider.of<PokemonsProvider>(context, listen: false).fetchAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<PokemonsProvider>(
        builder: (context, pokemons, child) {
          return ListView.builder(
            itemCount: pokemons.items.length,
            itemBuilder: (BuildContext ctxt, int index) {
              return new Text(pokemons.items[index].name);
            }
          );
        }
      )
    );
  }
}
