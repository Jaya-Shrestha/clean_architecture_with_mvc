
import 'package:clean_architecture_with_mvc/core/entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Presenter<E extends Entity> extends Notifier<E> {
  Presenter();
}

typedef PresenterProvider<P extends Presenter<E>, E extends Entity> = NotifierProvider<P, E>;