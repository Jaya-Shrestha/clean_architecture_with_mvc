import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class Usecase {
  final ProviderRef<Object> ref;

  Usecase(this.ref);
}

typedef UsecaseProvider<U extends Usecase> = Provider<U>;
