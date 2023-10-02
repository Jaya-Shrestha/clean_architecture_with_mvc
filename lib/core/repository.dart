// final _clientProvider = Provider(
//   (_) => APIClient(baseUrl: 'https://pokeapi.co/api/v2/pokemon?limit=10'),
// );

// class APIClient {
//   APIClient({required String baseUrl});
// }

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Repository {
  final Ref ref;
  SharedPreferences? sharedPreferences;

  Repository(this.ref) {
    _init();
  }
  // APIClient get api => ref.read(_clientProvider);

  void setCache({required String key, required String value}) {
    unawaited(sharedPreferences!.setString(key, value));
  }

  Future<String?> getCache({required String key}) async {
    return sharedPreferences!.getString(key);
  }

  void deletecache({required String key}) {
    sharedPreferences!.remove(key);
  }

  Future<void> _init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }
}

typedef RepositoryProvider<R extends Repository> = Provider<R>;
