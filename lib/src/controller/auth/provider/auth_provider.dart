import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../state/auth/auth_state.dart';
import '../data_source/auth_data_source.dart';

class AuthNotifier extends StateNotifier<AuthenticationState> {
  // dataSource di assign nilainya ke initial , sepertinya
  AuthNotifier(this._dataSource) : super(const AuthenticationState.initial());

  final AuthDataSource _dataSource;

  Future<void> login({required String email, required String password}) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.login(email: email, password: password);
    state = response
        .fold((error) => AuthenticationState.unauthenticated(message: error),
            (response) {
      return AuthenticationState.authenticated(user: response);
    });
  }

  Future<void> signup({
    required String email,
    required String username,
    required String namaLengkap,
    String? profileImage,
    required String password,
  }) async {
    state = const AuthenticationState.loading();
    final response = await _dataSource.signup(
        email: email,
        username: username,
        namaLengkap: namaLengkap,
        profileImage: profileImage,
        password: password);
    state = response.fold((error) => AuthenticationState.failed(message: error),
        (response) {
      return AuthenticationState.success(message: response);
    });
  }
}

final authNotifierProvider =
    StateNotifierProvider<AuthNotifier, AuthenticationState>(
  (ref) => AuthNotifier(ref.read(authDataSourceProvider)),
);
