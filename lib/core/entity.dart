import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class Entity extends Equatable {
  const Entity();

  @override
  List<Object> get props => [];

  @useResult
  Entity copywith();
}
