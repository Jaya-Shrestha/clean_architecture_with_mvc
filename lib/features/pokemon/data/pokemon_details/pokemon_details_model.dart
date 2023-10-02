import 'dart:convert';

import '../../domain/pokemon_details/pokemon_details_entity.dart';

PokemonDetailsModel pokemonDetailsModelFromJson(String str) => PokemonDetailsModel.fromJson(json.decode(str));

class PokemonDetailsModel extends PokemonDetailsEntity {
  const PokemonDetailsModel({
    required int height,
    required int id,
    required String name,
    required Sprites sprites,
    required List<StatElement> stats,
    required List<PokemonType> types, // Updated to use PokemonType
    required int weight,
  }) : super(
          height: height,
          id: id,
          name: name,
          sprites: sprites,
          stats: stats,
          types: types,
          weight: weight,
        );

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) => PokemonDetailsModel(
        height: json["height"],
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<StatElement>.from(json["stats"].map((x) => StatElement.fromJson(x))),
        types: List<PokemonType>.from(// Updated to use PokemonType
            json["types"].map((x) => PokemonType.fromJson(x))),
        weight: json["weight"],
      );
}

class Sprites extends SpriteEntity {
  const Sprites({
    required String frontDefault,
    required Other other,
  }) : super(frontDefault: frontDefault, other: other);

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json["front_default"],
        other: Other.fromJson(json["other"]),
      );
}

class Other extends OthersEntity {
  const Other({
    required OfficialArtwork officialArtwork,
  }) : super(officialArtwork: officialArtwork);

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );
}

class OfficialArtwork extends OfficialArtworkEntity {
  const OfficialArtwork({
    required String frontDefault,
    required String frontShiny,
  }) : super(frontDefault: frontDefault, frontShiny: frontShiny);

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );
}

class StatElement extends StatElementEntity {
  const StatElement({
    required int baseStat,
    required int effort,
    required TypeClass stat,
  }) : super(baseStat: baseStat, effort: effort, stat: stat);

  factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: TypeClass.fromJson(json["stat"]),
      );
}

class TypeClass extends TypeClassEntity {
  const TypeClass({
    required String name,
    required String url,
  }) : super(name: name, url: url);

  factory TypeClass.fromJson(Map<String, dynamic> json) => TypeClass(
        name: json["name"],
        url: json["url"],
      );
}

class PokemonType extends TypeEntity {
  const PokemonType({
    required int slot,
    required TypeClass type,
  }) : super(slot: slot, type: type);

  factory PokemonType.fromJson(Map<String, dynamic> json) => PokemonType(
        slot: json["slot"],
        type: TypeClass.fromJson(json["type"]),
      );
}
