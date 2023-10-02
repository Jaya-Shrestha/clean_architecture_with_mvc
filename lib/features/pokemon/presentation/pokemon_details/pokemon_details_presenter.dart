import 'package:clean_architecture_with_mvc/core/presenter.dart';

import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_details/pokemon_details_entity.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_list/pokemon_usecase.dart';

// enum PokemonDetailsTags { height, id, name, sprites, stats, types, weight }

class PokemonDetailsPresenter extends Presenter<PokemonDetailsEntity> {
  PokemonListUsecase get _usecase => ref.read(pokemonListUsecaseProvider);
  @override
  PokemonDetailsEntity build() {
    return const PokemonDetailsEntity();
  }

  Future<PokemonDetailsEntity> fetchPokemonDetails(url) async {
    return await _usecase.fetchPokemonDetails(url);
  }


}

final pokemonDetailsPresenterProvider =
    PresenterProvider<PokemonDetailsPresenter, PokemonDetailsEntity>(PokemonDetailsPresenter.new);
