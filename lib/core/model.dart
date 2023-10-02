import 'package:meta/meta.dart';

abstract mixin class Model {
  @override
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }

  @useResult
  Model copywithModel();
}
