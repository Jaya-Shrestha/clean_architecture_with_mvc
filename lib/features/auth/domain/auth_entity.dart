import 'package:clean_architecture_with_mvc/core/entity.dart';

class AuthEntity extends Entity {
  // const AuthEntity();
  @override
  AuthEntity copywith() {
    return AuthEntity();
  }
}
