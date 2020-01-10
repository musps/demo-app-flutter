import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/models/pokemon_model.dart';
import 'package:testapp/providers/pokemons_provider.dart';
import 'package:testapp/widgets/user_menu_widget.dart';
import 'package:transparent_image/transparent_image.dart';

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
    var pokemons = Provider.of<PokemonsProvider>(context);

    ListTile pokemonTile({ @required Pokemon pokemon, Function onTap }) {
      return ListTile(
        title: Text(pokemon.name),
        trailing: Text(pokemon.id),
        subtitle: Text('hp: ${pokemon.hp}'),
        onTap: onTap,
        leading: FadeInImage.memoryNetwork(
          image: pokemon.imageUrl,
          placeholder: kTransparentImage
        )
      );
    }

    void _showModalSheet({ @required Pokemon pokemon }) {
      showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(children: [
                pokemonTile(pokemon: pokemon),
                Column(
                  children: [
                    Text('Series: ${pokemon.series}'),
                    Text('Set: ${pokemon.set}'),
                    Text('Types', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ...pokemon.types.map((item) => Text(item)).toList(),
                    Text('Weaknesses', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ...pokemon.weaknesses.map((n) => Text('type: ${n.type}, value: ${n.value}')).toList(),
                    Text('Attacks', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ...pokemon.attacks.map((n) => Text('name: ${n.name}, damage: ${n.damage}')).toList(),
                    Text('Resistances', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    ...pokemon.resistances.map((n) => Text('type: ${n.type}, value: ${n.value}')).toList(),
                  ],
                )
              ]),
            )
          );
        }
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: Drawer(child: UserMenuWidget()),
      body: ListView.builder(
        itemCount: pokemons.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8,  right: 8, top: 15, bottom: 10),
            child: pokemonTile(
              pokemon: pokemons.items[index],
              onTap: () => _showModalSheet(pokemon: pokemons.items[index]),
            )
          );
        }
      )
    );
  }
}
