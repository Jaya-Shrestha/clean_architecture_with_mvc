import 'dart:convert';

import 'package:clean_architecture_with_mvc/core/model.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/data/pokemon_details/pokemon_details_model.dart';
import 'package:clean_architecture_with_mvc/features/pokemon/domain/pokemon_list/pokemon_entity.dart';

PokemonModel pokemonFromJson(String str) => PokemonModel.fromJson(json.decode(str));

class PokemonModel extends PokemonEntity with Model {
  const PokemonModel({
    required int count,
    required String next,
    required dynamic previous,
    required List<ResultModel> results,
  }) : super(count: count, next: next, previous: previous, results: results);

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<ResultModel>.from(json["results"].map((x) => ResultModel.fromJson(x))),
      );

  @override
  PokemonModel copywithModel({List<ResultModel>? results}) {
    return PokemonModel(count: count, next: next, previous: previous, results: results ?? this.results as List<ResultModel>);
  }
}

class ResultModel extends ResultEntity with Model {
  const ResultModel({
    required String name,
    required String url,
    String? img,
    PokemonDetailsModel? details,
  }) : super(
          name: name,
          url: url,
          img: img,
          details: details
        );

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        name: json["name"],
        url: json["url"],
      );

  @override
  ResultModel copywithModel() {
    return ResultModel(name: name, url: url);
  }
}
