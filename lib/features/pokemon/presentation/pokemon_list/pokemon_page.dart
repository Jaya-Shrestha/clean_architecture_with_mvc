import 'package:clean_architecture_with_mvc/features/pokemon/presentation/pokemon_list/pokemon_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:uniform/uniform.dart';
import '../../../../routes_constants.dart';

class PokemonPage extends ConsumerWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonList = ref.watch(pokemonListPresenterProvider.notifier);
    final pokemon = ref.watch(pokemonListPresenterProvider);

    return InputForm(
      controller: pokemonList.formController,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.6),
              expandedHeight: 150,
              pinned: false,
              snap: false,
              floating: true,
              title: const Padding(
                padding: EdgeInsets.only(top: 18.0),
                child: Text(
                  "Pokémon",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
              bottom: AppBar(
                title: TextInputFieldBuilder(
                    tag: SearchPokemon.name,
                    builder: (_, controller, textController) {
                      return TextFormField(
                        controller: textController,
                        onChanged: controller.onChanged,
                        decoration: InputDecoration(
                          hintText: 'Enter a search term',
                          filled: true,
                          fillColor: Theme.of(context).primaryColor.withOpacity(0.6),
                        ),
                      );
                    }),
              ),
            ),
            SliverToBoxAdapter(
                child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'total: ${pokemon.results.length}',
                style: const TextStyle(color: Colors.white, fontSize: 28),
              ),
            )),
            SliverFillRemaining(
              child: pokemon.count == 0
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      itemCount: pokemon.results.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, childAspectRatio: 1, mainAxisSpacing: 12, crossAxisSpacing: 12),
                      itemBuilder: (context, index) {
                        final Color color = Colors.primaries[(index - 11) % Colors.primaries.length];
                        return InkWell(
                          onTap: () {
                            context.goNamed(AppRouterConstants.details, extra: pokemon.results[index].details);
                          },
                          child: Container(
                            constraints: const BoxConstraints(
                              minHeight: 500,
                              minWidth: 500,
                            ),
                            color: color.withOpacity(0.4),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    pokemon.results[index].name.toUpperCase(),
                                    style:
                                        const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: Image.network(
                                    pokemon.results[index].img ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.goNamed(AppRouterConstants.login);
          },
          child: const Icon(
            Icons.logout,
            size: 20,
          ),
        ),
      ),
    );
  }
}
