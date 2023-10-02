import 'dart:convert';
import 'package:clean_architecture_with_mvc/features/pokemon/data/pokemon_details/pokemon_details_model.dart';

import 'package:clean_architecture_with_mvc/features/pokemon/data/pokemon_list/pokemon_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/repository.dart';

const pokemonListX50 = 'pokemonList50';

class PokemonListRepository extends Repository {
  final _pokemonDetail = <PokemonDetailsModel>[];

  PokemonListRepository(super.ref);

  Future<PokemonModel> getPokemonList(int limit) async {
    final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=$limit'));

    // deletecache(key: pokemonListX50);

    final cacheString = await getCache(key: pokemonListX50);

    if (cacheString != null) {
      final cacheJson = jsonDecode(cacheString);
      return _getPokemonModel((cacheJson as Map<String, dynamic>));
    }

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setCache(key: pokemonListX50, value: jsonEncode(json));    
      return _getPokemonModel(json);
    } else {
      throw Exception('unable to fetch pokemon');
    }
  }

  Future<PokemonModel> _getPokemonModel(Map<String, dynamic> json) async {
    final pokemonModel = PokemonModel.fromJson(json);
    final updatedList = <ResultModel>[];
    for (int i = 0; i < pokemonModel.results.length; i++) {
      final pokemonDetail = await fetchPokemonDetails(pokemonModel.results[i].url);
      _pokemonDetail.add(pokemonDetail);
      ResultModel newModel = ResultModel(
        name: pokemonModel.results[i].name,
        url: pokemonModel.results[i].url,
        img: pokemonDetail.sprites!.other.officialArtwork.frontShiny,
        details: pokemonDetail,
      );

      updatedList.add(newModel);
    }    
    final pa = pokemonModel.copywithModel(results: updatedList);    
    return pa;
  }

  Future<PokemonDetailsModel> fetchPokemonDetails(String url) async {
    final responseDetails = await http.get(Uri.parse(url));
    return PokemonDetailsModel.fromJson(jsonDecode(responseDetails.body));
  }
}

final pokemonListRepositoryProvider = RepositoryProvider(PokemonListRepository.new);
