import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_details/pokemon_details_entity.dart';

import 'package:clean_architecture_with_mvc/routes.dart';
import 'package:clean_architecture_with_mvc/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PokemonDetailsPage extends ConsumerWidget {
  final PokemonDetailsEntity pokemonDetails;

  const PokemonDetailsPage({super.key, required this.pokemonDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color color = Colors.primaries[((pokemonDetails.id)! - 11) % Colors.primaries.length];
    final types = pokemonDetails.types;
    // for (final stat in pokemonDetails.stats ?? []) {

    // }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.withOpacity(0.5),
        leading: IconButton(
            color: Colors.black,
            onPressed: () {
              ref.read(routerProvider).router.goNamed(AppRouterConstants.pokemon);
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              size: 30,
            )),
        title: Text(
          pokemonDetails.name!.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: color.withOpacity(0.3),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.1, 0.5, 0.8, 0.9],
            colors: [
              color.withOpacity(0.1),
              color.withOpacity(0.3),
              color.withOpacity(0.5),
              color.withOpacity(0.7),
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 650) {
              // print(constraints.maxHeight);
              // print(constraints.maxWidth);
              return Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Image.network(
                            pokemonDetails.sprites!.other.officialArtwork.frontShiny,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.all(15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Types ",
                                      style: TextStyle(fontSize: 18, color: color, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    for (final type in types ?? [])
                                      Wrap(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(width: 1, color: color),
                                                borderRadius: BorderRadius.circular(10)),
                                            child: Text(
                                              type.type.name,
                                              style: TextStyle(fontSize: 24, color: color, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  IntrinsicHeight(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(10)),
                                      padding: const EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.height_rounded,
                                            size: 40,
                                            color: color,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 2.0),
                                            child: Text('${pokemonDetails.height}m',
                                                style:
                                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: color)),
                                          ),
                                          VerticalDivider(
                                            color: color,
                                            thickness: 2,
                                            width: 20,
                                          ),
                                          Icon(
                                            Icons.balance,
                                            size: 40,
                                            color: color,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 9.0),
                                            child: Text('${pokemonDetails.weight}kgs',
                                                style:
                                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: color)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        for (final stat in pokemonDetails.stats ?? [])
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    stat.stat.name.toUpperCase(),
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${stat.baseStat}',
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: SfLinearGauge(
                                        showTicks: false,
                                        showLabels: false,
                                        ranges: [
                                          LinearGaugeRange(
                                            startValue: 0,
                                            endValue: stat.baseStat / 1.0,
                                            color: color.withOpacity(1),
                                          ),
                                        ],
                                        markerPointers: [
                                          LinearShapePointer(
                                            // value: 1,
                                            value: stat.baseStat / 1,
                                            color: color.withOpacity(1),
                                          ),
                                        ],
                                        barPointers: [
                                          LinearBarPointer(
                                            value: stat.baseStat / 1,
                                            color: color.withOpacity(1),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              print(constraints.maxHeight);
              print(constraints.maxWidth);
              return Column(
                children: [
                  Expanded(
                    child: Image.network(
                      pokemonDetails.sprites!.other.officialArtwork.frontShiny,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Text(
                          "Types ",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        for (final type in types ?? [])
                          Wrap(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: Colors.black),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  type.type.name,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  IntrinsicHeight(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(12),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const Icon(
                            Icons.height_rounded,
                            size: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: Text('${pokemonDetails.height}m',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                          const VerticalDivider(
                            thickness: 3,
                            width: 30,
                            color: Colors.black,
                          ),
                          const Icon(
                            Icons.balance,
                            size: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9.0),
                            child: Text('${pokemonDetails.weight}kgs',
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        for (final stat in pokemonDetails.stats ?? [])
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    stat.stat.name.toUpperCase(),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  '${stat.baseStat}',
                                ),
                              ),
                              Expanded(
                                child: Wrap(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SfLinearGauge(
                                        showTicks: false,
                                        showLabels: false,
                                        ranges: [
                                          LinearGaugeRange(
                                            startValue: 0,
                                            endValue: stat.baseStat / 1.0,
                                            color: color.withOpacity(1),
                                          ),
                                        ],
                                        markerPointers: [
                                          LinearShapePointer(
                                            // value: 1,
                                            value: stat.baseStat / 1,
                                            color: color.withOpacity(1),
                                          ),
                                        ],
                                        barPointers: [
                                          LinearBarPointer(
                                            value: stat.baseStat / 1,
                                            color: color.withOpacity(1),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
