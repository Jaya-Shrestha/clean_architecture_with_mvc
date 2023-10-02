import 'package:clean_architecture_with_mvc/core/entity.dart';

class PokemonDetailsEntity extends Entity {
  /// initialized to 0
  final int? height;

  final int? id;
  final String? name;
  final SpriteEntity? sprites;
  final List<StatElementEntity>? stats;
  final List<TypeEntity>? types;
  final int? weight;

  const PokemonDetailsEntity({
    this.height,
    this.id,
    this.name,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  @override
  PokemonDetailsEntity copywith() {
    return PokemonDetailsEntity(
        height: height, id: id, name: name, sprites: sprites, stats: stats, types: types, weight: weight);
  }
}

class SpriteEntity extends Entity {
  final String frontDefault;
  final OthersEntity other;

  const SpriteEntity({
    required this.frontDefault,
    required this.other,
  });

  @override
  SpriteEntity copywith() {
    return SpriteEntity(frontDefault: frontDefault, other: other);
  }
}

class OthersEntity extends Entity {
  final OfficialArtworkEntity officialArtwork;

  const OthersEntity({
    required this.officialArtwork,
  });

  @override
  OthersEntity copywith() {
    return OthersEntity(officialArtwork: officialArtwork);
  }
}

class OfficialArtworkEntity extends Entity {
  final String frontDefault;
  final String frontShiny;

  const OfficialArtworkEntity({required this.frontDefault, required this.frontShiny});

  @override
  OfficialArtworkEntity copywith() {
    return OfficialArtworkEntity(frontDefault: frontDefault, frontShiny: frontShiny);
  }
}

class StatElementEntity extends Entity {
  final int baseStat;
  final int effort;
  final TypeClassEntity stat;

  const StatElementEntity({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  @override
  StatElementEntity copywith() {
    return StatElementEntity(baseStat: baseStat, effort: effort, stat: stat);
  }
}

class TypeClassEntity extends Entity {
  final String name;
  final String url;

  const TypeClassEntity({
    required this.name,
    required this.url,
  });

  @override
  TypeClassEntity copywith() {
    return TypeClassEntity(name: name, url: url);
  }
}

class TypeEntity extends Entity {
  final int slot;
  final TypeClassEntity type;

  const TypeEntity({
    required this.slot,
    required this.type,
  });

  @override
  TypeEntity copywith() {
    return TypeEntity(slot: slot, type: type);
  }
}
