import 'package:clean_architecture_with_mvc/core/entity.dart';

import '../../data/pokemon_details/pokemon_details_model.dart';

class PokemonEntity extends Entity {
  @override
  PokemonEntity copywith({List<ResultEntity>? results}) {
    return PokemonEntity(count: count, next: next, previous: previous, results: results ?? this.results,
    );
  }

  final int count;
  final String next;
  final dynamic previous;
  final List<ResultEntity> results;

  const PokemonEntity({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}

class ResultEntity extends Entity {
  @override
  ResultEntity copywith({String? img, PokemonDetailsModel? details}) {
    return ResultEntity(name: name, url: url, img: img ?? this.img, details: details ?? this.details);
  }

  final String name;
  final String url;
  final String? img;
  final PokemonDetailsModel? details;

  const ResultEntity({required this.name, required this.url, this.img, this.details});
}
