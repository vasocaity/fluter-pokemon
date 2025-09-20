import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonDetail {
  const PokemonDetail({
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.height,
  });

  final String name;
  final String imageUrl;
  final int weight;
  final int height;
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<PokemonDetail> pokemonDetail;

  @override
  void initState() {
    super.initState();

    pokemonDetail = _fetchPokemonDetail();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<PokemonDetail> _fetchPokemonDetail() async {
    final uri = Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.id}');
    final res = await http.get(uri);
    if (res.statusCode != 200) throw Exception('Failed to load Pokémon');
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    return PokemonDetail(
      name: body['name'] as String,
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${widget.id}.png',
      weight: body['weight'] as int,
      height: body['height'] as int,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: FutureBuilder<PokemonDetail>(
        future: pokemonDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final pokemon = snapshot.data!;
          return Center(
            child: Column(
              children: [
                Image.network(pokemon.imageUrl, width: 100, height: 200),
                Text(pokemon.name),
                Text(pokemon.weight.toString()),
                Text(pokemon.height.toString()),
              ],
            ),
          );
        },
      ),
    );
  }
}
