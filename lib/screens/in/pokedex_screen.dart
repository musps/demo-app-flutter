import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/providers/pokemons_provider.dart';
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
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: pokemons.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8,  right: 8, top: 15, bottom: 10),
            child: ListTile(
              onTap: () => print('ok'),
              title: Text(pokemons.items[index].name),
              leading: FadeInImage.memoryNetwork(
                image: pokemons.items[index].imageUrl,
                placeholder: kTransparentImage
              )
            ),
          );
        }
      )
    );
  }
}
