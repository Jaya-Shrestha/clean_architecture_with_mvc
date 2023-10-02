import 'package:clean_architecture_with_mvc/core/presenter.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_list/pokemon_entity.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_list/pokemon_usecase.dart';
// import 'package:clean_architecture_with_mvc/features/pokemon/presentation/pokemon_list/pokemon_page.dart';
import 'package:uniform/uniform.dart';

enum SearchPokemon { name }

class PokemonListPresenter extends Presenter<PokemonEntity> {
  PokemonListUsecase get _usecase => ref.read(pokemonListUsecaseProvider);
  final formController = FormController();

  PokemonEntity? _pokemonEntity;

  @override
  PokemonEntity build() {
    TextFieldController.create(formController, tag: SearchPokemon.name).onUpdate((value) {
      _searchPokemon(value ?? '');
    });

    getPokemon(100);

    return const PokemonEntity(count: 0, next: '', previous: '', results: []);
  }

  void getPokemon(int limit) async {
    final pe = await _usecase.getPokemonList(limit);
    _pokemonEntity = pe;
    super.state = _pokemonEntity!;
  }

  void _searchPokemon(String query) {
    final filtered = <ResultEntity>[];

    for (int i = 0; i < _pokemonEntity!.results.length; i++) {
      if (_pokemonEntity!.results[i].name.contains(query)) {
        filtered.add(_pokemonEntity!.results[i]);
      }
    }

    super.state = super.state.copywith(results: filtered);
  }
}

final pokemonListPresenterProvider = PresenterProvider<PokemonListPresenter, PokemonEntity>(PokemonListPresenter.new);
