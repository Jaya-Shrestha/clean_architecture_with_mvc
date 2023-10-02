import 'package:clean_architecture_with_mvc/features/pokemon/data/pokemon_list/pokemon_repo.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_details/pokemon_details_entity.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_list/pokemon_entity.dart';
import '../../../../core/usecase.dart';

class PokemonListUsecase extends Usecase {
  PokemonListUsecase(super.ref);

  PokemonListRepository get _repo => ref.read(pokemonListRepositoryProvider);
  Future<PokemonEntity> getPokemonList(int limit) async {
    return await _repo.getPokemonList(limit);
    
  }

  Future<PokemonDetailsEntity> fetchPokemonDetails(url) async {
    return await _repo.fetchPokemonDetails(url);
  }

  
}

final pokemonListUsecaseProvider = UsecaseProvider<PokemonListUsecase>(PokemonListUsecase.new);
